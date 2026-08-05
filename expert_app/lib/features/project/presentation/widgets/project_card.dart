import 'package:flutter/material.dart';

import '../../../../l10n/generated/app_localizations.dart';
import '../../domain/entities/project_entity.dart';

String projectStatusLabel(AppLocalizations l10n, ProjectStatus status) {
  return switch (status) {
    ProjectStatus.planning => l10n.projectStatusPlanning,
    ProjectStatus.inProgress => l10n.projectStatusInProgress,
    ProjectStatus.completed => l10n.projectStatusCompleted,
  };
}

class ProjectCard extends StatelessWidget {
  final ProjectEntity project;
  final VoidCallback? onTap;

  const ProjectCard({super.key, required this.project, this.onTap});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final overBudget = project.budgetPlanned != null && project.estimatedCost > project.budgetPlanned!;
    final progress = project.budgetPlanned != null && project.budgetPlanned! > 0
        ? (project.estimatedCost / project.budgetPlanned!).clamp(0, 1).toDouble()
        : null;

    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(project.title, style: theme.textTheme.titleMedium),
                  ),
                  Chip(
                    label: Text(projectStatusLabel(l10n, project.status)),
                    visualDensity: VisualDensity.compact,
                  ),
                ],
              ),
              if (project.roomCount != null) ...[
                const SizedBox(height: 4),
                Text(l10n.projectRoomCountShort(project.roomCount!), style: theme.textTheme.bodySmall),
              ],
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${l10n.projectEstimatedCostLabel}: ${project.estimatedCost.toStringAsFixed(0)}₼',
                    style: theme.textTheme.bodySmall
                        ?.copyWith(color: overBudget ? theme.colorScheme.error : null),
                  ),
                  if (project.budgetPlanned != null)
                    Text(
                      '${l10n.projectBudgetPlannedLabel}: ${project.budgetPlanned!.toStringAsFixed(0)}₼',
                      style: theme.textTheme.bodySmall,
                    ),
                ],
              ),
              if (progress != null) ...[
                const SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: progress,
                    minHeight: 6,
                    color: overBudget ? theme.colorScheme.error : theme.colorScheme.primary,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
