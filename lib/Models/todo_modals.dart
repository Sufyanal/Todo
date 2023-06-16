class Todo{
   String title = "";
   String description = "";
   String ? tag;
   int ? proprity;
   DateTime todoDay = DateTime.now();
   bool? isComplited ;

   Todo({
    required this.title,
    required this.description,
    this.tag,
    this.proprity,
    required this.todoDay,
    this.isComplited =false,
  });
 Todo.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    tag = json['tag'];
    proprity = json['proprity'];
    todoDay = DateTime.parse(json['todoDay']);
    isComplited = json['isComplites'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['tag'] = this.tag;
    data['proprity'] = this.proprity;
    data['todoDay'] = this.todoDay.toString();
    data['isComplited'] = this.isComplited;
    return data;
  }
 }