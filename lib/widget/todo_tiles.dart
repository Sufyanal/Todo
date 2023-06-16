import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:todo_1/Screen/Todo_list.dart';

import '../Models/todo_modals.dart';

// ignore: must_be_immutable
class Todotiles extends StatefulWidget {
  Todotiles({
    required this.todo,
    required this.onPressed,
  });
  Todo todo;
  Function()onPressed;
  @override
  State<Todotiles> createState() => _TodotilesState();
}
class _TodotilesState extends State<Todotiles> {
    
    
  @override
  Widget build(BuildContext context) {     
    return  Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(15),
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xff363636),
                borderRadius: BorderRadius.circular(4)
              ),
              child: Row(
                children: [
                  //   Checkbox(
                  //  activeColor: Color.fromARGB(232, 12, 28, 247),
                  //  shape: CircleBorder(),
                  //  side: BorderSide(
                  //   color: Color.fromARGB(255, 233, 213, 213),
                  //   width: 1,
                  //  ),
                  // value:widget.todo.isComplited,
                  // onChanged:(bool? value){
                  //   print(value);
                  //   setState(() {
                  //     widget.todo.isComplited = value!;
                  //   });
                  // } 
                  // ),
                 const SizedBox(
                  height:12
                 ),     
                    Padding(
                     padding: const EdgeInsets.only(left: 10),
                     child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                        Text(
                          '${widget.todo.title}',
                        style: const TextStyle(
                          fontSize: 16,
                            color: Color(0xffafafaf),
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.italic,
                        )
                        ),
                        const SizedBox(
                   height: 2,
                        ),
                        Text(
                           DateFormat('MMM dd yyyy HH:mm')
                        .format(widget.todo.todoDay),
                          
                        style: const TextStyle(
                          fontSize: 16,
                            color: Color(0xffafafaf),
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.italic,
                        )
                        ),
                        ],
                     ),
                 ),
                 Spacer(),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    height: 20,
                    width: 80,
                    child: TextField(
                               cursorColor: Color.fromARGB(255, 228, 73, 12),
                               style:const TextStyle(
                    color: Color(0xffAFAFAF),
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                               ) ,
                             
                                decoration: InputDecoration(
                    fillColor: const Color(0xFF1D1D1D),
                    filled: true,
                    
                      
                       ),
                                ),
                  ),
                ),



                 Spacer(),
                 Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(padding: EdgeInsets.all(1)),
                         IconButton(onPressed:widget.onPressed,
                        
                           icon: Icon(
                            Icons.delete,
                            color: Colors.white,
                           )
                           ),
                        ],
                      ), 
                ] 
              ));        
  }
}