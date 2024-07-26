import 'package:hive/hive.dart';
import 'package:new_landing_page/models/medicine_models.dart';

class Boxes {
  static Box<MedicineModel>? _medicineBox;

  static Box<MedicineModel> getMedicines() {
    if (_medicineBox == null) {
      _medicineBox = Hive.box<MedicineModel>('medicinesRecords');
    }
    if (_medicineBox == null) {
      throw HiveError('Box not initialized');
    }
    return _medicineBox!;
  }

  static Future<void> close() async {
    if (_medicineBox != null) {
      await _medicineBox!.close();
    }
  }
}