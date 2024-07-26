// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicine_models.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MedicineModelAdapter extends TypeAdapter<MedicineModel> {
  @override
  final int typeId = 0;

  @override
  MedicineModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MedicineModel()
      ..medicineName = fields[0] as String
      ..fromDate = fields[1] as DateTime
      ..toDate = fields[2] as DateTime
      ..diagnosis = fields[3] as String
      ..numberOfTimesInDay = fields[4] as int
      ..medicineType = fields[5] as MedicineType;
  }

  @override
  void write(BinaryWriter writer, MedicineModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.medicineName)
      ..writeByte(1)
      ..write(obj.fromDate)
      ..writeByte(2)
      ..write(obj.toDate)
      ..writeByte(3)
      ..write(obj.diagnosis)
      ..writeByte(4)
      ..write(obj.numberOfTimesInDay)
      ..writeByte(5)
      ..write(obj.medicineType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MedicineModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MedicineTypeAdapter extends TypeAdapter<MedicineType> {
  @override
  final int typeId = 1;

  @override
  MedicineType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return MedicineType.tablet;
      case 1:
        return MedicineType.syrup;
      default:
        return MedicineType.tablet;
    }
  }

  @override
  void write(BinaryWriter writer, MedicineType obj) {
    switch (obj) {
      case MedicineType.tablet:
        writer.writeByte(0);
        break;
      case MedicineType.syrup:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MedicineTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
