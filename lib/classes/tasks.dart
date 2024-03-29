class Todos {
  String? title;
  String? description;
  String? category;
  int? timestamp;
  int? priority;
  String? userId;
  bool? isCompleted;
  String? id;

  Todos(
      {this.title,
      this.description,
      this.category,
      this.timestamp,
      this.priority,
      this.userId,
      this.isCompleted,
      this.id});

  Todos.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    category = json['category'];
    timestamp = json['timestamp'];
    priority = json['priority'];
    userId = json['user_id'];
    isCompleted = json['isCompleted'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['category'] = this.category;
    data['timestamp'] = this.timestamp;
    data['priority'] = this.priority;
    data['user_id'] = this.userId;
    data['isCompleted'] = this.isCompleted;
    data['id'] = this.id;
    return data;
  }
}
