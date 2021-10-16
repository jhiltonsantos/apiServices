class Service {
  final String id;
  final String title;
  final String description;
  final String value;
  final String dateRegister;
  final String deadline;
  final String status;
  final String comment;

  Service(
      {required this.id,
      required this.title,
      required this.description,
      required this.value,
      required this.dateRegister,
      required this.deadline,
      required this.status,
      required this.comment});

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      value: json['value'].toString(),
      dateRegister: json['date_register'] as String,
      deadline: json['deadline'] as String,
      status: json['status'] as String,
      comment: json['comment'] as String,
    );
  }

  @override
  String toString() {
    return 'Services(title: $title, description: $description, status: $status)';
  }
}
