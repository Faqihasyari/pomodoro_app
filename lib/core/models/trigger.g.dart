// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trigger.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TriggerModelAdapter extends TypeAdapter<TriggerModel> {
  @override
  final int typeId = 2;

  @override
  TriggerModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TriggerModel(
      id: fields[0] as String,
      trigger: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TriggerModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.trigger);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TriggerModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
