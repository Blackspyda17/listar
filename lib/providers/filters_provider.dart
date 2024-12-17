import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:listar/providers/task/task_filter.dart';

class TaskFilterNotifier extends StateNotifier<TaskFilter> {
  TaskFilterNotifier() : super(TaskFilter(showPending: true, showCompleted: true));

  void togglePending() {
    if (state.showPending && !state.showCompleted) {
      return; // Evita desmarcar "Pendientes" si "Completadas" ya está desmarcada
    }
    state = state.copyWith(showPending: !state.showPending);
  }

  void toggleCompleted() {
    if (state.showCompleted && !state.showPending) {
      return; // Evita desmarcar "Completadas" si "Pendientes" ya está desmarcada
    }
    state = state.copyWith(showCompleted: !state.showCompleted);
  }

  bool areFiltersApplied() {
    return !state.showPending || !state.showCompleted;
  }
}

final taskFilterProvider = StateNotifierProvider<TaskFilterNotifier, TaskFilter>(
      (ref) => TaskFilterNotifier(),
);