
import 'package:flutter/material.dart';
import 'package:todo_1/Controllar/todo_controller.dart';
import 'package:todo_1/Models/todo_modals.dart';
import 'package:todo_1/widget/Sidebar.dart';
import 'package:todo_1/widget/todo_tiles.dart';
import 'package:google_fonts/google_fonts.dart';



class Todolist extends StatefulWidget {
  const Todolist({Key? key,}) : super(key: key);


  @override
  State<Todolist> createState() => TodolistState();

  
  
}

class TodolistState extends State<Todolist> {
  
  String ? title,description;
  DateTime? date;
  Todocontroller controller = Todocontroller(); 
  

 @override
  void initState() {
    setState(() {
      controller.getData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      drawer: sidebar(),
      appBar: _showAppbar(),
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
        backgroundColor: Color(0xff8687E7),
         ),
       body:
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20), 
         child: Column(
        children: [
              _showtextfield(),
                const SizedBox(
                 height: 20,
                ),
                Expanded(
                    child: controller.searchedTodolist?.length ==0 ? Center(
                      child: Text("No Task",
                      style: GoogleFonts.telex(
                        color: Color.fromARGB(255, 248, 246, 252),
                      fontSize: 35,
                      fontWeight: FontWeight.w400,

                      ),),
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
 AppBar _showAppbar(){
    return AppBar(
        backgroundColor: Colors.black,
        // leading: Padding(
        //   padding: const EdgeInsets.all(9.0),
        //   child: Image.asset("assets/sort.png",
          
        //   ),
        // ),
        title: const Center(
          child: Text(
          "Todo",
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all( 10),
            child: Image.asset("assets/user.png"),
          )
        ],
      
      );
  }
 Container _showtextfield (){
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
    ),
    child: TextField(
             cursorColor: const Color(0xff979797),
             style:const TextStyle(
                color: Color(0xffAFAFAF),
              fontSize: 16,
              fontWeight: FontWeight.w400,
             ) ,
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
                hintStyle: const TextStyle(
                 fontStyle: FontStyle.italic,
                 fontWeight: FontWeight.w400,
                 fontSize: 16,
                 color: Color(0xFFAFAFAF),
                ) ,
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
      color: const Color(0xff363636) ,
      child: Padding(
          
           padding: EdgeInsets.fromLTRB
         (25, 25, 25, MediaQuery.of(context).viewInsets.bottom),
    
           child: Column(
            
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              
              const Padding(
                padding: EdgeInsets.only(bottom: 16.0),
                child: Text(
                  "Add Task",
                  style: TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w400,
                    color: Colors.white
                  ),
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
                    style: const TextStyle(
                       fontSize: 16,
                       fontWeight: FontWeight.w400,
                       color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      fillColor:  const Color(0xff363636),
                      filled: true,
                      hintText: "Add Title",
                      hintStyle:TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xffFFFFFF).withOpacity(0.89),
                    ),
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
                    style: const TextStyle(
                       fontSize: 16,
                       fontWeight: FontWeight.w400,
                       color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      fillColor:  const Color(0xff363636),
                      filled: true,
                      hintText: "Add Description",
                      hintStyle:TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xffFFFFFF).withOpacity(0.89),
                    ),
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
                                  textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12  ,
                                  ),
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
