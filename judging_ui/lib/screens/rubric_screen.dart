import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'rubric_screen2.dart';

class rubricScreen extends StatefulWidget {
  const rubricScreen({super.key});

  @override
  State<rubricScreen> createState() => _rubricScreenState();
}

class _rubricScreenState extends State<rubricScreen> {
  

  // final allChecked = CheckBoxModal(title: 'Hi');
  final checkBoxList = [
    CheckBoxModal(title: '1'),
    CheckBoxModal(title: '2'),
    CheckBoxModal(title: '3'),
    CheckBoxModal(title: '4'),
    CheckBoxModal(title: '5'),
  ];
 

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('Welcome Judges')),
        body: ListView( 
          children: [
            Text('Abstract: Clear and accurately reflects presentation', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            
            // ListTile(
            //   onTap: () => onAllClicked(allChecked),
            //   leading: Checkbox(
            //     value: allChecked.value,
            //     onChanged: (value)=> onAllClicked(allChecked)
            //   ),
            //   title: Text(
            //     allChecked.title,
            //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            //   ),
            // ),
            
            Divider(),
            ...checkBoxList.map((item) => 
            ListTile(
              onTap: () => onAllClicked(item),
              leading: Checkbox(
                value: item.value,
                onChanged: (value)=> onAllClicked(item)
              ),
              title: Text(
                item.title,
                
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              
              
            ),
            
            
            ).toList(),
            Divider(),
            
            ElevatedButton(onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const rubricScreen2())), 
            child: Text('Next'), style: ElevatedButton.styleFrom(primary:Colors.blue ,),), 
          ],
        ), 
        
        
      ),
      
    
    );


    
  }
  

  onAllClicked(CheckBoxModal ckbItem) {
    setState(() {
      ckbItem.value = !ckbItem.value;
    });
  }
}

class CheckBoxModal {
  String title;
  bool value;
  CheckBoxModal({required this.title, this.value = false});
}
