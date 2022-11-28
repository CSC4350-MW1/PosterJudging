import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'rubric_screen7.dart';


class rubricScreen6 extends StatefulWidget {
  const rubricScreen6({super.key});

  @override
  State<rubricScreen6> createState() => _rubricScreen6State();
}

class _rubricScreen6State extends State<rubricScreen6> {
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
            Text('Narration: Shares the experience clearly, succinctly, and with language appropriate for a broad audience. Good volume and energy; Proper pace and diction', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
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
            .push(MaterialPageRoute(builder: (context) => const rubricScreen7())), 
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
