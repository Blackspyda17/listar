import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:listar/data/data.dart';
import 'package:listar/providers/providers.dart';
import 'package:listar/utils/utils.dart';
import 'package:listar/widgets/widgets.dart';

class DisplayListOfTasks extends ConsumerWidget {
  const DisplayListOfTasks({
    super.key,
    this.isCompletedTasks = false,
    required this.tasks,
  });
  final bool isCompletedTasks;
  final List<Task> tasks;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceSize = context.deviceSize;
    final height =
        isCompletedTasks ? deviceSize.height * 0.25 : deviceSize.height * 0.3;
    final emptyTasksAlert = isCompletedTasks
        ? 'No hay Tareas completadas aun'
        : 'Aun no hay Tareas pendientes';

    return  Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Gap(20),
        Text(
         isCompletedTasks ? 'Completadas' : 'Pendientes',
          style: context.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        CommonContainer(
          height: height,
          child: tasks.isEmpty
              ? Center(
                  child: Text(
                    emptyTasksAlert,
                    style: context.textTheme.titleMedium,
                  ),
                )
              :
                  ListView.separated(
                      shrinkWrap: true,
                      itemCount: tasks.length,
                      padding: EdgeInsets.zero,
                      itemBuilder: (ctx, index) {
                        final task = tasks[index];

                        return InkWell(
                          onLongPress: () async {
                            await AppAlerts.showAlertDeleteDialog(
                              context: context,
                              ref: ref,
                              task: task,
                            );
                          },
                          onTap: () async {
                            await showModalBottomSheet(
                              context: context,
                              builder: (ctx) {
                                return TaskDetails(task: task);
                              },
                            );
                          },
                          child: TaskTile(
                            task: task,
                            onCompleted: (value) async {
                              await ref
                                  .read(tasksProvider.notifier)
                                  .updateTask(task)
                                  .then((value) {
                                AppAlerts.displaySnackbar(
                                  context,
                                  task.isCompleted
                                      ? 'Tarea Incompleta'
                                      : 'Tarea Completada',
                                );
                              });
                            },
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => const Divider(
                        thickness: 1.5,
                      ),
                    )
        ),
      ],
    );
  }
}
