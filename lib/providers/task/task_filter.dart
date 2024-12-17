
class TaskFilter {
  final bool showPending;
  final bool showCompleted;

  TaskFilter({required this.showPending, required this.showCompleted});

  TaskFilter copyWith({bool? showPending, bool? showCompleted}) {
    return TaskFilter(
      showPending: showPending ?? this.showPending,
      showCompleted: showCompleted ?? this.showCompleted,
    );
  }
}
