class TimetableItem {
  String course;
  String day;
  String endTime;
  List<String> program;
  String semester;
  String startTime;
  String year;
  String collectionId;
  String collectionName;
  DateTime created;
  String id;
  DateTime updated;

  TimetableItem({
    required this.course,
    required this.day,
    required this.endTime,
    required this.program,
    required this.semester,
    required this.startTime,
    required this.year,
    required this.collectionId,
    required this.collectionName,
    required this.created,
    required this.id,
    required this.updated,
  });

  factory TimetableItem.fromJson(Map<String, dynamic> json) {
    return TimetableItem(
      course: json['Course'] ?? '',
      day: json['Day'] ?? '',
      endTime: json['EndTime'] ?? '',
      program: List<String>.from(json['Program']) ?? [],
      semester: json['Semester'] ?? '',
      startTime: json['StartTime'] ?? '',
      year: json['Year'] ?? '',
      collectionId: json['collectionId'] ?? '',
      collectionName: json['collectionName'] ?? '',
      created: DateTime.tryParse(json['created']) ?? DateTime.now(),
      id: json['id'] ?? '',
      updated: DateTime.tryParse(json['updated']) ?? DateTime.now(),
    );
  }
}
