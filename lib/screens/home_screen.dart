import 'package:flutter/material.dart';
import 'package:gsu_posterday/screens/login_screen.dart';
import 'package:gsu_posterday/screens/rubric_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                SizedBox(
                  height: 150,
                  child:
                      Image.asset("assets/images/gsu.jpg", fit: BoxFit.contain),
                ),
                Text(
                  "Welcome Back",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                //take name from database once connected so it display "hello user "
                Text("Name",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500)),
                SizedBox(
                  height: 15,
                ),
                ActionChip(label: Text("Poster Day Form "), onPressed: () {
                   Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => rubricScreen()));
                }),
                SizedBox(
                  height: 15,
                ),
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
