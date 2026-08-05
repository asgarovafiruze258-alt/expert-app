import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/widgets/empty_state_view.dart';
import '../../../../core/widgets/error_view.dart';
import '../../../../core/widgets/loading_indicator.dart';
import '../../../../l10n/generated/app_localizations.dart';
import '../../../ai/presentation/widgets/budget_estimate_sheet.dart';
import '../../domain/entities/project_entity.dart';
import '../providers/project_providers.dart';
import '../widgets/add_project_item_sheet.dart';
import '../widgets/project_card.dart';
import '../widgets/project_item_tile.dart';

class ProjectDetailScreen extends ConsumerWidget {
  final String projectId;

  const ProjectDetailScreen({super.key, required this.projectId});

  void _openAddItemSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => AddProjectItemSheet(projectId: projectId),
    );
  }

  void _openBudgetEstimateSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => BudgetEstimateSheet(projectId: projectId),
    );
  }

  Future<void> _confirmDelete(BuildContext context, WidgetRef ref) async {
    final l10n = AppLocalizations.of(context);
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.projectDeleteConfirmTitle),
        content: Text(l10n.projectDeleteConfirmMessage),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(l10n.projectCancelButton),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(l10n.projectDeleteConfirmButton),
          ),
        ],
      ),
    );
    if (confirmed != true) return;
    final success = await ref.read(projectControllerProvider.notifier).delete(projectId);
    if (success && context.mounted) context.pop();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final projectAsync = ref.watch(projectDetailProvider(projectId));

    return Scaffold(
      appBar: AppBar(
        title: projectAsync.value != null ? Text(projectAsync.value!.title) : null,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outline),
            onPressed: () => _confirmDelete(context, ref),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openAddItemSheet(context),
        child: const Icon(Icons.add),
      ),
      body: projectAsync.when(
        loading: () => const LoadingIndicator(),
        error: (error, _) => ErrorView(
          message: error is Failure ? error.message : error.toString(),
        ),
        data: (project) {
          return ListView(
            padding: const EdgeInsets.only(bottom: 24),
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProjectCard(project: project),
                    const SizedBox(height: 12),
                    DropdownButtonFormField<ProjectStatus>(
                      initialValue: project.status,
                      decoration: const InputDecoration(border: OutlineInputBorder()),
                      items: ProjectStatus.values
                          .map((status) => DropdownMenuItem(
                                value: status,
                                child: Text(projectStatusLabel(l10n, status)),
                              ))
                          .toList(),
                      onChanged: (status) {
                        if (status != null) {
                          ref.read(projectControllerProvider.notifier).updateStatus(projectId, status);
                        }
                      },
                    ),
                    const SizedBox(height: 12),
                    OutlinedButton.icon(
                      onPressed: () => _openBudgetEstimateSheet(context),
                      icon: const Icon(Icons.auto_awesome),
                      label: Text(l10n.aiBudgetEstimateButton),
                    ),
                  ],
                ),
              ),
              const Divider(height: 1),
              Consumer(
                builder: (context, ref, _) {
                  final items = ref.watch(projectItemsProvider(projectId));
                  return items.when(
                    loading: () => const Padding(
                      padding: EdgeInsets.all(24),
                      child: LoadingIndicator(),
                    ),
                    error: (error, _) => ErrorView(
                      message: error is Failure ? error.message : error.toString(),
                    ),
                    data: (list) {
                      if (list.isEmpty) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 24),
                          child: EmptyStateView(message: l10n.projectItemsEmpty),
                        );
                      }
                      return Column(
                        children: [for (final item in list) ProjectItemTile(item: item)],
                      );
                    },
                  );
                },
              ),
              const SizedBox(height: 72),
            ],
          );
        },
      ),
    );
  }
}
