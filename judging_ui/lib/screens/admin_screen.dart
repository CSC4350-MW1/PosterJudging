// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'rubric_screen.dart';
import 'rubric_screen2.dart';
import 'timer_screen.dart';
import 'package:http/http.dart' as http;

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
                const Text(
                  "Welcome Admin, ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: () async {
                    var url =
                        "https://us-east1-demodayscorer.cloudfunctions.net/generate_grading_assignment";
                    var response = await http.get(Uri.parse(url));
                    print('Response ' + response.toString());
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const timerScreen()));
                  },
                  child: Text('Start'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: () async {
                    var url =
                        "https://us-central1-demodayscorer.cloudfunctions.net/send";
                    var response = await http.get(Uri.parse(url));
                    print('Response ' + response.toString());
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const timerScreen()));
                  },
                  child: Text('Stop'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
