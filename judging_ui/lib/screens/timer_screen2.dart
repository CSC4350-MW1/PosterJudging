import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class timerScreen2 extends StatefulWidget {
  const timerScreen2({super.key});

  @override
  State<timerScreen2> createState() => _timerScreen2State();
}

class _timerScreen2State extends State<timerScreen2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(title: Text('Timer')
        ) ,
        
         body: Center(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 150,
                  child:
                      Image.asset("assets/images/gsu.jpg", fit: BoxFit.contain),
                ),
                Text(
                  "\nThe voting period has stopped. Results have been emailed to you.  ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                

               
              ],
            ),
          ),
        )
        
      ),
       
      
      
    );
  }
}