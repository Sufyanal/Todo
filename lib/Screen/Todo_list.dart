
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_1/Controllar/todo_controller.dart';
import 'package:todo_1/Models/todo_modals.dart';
import 'package:todo_1/widget/BottomBar.dart';
import 'package:todo_1/widget/Sidebar.dart';
import 'package:todo_1/widget/todo_tiles.dart';




class Todolist extends StatefulWidget {
  const Todolist({Key? key,}) : super(key: key);


  @override
  State<Todolist> createState() => TodolistState();

  
  
}

class TodolistState extends State<Todolist> {
  
  String ? title,description;
  DateTime? date;
  Todocontroller controller = Todocontroller(); 
     int currentSelectedIndex = 0;  

 @override
  void initState() {
    
      controller.getData().then((value) {
        setState(() {
          
        });
      });
   
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      drawer: sidebar(),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          showModalBottomSheet(
            context: context,
   isScrollControlled: true,
            shape: RoundedRectangleBorder(
              borderRadius: 
                 BorderRadius.vertical(top: Radius.circular(30))),    
             builder: (context){
              return _showBottomSheet();
             });
        }),
        child:Icon(
          Icons.add,
        ),
         ),
       body:
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20), 
         child: Column(
        children: [
          Lottie.asset("Animation/2.json",
          height: 100
          ),
              _showtextfield(),
                const SizedBox(
                 height: 20,
                ),
                Expanded(
                    
                    child: controller.searchedTodolist?.length ==0 ? Center(
                      child: Text("No Task",
                      style: Theme.of(context).textTheme.bodyMedium,),
                    ):
                     ListView.builder(
                      itemBuilder:((context, index) {
                        Todo item = controller.searchedTodolist !=null
                        ?controller.searchedTodolist![index]
                        : controller.todoList[index];
                         return Todotiles(todo:item, onPressed: () { 
                          setState(() {
                            controller.todoList.removeAt(index);
                          });
                          
                          },);
                      }),
                      itemCount: controller.searchedTodolist !=null
                      ? controller.searchedTodolist!.length
                       :controller.todoList.length,
                      
                     ),
                     
                  ), 
              ],
            ),
              ),

      );

  }

 Container _showtextfield (){
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
    ),
    child: TextField(
             cursorColor: const Color(0xff979797),
             style:Theme.of(context).textTheme.bodyMedium,
             onChanged:(value){
               setState(() {
                 controller.searchTodo(value);
               });
             },
              decoration: InputDecoration(
                fillColor: const Color(0xFF1D1D1D),
                filled: true,
                prefixIcon: Padding(
                  padding:EdgeInsets.all(8),
                  child: Image.asset("assets/search.png",
                  height: 24,
                  width: 24,
                  ),
                  
                   ),
                hintText: "Search For Your Task ",
                hintStyle: Theme.of(context).textTheme.bodyMedium,
                border: const OutlineInputBorder( ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff979797)),
                )
              ),
            ),
  );
 }
    Widget _showBottomSheet(){
    return Container(
      color: Theme.of(context).colorScheme.secondary,
      child: Padding(
           padding: EdgeInsets.fromLTRB
         (25, 25, 25, MediaQuery.of(context).viewInsets.bottom),
           child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
               Padding(
                padding: EdgeInsets.only(bottom: 16.0),
                child: Text(
                  "Add Task",
                  style: Theme.of(context).textTheme.bodyLarge,
                 ),
                ),
                Padding( 
                  padding: EdgeInsets.only(bottom: 12),
                  child: TextField(
                    textInputAction: TextInputAction.next,
                    onChanged:( (value){
                        title = value;
                    }),
                    autofocus: true,
                    cursorColor:const Color(0xff979797),
                    style: Theme.of(context).textTheme.bodyMedium,
                    decoration: InputDecoration(
                      fillColor:  const Color(0xff363636),
                      filled: true,
                      hintText: "Add Title",
                      hintStyle:Theme.of(context).textTheme.bodyLarge,
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff979797)), ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff979797)),)
                  ),
                  )),
                          Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: TextField(
                    onChanged: ((value){
                        description = value;
                      
                    }),
                    autofocus: true,
                    cursorColor:const Color(0xff979797),
                    style: Theme.of(context).textTheme.bodyMedium,
                    decoration: InputDecoration(
                      fillColor: Theme.of(context).colorScheme.secondary,
                      filled: true,
                      hintText: "Add Description",
                      hintStyle:Theme.of(context).textTheme.bodyLarge,
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff979797)),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff979797)),
                    )
                  ),
                  )),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 17),
                    child: Row(children: [
                      IconButton(
                        onPressed:()async{
                         date = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(), 
                          firstDate: DateTime.now(), 
                          lastDate: DateTime(2025),
                          builder:( context, child) {
                           return Theme(
                            data: Theme.of(context).copyWith(
                            colorScheme: ColorScheme.light(
                               primary: Color(0xff363636),
                               onPrimary: Colors.white,
                               onSurface: Colors.white,
                               ),
                               dialogBackgroundColor: Color(0xff363636),
                               textButtonTheme: TextButtonThemeData(
                                style: TextButton.styleFrom(
                                  backgroundColor: Color(0xff363636),
                                  foregroundColor: Colors.white,
                                  textStyle: Theme.of(context).textTheme.bodySmall,
                                  primary: Colors.white,

                                ),
                               ),),
                            child: child!);
                          },
                          );
                        // ignore: use_build_context_synchronously
                        TimeOfDay?  time = await showTimePicker(
                            context: context,
                             initialTime: TimeOfDay(hour: 12,minute: 00),
                             builder:( context, child) {
                           return Theme(
                            data: Theme.of(context).copyWith(
                              timePickerTheme: TimePickerThemeData(
                                backgroundColor: Color(0xff363636),
                                hourMinuteColor: Colors.white,
                                hourMinuteTextColor:Colors.blue,
                                dialBackgroundColor: Colors.white,
                                dialHandColor: Colors.black,
                                entryModeIconColor: Colors.white,
                              ),
                              
                              textTheme: TextTheme(
                                overline: TextStyle(
                                  color: Colors.white,
                                ),
                                
                              )
                               ),
                            child: child!);
                          },
                             );
                             if (time != null) {
                               setState(() {
                                 date = DateTime(date!.year,date!.month,date!.day,
                                 time.hour,time.minute);
                               });
                             }
                         print(date,);
                         print(time);
                        },
                         icon: ImageIcon(
                          const AssetImage("assets/timer.png"),
                          color: Colors.white.withOpacity(0.87),
                         )),
                         IconButton(
                        onPressed:(){},
                         icon: ImageIcon(
                          const AssetImage("assets/tag.png"),
                          color: Colors.white.withOpacity(0.87),
                         )),
                         IconButton(
                        onPressed:(){},
                         icon: ImageIcon(
                          AssetImage("assets/red-flag.png"),
                          color: Colors.white.withOpacity(0.87),
                         )),
                         Spacer(),
                         IconButton(
                        onPressed:(){
                          print(title);
                          print(description);
                          print(date);
                          
                          // true ,true , false
                          if(title!=null && description!=null && date!=null){
                            setState(() {
                             controller.addtodo( title!,description!,date!,context);
                            });
                            
                          }else{
                          print("hogya");
                          }
           
                        },
                         icon: const ImageIcon(
                           AssetImage("assets/send.png"), 
                           color: Colors.blue ,)),     
                    ]),
                    
            )], ),
         ),
    );
    
  }
}
