import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:listar/data/data.dart';
import 'package:listar/providers/providers.dart';

final tasksProvider = StateNotifierProvider<TaskNotifier, TaskState>((ref) {
  final repository = ref.watch(taskRepositoryProvider);
  return TaskNotifier(repository);
});
