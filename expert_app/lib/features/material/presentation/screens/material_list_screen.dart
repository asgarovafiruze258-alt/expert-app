import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/widgets/empty_state_view.dart';
import '../../../../core/widgets/error_view.dart';
import '../../../../core/widgets/loading_indicator.dart';
import '../../../../l10n/generated/app_localizations.dart';
import '../../../order/presentation/widgets/cart_icon_button.dart';
import '../providers/material_providers.dart';
import '../widgets/material_card.dart';

class MaterialListScreen extends ConsumerStatefulWidget {
  final String? categoryId;
  final String? categoryName;

  const MaterialListScreen({super.key, this.categoryId, this.categoryName});

  @override
  ConsumerState<MaterialListScreen> createState() => _MaterialListScreenState();
}

class _MaterialListScreenState extends ConsumerState<MaterialListScreen> {
  bool? _sortByPriceAsc;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final materials = ref.watch(materialsListProvider(
      (categoryId: widget.categoryId, sortByPriceAsc: _sortByPriceAsc),
    ));

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryName ?? l10n.navMaterials),
        actions: [
          PopupMenuButton<bool?>(
            tooltip: l10n.sortLabel,
            icon: const Icon(Icons.sort),
            initialValue: _sortByPriceAsc,
            onSelected: (value) => setState(() => _sortByPriceAsc = value),
            itemBuilder: (context) => [
              PopupMenuItem(value: null, child: Text(l10n.sortDefault)),
              PopupMenuItem(value: true, child: Text(l10n.sortPriceAsc)),
              PopupMenuItem(value: false, child: Text(l10n.sortPriceDesc)),
            ],
          ),
          const CartIconButton(),
        ],
      ),
      body: materials.when(
        loading: () => const LoadingIndicator(),
        error: (error, _) => ErrorView(
          message: error is Failure ? error.message : error.toString(),
        ),
        data: (items) {
          if (items.isEmpty) return EmptyStateView(message: l10n.emptyMaterials);
          return GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 0.68,
            ),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final material = items[index];
              return MaterialCard(
                material: material,
                onTap: () => context.push('/materials/${material.id}'),
              );
            },
          );
        },
      ),
    );
  }
}
