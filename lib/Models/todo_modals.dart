class Todo{
   String title = "";
   String description = "";
   String ? tag;
    DateTime todoDay = DateTime.now();
   bool isCompleted = false ;
    int ? proprity;

   Todo({
    required this.title,
    required this.description,
    this.tag,
    required this.todoDay,
    this.isCompleted =false,
     this.proprity,
  });
 Todo.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    tag = json['tag'];
    todoDay = DateTime.parse(json['todoDay']);
    isCompleted = json['isCompleted'];
     proprity = json['proprity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['tag'] = this.tag;
    data['proprity'] = this.proprity;
    data['todoDay'] = this.todoDay.toString();
    data['isCompleted'] = this.isCompleted;
    return data;
  }
 }