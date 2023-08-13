import 'package:hive_flutter/hive_flutter.dart';

import '../dto/{{feature_name.snakeCase()}}_dto.dart';

// ignore: unused_import
import '../../../shared/hive_types.dart';

abstract class Local{{feature_name.pascalCase()}}DataSource {
  {{feature_name.pascalCase()}}DTO? get{{feature_name.pascalCase()}}();
  Future<void> add{{feature_name.pascalCase()}}({{feature_name.pascalCase()}}DTO dto);
  Future<void> update{{feature_name.pascalCase()}}({{feature_name.pascalCase()}}DTO dto);
  Future<void> delete{{feature_name.pascalCase()}}({{feature_name.pascalCase()}}DTO dto);
}

class Hive{{feature_name.pascalCase()}}DataSource implements Local{{feature_name.pascalCase()}}DataSource {
  Hive{{feature_name.pascalCase()}}DataSource(this._hive);

  final HiveInterface _hive;
  final String _{{feature_name.camelCase()}}BoxName = '_{{feature_name.camelCase()}}BoxName';
  Box<{{feature_name.pascalCase()}}DTO> get _{{feature_name.camelCase()}}Box => _hive.box(_{{feature_name.camelCase()}}BoxName);

  Future<void> init() async {
    if (!_hive.isAdapterRegistered({{feature_name.camelCase()}}TypeId)) {
      _hive.registerAdapter({{feature_name.pascalCase()}}DTOAdapter());
    }
    await _hive.openBox<{{feature_name.pascalCase()}}DTO>(_{{feature_name.camelCase()}}BoxName);
  }

  @override
  {{feature_name.pascalCase()}}DTO? get{{feature_name.pascalCase()}}() => _{{feature_name.camelCase()}}Box.get(0);

  @override
  Future<void> add{{feature_name.pascalCase()}}({{feature_name.pascalCase()}}DTO dto) => _{{feature_name.camelCase()}}Box.put(0, dto);

  @override
  Future<void> update{{feature_name.pascalCase()}}({{feature_name.pascalCase()}}DTO dto) => _{{feature_name.camelCase()}}Box.put(0, dto);

  @override
  Future<void> delete{{feature_name.pascalCase()}}({{feature_name.pascalCase()}}DTO dto) => _{{feature_name.camelCase()}}Box.clear();
}
