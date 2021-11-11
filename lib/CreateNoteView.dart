import 'package:flutter/material.dart';
import 'package:keep_note_clone/colors.dart';
import 'package:keep_note_clone/home.dart';
import 'package:keep_note_clone/model/Mymodel.dart';
import 'package:keep_note_clone/servises/db.dart';
class CreateNoteView extends StatefulWidget {
  const CreateNoteView({Key? key}) : super(key: key);

  @override
  _CreateNoteViewState createState() => _CreateNoteViewState();
}

class _CreateNoteViewState extends State<CreateNoteView> {
  TextEditingController title = new TextEditingController();
  TextEditingController content = new TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    title.dispose();
    content.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0.0,
        actions: [
          IconButton(
            splashRadius: 17,
            onPressed: () async{
              await NotesDatabse.instance.InsertEntry(Note(title : title.text ,isArchive:false  ,content : content.text , pin : false, createdTime: DateTime.now()));
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home()));
            },
            icon: Icon(Icons.save_outlined),
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            TextField(
              controller: title,
              cursorColor: white,
              style: TextStyle(fontSize: 25, color: Colors.white,fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: "Title",
                hintStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.withOpacity(0.8)),
              ),
            ),
            Container(
              height: 300,
              child: TextField(
                controller: content,
                keyboardType: TextInputType.multiline,
                minLines: 50,
                maxLines: null,
                cursorColor: white,
                style: TextStyle(fontSize: 17, color: Colors.white),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintText: "Title",
                  hintStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.withOpacity(0.8)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
