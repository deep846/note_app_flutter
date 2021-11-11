import 'package:flutter/material.dart';
import 'package:keep_note_clone/EditNoteView.dart';
import 'package:keep_note_clone/colors.dart';
import 'package:keep_note_clone/home.dart';
import 'package:keep_note_clone/model/Mymodel.dart';
import 'package:keep_note_clone/servises/db.dart';

class NoteView extends StatefulWidget {

  Note note;
  NoteView({required this.note});

  @override
  _NoteViewState createState() => _NoteViewState();
}

class _NoteViewState extends State<NoteView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0.0,
        actions: [
          IconButton(onPressed:()async{await NotesDatabse.instance.pinNote(widget.note);Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));}, icon: widget.note.pin ? Icon(Icons.push_pin):Icon(Icons.push_pin_outlined),splashRadius: 17,),
          IconButton(splashRadius: 17, onPressed: () async{await NotesDatabse.instance.arcNote(widget.note);Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home()));} , icon: Icon(widget.note.isArchive ?Icons.archive :Icons.archive_outlined)),
          IconButton(onPressed:()async{await NotesDatabse.instance.delteNote(widget.note);Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home()));}, icon: Icon(Icons.delete),splashRadius: 17,),
          IconButton(onPressed:(){Navigator.push(context, MaterialPageRoute(builder: (context)=> EditNoteView(note: widget.note,),),);}, icon: Icon(Icons.edit_outlined),splashRadius: 17,),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.note.title,style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 23,
            ),),
            SizedBox(
              height: 10,
            ),
            Text(widget.note.content,style: TextStyle(
              color: Colors.white,
            ),),
          ],
        ),
      ),
    );
  }
}
