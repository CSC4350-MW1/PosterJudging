import 'package:flutter/material.dart';
import 'package:gsu_posterday/screens/login_screen.dart';
import 'package:gsu_posterday/screens/rubric_screen.dart';

class FinalScreen extends StatefulWidget {
  const FinalScreen({super.key});

  @override
  State<FinalScreen> createState() => _FinalScreenState();
}

class _FinalScreenState extends State<FinalScreen> {
  @override
  Widget build(BuildContext context) {
    MaterialApp(
      debugShowCheckedModeBanner: false,
    );
    return Scaffold(
        appBar: AppBar(
          title: Text("Thanks for your submission! "),
          centerTitle: true,
        ),
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
                  "Scores are being calculated ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                //take name from database once connected so it display "hello user "

                ActionChip(
                    label: Text("Logout"),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    }),
              ],
            ),
          ),
        ));
  }
}
