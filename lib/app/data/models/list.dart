import 'dart:convert';

Folder folderFromJson(String str) => Folder.fromJson(json.decode(str));

String folderToJson(Folder data) => json.encode(data.toJson());

class Folder {
  final String id;
  final String name;
  final List<Task> tasks;

  Folder({
    required this.id,
    required this.name,
    required this.tasks,
  });

  factory Folder.fromJson(Map<String, dynamic> json) => Folder(
        id: json["id"],
        name: json["name"],
        tasks: List<Task>.from(json["tasks"].map((x) => Task.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "tasks": List<dynamic>.from(tasks.map((x) => x.toJson())),
      };
}

class Task {
  final String id;
  final String name;
  final bool isCompleted;
  final String value;

  Task({
    required this.id,
    required this.name,
    required this.isCompleted,
    required this.value,
  });

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        id: json["id"],
        name: json["name"],
        isCompleted: json["is_completed"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "is_completed": isCompleted,
        "value": value,
      };
}
