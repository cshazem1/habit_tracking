// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habits_final_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HabitFinalModelAdapter extends TypeAdapter<HabitFinalModel> {
  @override
  final int typeId = 1;

  @override
  HabitFinalModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HabitFinalModel(
      habitName: fields[0] as String,
      habitColor: fields[1] as int,
      habitIcon: fields[2] as String,
      timer: fields[3] as String,
      isCompleted: fields[5] as bool,
      reminder: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HabitFinalModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.habitName)
      ..writeByte(1)
      ..write(obj.habitColor)
      ..writeByte(2)
      ..write(obj.habitIcon)
      ..writeByte(3)
      ..write(obj.timer)
      ..writeByte(4)
      ..write(obj.reminder)
      ..writeByte(5)
      ..write(obj.isCompleted);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HabitFinalModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
