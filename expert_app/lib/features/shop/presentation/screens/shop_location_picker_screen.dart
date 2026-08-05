import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';

import '../../../../l10n/generated/app_localizations.dart';

class ShopLocationResult {
  final double latitude;
  final double longitude;
  final String address;

  const ShopLocationResult({
    required this.latitude,
    required this.longitude,
    required this.address,
  });
}

/// Bakı mərkəzi — istifadəçinin cari yeri alına bilmədikdə başlanğıc nöqtə.
const _defaultCenter = LatLng(40.4093, 49.8671);

class ShopLocationPickerScreen extends StatefulWidget {
  const ShopLocationPickerScreen({super.key});

  @override
  State<ShopLocationPickerScreen> createState() => _ShopLocationPickerScreenState();
}

class _ShopLocationPickerScreenState extends State<ShopLocationPickerScreen> {
  final _mapController = MapController();
  LatLng _center = _defaultCenter;
  String? _address;
  bool _isResolving = false;
  bool _isLocating = false;
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _resolveAddress(_center);
    _goToCurrentLocation();
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  Future<void> _goToCurrentLocation() async {
    setState(() => _isLocating = true);
    try {
      var permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        return;
      }
      if (!await Geolocator.isLocationServiceEnabled()) return;

      final position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(accuracy: LocationAccuracy.medium),
      );
      if (!mounted) return;
      final target = LatLng(position.latitude, position.longitude);
      _mapController.move(target, 16);
      setState(() => _center = target);
      _resolveAddress(target);
    } catch (_) {
      // Məkan alına bilmədi — default mərkəzdə qalır.
    } finally {
      if (mounted) setState(() => _isLocating = false);
    }
  }

  void _onMapMoved(LatLng center) {
    _center = center;
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 600), () => _resolveAddress(center));
  }

  Future<void> _resolveAddress(LatLng point) async {
    setState(() => _isResolving = true);
    try {
      final uri = Uri.parse(
        'https://nominatim.openstreetmap.org/reverse?format=jsonv2&lat=${point.latitude}&lon=${point.longitude}&accept-language=az',
      );
      final response = await http.get(uri, headers: const {'User-Agent': 'ExperTikinti-App/1.0'});
      if (!mounted) return;
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        setState(() => _address = data['display_name'] as String?);
      }
    } catch (_) {
      // Şəbəkə xətası — istifadəçi yenə də koordinatı seçə bilər.
    } finally {
      if (mounted) setState(() => _isResolving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.shopLocationPickerTitle)),
      body: Stack(
        children: [
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              initialCenter: _center,
              initialZoom: 12,
              onPositionChanged: (position, hasGesture) {
                if (hasGesture) _onMapMoved(position.center);
              },
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.expert.expert_app',
              ),
            ],
          ),
          const IgnorePointer(
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(bottom: 36),
                child: Icon(Icons.location_pin, size: 44, color: Colors.red),
              ),
            ),
          ),
          Positioned(
            right: 16,
            bottom: 140,
            child: FloatingActionButton.small(
              heroTag: 'my-location',
              onPressed: _isLocating ? null : _goToCurrentLocation,
              child: _isLocating
                  ? const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.my_location),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: SafeArea(
              child: Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.15),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.place_outlined, size: 18),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            _isResolving
                                ? l10n.shopLocationResolving
                                : (_address ?? l10n.shopLocationUnresolved),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: _address == null
                          ? null
                          : () => Navigator.of(context).pop(
                                ShopLocationResult(
                                  latitude: _center.latitude,
                                  longitude: _center.longitude,
                                  address: _address!,
                                ),
                              ),
                      child: Text(l10n.shopLocationConfirmButton),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
