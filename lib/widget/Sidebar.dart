import 'package:flutter/material.dart';


class sidebar extends StatelessWidget {
  const sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
         UserAccountsDrawerHeader(
          arrowColor: Color(0xff363636),
          accountName: Text('accountName'),
          accountEmail: Text('nameEmail'),
          // decoration: BoxDecoration(
          //   image: DecorationImage(
          //     image: NetworkImage("")
          //   )
          // ),
          )
        ],
      ),
    );
  }
}