// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AuthUserModelAdapter extends TypeAdapter<AuthUserModel> {
  @override
  final int typeId = 0;

  @override
  AuthUserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AuthUserModel(
      fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AuthUserModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthUserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
