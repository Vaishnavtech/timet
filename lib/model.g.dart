// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UploadDataAdapter extends TypeAdapter<UploadData> {
  @override
  final int typeId = 1;

  @override
  UploadData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UploadData(
      (fields[0] as List).cast<dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, UploadData obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.rowData);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UploadDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
