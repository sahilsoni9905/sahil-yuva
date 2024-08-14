import 'dart:io';

class MedicalRecordsModels {
  final String documentName;
  final String typeOfReport;
  final String diseaseName;
  final File file;
  final DateTime dateAdded;

  MedicalRecordsModels(this.dateAdded, 
      {required this.documentName,
      required this.typeOfReport,
      required this.diseaseName,
      required this.file});
}
