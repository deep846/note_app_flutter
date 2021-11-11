import 'package:flutter/material.dart';
import 'package:keep_note_clone/ArchiveView.dart';
import 'package:keep_note_clone/Setting.dart';
import 'package:keep_note_clone/colors.dart';
import 'package:keep_note_clone/home.dart';

class SideMenue extends StatefulWidget {
  const SideMenue({Key? key}) : super(key: key);

  @override
  _SideMenueState createState() => _SideMenueState();
}

class _SideMenueState extends State<SideMenue> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          color: bgColor,
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 25,vertical: 16),
                child: Text("Google Keep",
                  style: TextStyle(color: white, fontSize: 25,fontWeight: FontWeight.bold),),
              ),
              Divider(
                color: white.withOpacity(0.3),
              ),
              SizedBox(height: 5,),
              sectionone(),
              SizedBox(height: 5,),
              sectionTwo(),
              SizedBox(height: 5,),
              sectionSettings(),
            ],
          ),
        ),
      ),
    );
  }
  Widget sectionone(){
    return  Container(
      margin: EdgeInsets.only(right:10 ),
      child: TextButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.orangeAccent.withOpacity(0.3)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(

                RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      bottomRight: Radius.circular(50)),
                ))),
        onPressed:(){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Home(),),);},
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
          child: Row(
            children: [
              Icon(Icons.lightbulb,color: white.withOpacity(0.7),),
              SizedBox(
                width: 27,
              ),
              Text("Notes",style: TextStyle(
                color: white.withOpacity(0.7),
                fontSize: 18,
              ),),
            ],
          ),
        ),
      ),
    );
  }
  Widget sectionTwo(){
    return  Container(
      margin: EdgeInsets.only(right:10 ),
      child: TextButton(
        style: ButtonStyle(
          // backgroundColor: MaterialStateProperty.all(Colors.orangeAccent.withOpacity(0.3)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(

                RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      bottomRight: Radius.circular(50)),
                ))),
        onPressed:(){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> ArchiveView(),),);
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
          child: Row(
            children: [
              Icon(Icons.archive_outlined,color: white.withOpacity(0.7),),
              SizedBox(
                width: 27,
              ),
              Text("Archive",style: TextStyle(
                color: white.withOpacity(0.7),
                fontSize: 18,
              ),),
            ],
          ),
        ),
      ),
    );
  }
  Widget sectionSettings(){
    return  Container(
      margin: EdgeInsets.only(right:10 ),
      child: TextButton(
        style: ButtonStyle(
          // backgroundColor: MaterialStateProperty.all(Colors.orangeAccent.withOpacity(0.3)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(

                RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      bottomRight: Radius.circular(50)),
                ))),
        onPressed:(){

          Navigator.push(context, MaterialPageRoute(builder: (context) => Settings()));
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
          child: Row(
            children: [
              Icon(Icons.settings_outlined,color: white.withOpacity(0.7),),
              SizedBox(
                width: 27,
              ),
              Text("Settings",style: TextStyle(
                color: white.withOpacity(0.7),
                fontSize: 18,
              ),),
            ],
          ),
        ),
      ),
    );
  }
}
