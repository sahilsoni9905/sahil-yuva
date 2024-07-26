import 'package:new_landing_page/boxes.dart';
import 'package:new_landing_page/models/medicine_models.dart';

class MedicineRepository {
  void addMedicine(String medicineName, String diagnosis, MedicineType type,
      DateTime from, DateTime to, int numberOfTimesInDay) async {
    final medicineRecord = MedicineModel()
      ..medicineName = medicineName
      ..fromDate = from
      ..diagnosis = diagnosis
      ..medicineType = type
      ..toDate = to
      ..numberOfTimesInDay = numberOfTimesInDay;
    final box = Boxes.getMedicines();
    box.add(medicineRecord);
    print('Added medicine: $medicineRecord');
  }

  List<MedicineModel> getMedicinesForToday() {
    try {
      final box = Boxes.getMedicines(); // Assuming Boxes is your storage method
      final today = DateTime.now();
      final startOfDay = DateTime(today.year, today.month, today.day);
      final endOfDay = startOfDay.add(const Duration(days: 1));

      final medicinesForToday = box.values.where((medicine) {
        final medicineFromDate = medicine.fromDate;
        final medicineToDate = medicine.toDate;
        print('Checking medicine: from $medicineFromDate to $medicineToDate');
        print('Start of day: $startOfDay, End of day: $endOfDay');

        final isWithinRange = medicineFromDate.isBefore(endOfDay) ||
            medicineFromDate.isAtSameMomentAs(startOfDay) &&
                medicineToDate.isAfter(startOfDay) ||
            medicineToDate.isAtSameMomentAs(endOfDay);

        print('Is within range: $isWithinRange');
        return isWithinRange;
      }).toList();

      print('Medicines for today: ${medicinesForToday.length}');
      return medicinesForToday;
    } catch (e) {
      print('Something went wrong: ${e.toString()}');
      return [];
    }
  }
}
