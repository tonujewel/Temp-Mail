// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_hive_dm.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HomeHiveDmAdapter extends TypeAdapter<HomeHiveDm> {
  @override
  final int typeId = 1;

  @override
  HomeHiveDm read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HomeHiveDm(
      email: fields[2] as String,
      subject: fields[3] as String,
      body: fields[4] as String,
      name: fields[1] as String,
      createdAt: fields[5] as String,
      id: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HomeHiveDm obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.subject)
      ..writeByte(4)
      ..write(obj.body)
      ..writeByte(5)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HomeHiveDmAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
