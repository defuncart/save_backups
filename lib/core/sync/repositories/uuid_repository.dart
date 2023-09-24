import 'package:uuid/uuid.dart';

abstract class UUIDRepository {
  String generate();
}

class UUIDRepositoryImpl implements UUIDRepository {
  static const _uuid = Uuid();

  @override
  String generate() => _uuid.v4();
}
