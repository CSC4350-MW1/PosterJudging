import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class timerScreen extends StatefulWidget {
  const timerScreen({super.key});

  @override
  State<timerScreen> createState() => _timerScreenState();
}

class _timerScreenState extends State<timerScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(title: Text('Timer')),
      ),
      
    );
  }
}