import 'package:flutter/material.dart';
import 'package:listar/utils/utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:listar/data/data.dart';
import 'package:listar/providers/providers.dart';
import 'package:go_router/go_router.dart';

@immutable
class AppAlerts {
  const AppAlerts._();

  static displaySnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: context.textTheme.bodyMedium,
        ),
        backgroundColor: context.colorScheme.onSecondary,
      ),
    );
  }

  static Future<void> showAlertDeleteDialog({
    required BuildContext context,
    required WidgetRef ref,
    required Task task,
  }) async {
    Widget cancelButton = TextButton(
      child: const Text('NO'),
      onPressed: () => context.pop(),
    );
    Widget deleteButton = TextButton(
      onPressed: () async {
        await ref.read(tasksProvider.notifier).deleteTask(task).then(
          (value) {
            displaySnackbar(
              context,
              'Tarea borrada exitosamente!',
            );
            context.pop();
          },
        );
      },
      child: const Text('SI'),
    );

    AlertDialog alert = AlertDialog(
      title: const Text('Estas seguro que deseas eliminar la tarea?'),
      actions: [
        deleteButton,
        cancelButton,
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
