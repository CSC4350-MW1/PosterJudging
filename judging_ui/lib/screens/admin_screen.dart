import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'rubric_screen.dart';
import 'rubric_screen2.dart';
import 'timer_screen.dart';

class adminScreen extends StatefulWidget {
  const adminScreen({super.key});

  @override
  State<adminScreen> createState() => _adminScreenState();
}

class _adminScreenState extends State<adminScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Welcome"),
          centerTitle: true,
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Welcome Admin, ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const timerScreen())), 
            child: Text('Start'), style: ElevatedButton.styleFrom(primary:Colors.blue ,),), 
                
                // ActionChip(label: Text("Poster Day Form "), onPressed: () {
                //    Navigator.pushReplacement(
                // context, MaterialPageRoute(builder: (context) => rubricScreen()));
                // }),
                SizedBox(
                  height: 15,
                ),
                 ElevatedButton(onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const timerScreen())), 
            child: Text('Stop'), style: ElevatedButton.styleFrom(primary:Colors.blue ,),)
               
              ],
            ),
          ),
        ));
  }
}
