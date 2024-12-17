import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../providers/filters_provider.dart';


@immutable
class AppFilters{
  const AppFilters._();

  static Future<void> showFilterTasksDialog(BuildContext context) async {

    AlertDialog alert = AlertDialog(
      title: const Text('Filtrar tareas'),
      content: Consumer( // Usamos StatefulBuilder
        builder: (context, ref, _) {
          final taskFilter = ref.watch(taskFilterProvider);
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: taskFilter.showPending,
                    onChanged: (value) => ref.read(taskFilterProvider.notifier).togglePending(),
                  ),
                  const Text('Pendientes'),
                  const SizedBox(width: 8.0),
                  Checkbox(
                    value: taskFilter.showCompleted,
                    onChanged: (value) => ref.read(taskFilterProvider.notifier).toggleCompleted(),
                  ),
                  const Text('Completadas'),
                ],
              ),
            ],
          );
        },
      ),
      actions: [
        FilterDialogActions(),
      ],
    );

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

class FilterDialogActions extends ConsumerWidget {
  const FilterDialogActions({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancelar'),
        ),
        TextButton(
          onPressed: () {
            final filtersApplied = ref.read(taskFilterProvider.notifier).areFiltersApplied();
            if (!filtersApplied) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Debes seleccionar al menos una opción.')),
              );
              return;
            }
            final taskFilter = ref.read(taskFilterProvider);
            print("Pendientes: ${taskFilter.showPending}, Completadas: ${taskFilter.showCompleted}");
            Navigator.pop(context);
          },
          child: const Text('Filtrar'),
        ),
      ],
    );
  }
}