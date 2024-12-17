import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:listar/data/datasource/datasource.dart';

final taskDatasourceProvider = Provider<TaskDatasource>((ref) {
  return TaskDatasource();
});
