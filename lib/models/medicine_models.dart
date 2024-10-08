import 'package:hive/hive.dart';
part 'medicine_models.g.dart'; //showing target of uri has not been generated


@HiveType(typeId: 0)
class MedicineModel extends HiveObject {
  @HiveField(0)
  late String medicineName;

  @HiveField(1)
  late DateTime fromDate;

  @HiveField(2)
  late DateTime toDate;

  @HiveField(3)
  late String diagnosis;

  @HiveField(4)
  late int numberOfTimesInDay;

  @HiveField(5)
  late MedicineType medicineType;
}

@HiveType(typeId: 1)
enum MedicineType {
  @HiveField(0)
  tablet,
  @HiveField(1)
  syrup,
}
