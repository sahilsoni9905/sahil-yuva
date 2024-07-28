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
      final box = Boxes.getMedicines();
      final today = DateTime.now();
      final todayMonth = today.month;
      final todayDay = today.day;

      final medicinesForToday = box.values.where((medicine) {
        final medicineFromDate = medicine.fromDate;
        final medicineToDate = medicine.toDate;

        final medicineFromMonthDay =
            DateTime(today.year, medicineFromDate.month, medicineFromDate.day);
        final medicineToMonthDay =
            DateTime(today.year, medicineToDate.month, medicineToDate.day);
        final startOfDay = DateTime(today.year, todayMonth, todayDay);
        final endOfDay = startOfDay.add(const Duration(days: 1));

        print(
            'Checking medicine: from $medicineFromMonthDay to $medicineToMonthDay');
        print('Start of day: $startOfDay, End of day: $endOfDay');

        final isWithinRange = (medicineFromMonthDay.isBefore(endOfDay) ||
                medicineFromMonthDay.isAtSameMomentAs(startOfDay)) &&
            (medicineToMonthDay.isAfter(startOfDay) ||
                medicineToMonthDay.isAtSameMomentAs(endOfDay));

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
