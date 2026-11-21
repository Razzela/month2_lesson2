import 'package:flutter/material.dart';

class Listviewapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(title: Text('Список Учеников'),
          backgroundColor: Colors.blueGrey,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Text('Студенты'),
                SizedBox(height: 20,),
                Text('ФИО студентов \n'*35),
                SizedBox(height: 30,),
                ElevatedButton(onPressed: (){}, child: Text('На Главную'),
                ),
              ],
            ),
          )
      ),
    );
  }

}