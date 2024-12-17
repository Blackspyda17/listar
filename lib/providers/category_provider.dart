import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:listar/utils/utils.dart';

final categoryProvider = StateProvider.autoDispose<TaskCategory>((ref) {
  return TaskCategory.others;
});
