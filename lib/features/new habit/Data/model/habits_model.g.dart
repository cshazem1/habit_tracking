// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habits_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HabitsModelAdapter extends TypeAdapter<HabitsModel> {
  @override
  final int typeId = 0;

  @override
  HabitsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HabitsModel(
      habitName: fields[0] as String,
      habitColor: fields[1] as int,
      habitIcon: fields[2] as String,
      frequency: fields[3] as String,
      repeat: fields[4] as String,
      time: fields[5] as String,
      reminder: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HabitsModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.habitName)
      ..writeByte(1)
      ..write(obj.habitColor)
      ..writeByte(2)
      ..write(obj.habitIcon)
      ..writeByte(3)
      ..write(obj.frequency)
      ..writeByte(4)
      ..write(obj.repeat)
      ..writeByte(5)
      ..write(obj.time)
      ..writeByte(6)
      ..write(obj.reminder);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HabitsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}