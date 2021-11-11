import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keep_note_clone/CreateNoteView.dart';
import 'package:keep_note_clone/NoteView.dart';
import 'package:keep_note_clone/SearchPage.dart';
import 'package:keep_note_clone/SideMenuBar.dart';
import 'package:keep_note_clone/colors.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:keep_note_clone/model/Mymodel.dart';
import 'package:keep_note_clone/servises/db.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isLoading =true;
  late List<Note> notesList;
  GlobalKey<ScaffoldState> _drawerkey = GlobalKey();
  String note =
      "This is note This is note This is note This is noteThis is note This is noteThis is note This is noteThis is note This is noteThis is note This is noteThis is note This is noteThis is note This is noteThis is note This is noteThis is note This is noteT ";
  String note1 = "This is note This is note This is note This is no";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     //createEntry(Note(pin: false, title: "Title", content: "This is Content", createdTime: DateTime.now(), isArchive: false));
    getAllNotes();
  }

  Future createEntry(Note note) async{
    await NotesDatabse.instance.InsertEntry(note);
  }

  Future getAllNotes() async{
    this.notesList = await NotesDatabse.instance.readAllNotes();
    setState(() {
      isLoading = false;
    });
  }
  Future getOneNote(int id) async{
    await NotesDatabse.instance.readOneNote(id);
  }

  Future updateOneNote(Note note) async{
    await NotesDatabse.instance.updateNote(note);

  }

  Future deleteNote(Note note) async{
    await NotesDatabse.instance.delteNote(note);
  }

  @override
  Widget build(BuildContext context) {
    return isLoading ? Scaffold(backgroundColor: bgColor, body: Center(child: CircularProgressIndicator(color: Colors.white,),) ,) : Scaffold(
      key: _drawerkey,
      endDrawerEnableOpenDragGesture: true,
      drawer: SideMenue(),
      backgroundColor: bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: cardColor,
                      boxShadow: [
                        BoxShadow(
                            color: black.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 3)
                      ]),
                  width: MediaQuery.of(context).size.width,
                  height: 55,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              _drawerkey.currentState!.openDrawer();
                            },
                            icon: Icon(
                              Icons.menu,
                              color: white,
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SearchView(),
                                ),
                              );
                            },
                            child: Container(
                              // decoration: BoxDecoration(
                              //   border: Border.all(color: Colors.white)
                              //
                              // ),
                              height: 55,
                              width: 200,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Search Your Notes',
                                    style: TextStyle(
                                        color: white.withOpacity(0.5),
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        child: Row(
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: Icon(
                                Icons.grid_view,
                                color: white,
                              ),
                              style: ButtonStyle(
                                overlayColor: MaterialStateColor.resolveWith(
                                    (states) => white.withOpacity(0.1)),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                ),
                              ),
                            ),
                            // SizedBox(
                            //   width: 40,
                            // ),
                            CircleAvatar(
                              radius: 16,
                              backgroundColor: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                noteSectionAll(),
                notesListSection(),
                // Container(
                //   padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                //   // height: MediaQuery.of(context).size.height,
                //   child: StaggeredGridView.countBuilder(
                //     physics: NeverScrollableScrollPhysics(),
                //     mainAxisSpacing: 12,
                //     crossAxisSpacing: 12,
                //     shrinkWrap: true,
                //     itemCount: 10,
                //     crossAxisCount: 4,
                //     staggeredTileBuilder: (index) => StaggeredTile.fit(2),
                //     itemBuilder: (context, index) => InkWell(
                //       onTap: () {
                //         Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //             builder: (context) => NoteView(note: notesList[index],),
                //           ),
                //         );
                //       },
                //       child: Container(
                //         padding: EdgeInsets.all(10),
                //         decoration: BoxDecoration(
                //           color: index.isEven
                //               ? Colors.green[900]
                //               : Colors.blue[900],
                //           border: Border.all(
                //             color: index.isEven
                //                 ? Colors.green.withOpacity(0.4)
                //                 : Colors.blue.withOpacity(0.4),
                //           ),
                //           borderRadius: BorderRadius.circular(7),
                //         ),
                //         child: Column(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             Text(
                //               "Heading",
                //               style: TextStyle(
                //                   color: Colors.white,
                //                   fontSize: 20,
                //                   fontWeight: FontWeight.bold),
                //             ),
                //             SizedBox(
                //               height: 10,
                //             ),
                //             Text(
                //               index.isEven
                //                   ? note.length > 250
                //                       ? "${note.substring(0, 250)}...."
                //                       : note
                //                   : note1,
                //               style: TextStyle(color: Colors.white),
                //             ),
                //           ],
                //         ),
                //       ),
                //     ),
                //   ),
                // ), //Colored count items
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreateNoteView(),
            ),
          );
        },
        child: Icon(
          Icons.add,
          size: 45,

        ),
        backgroundColor: cardColor,
      ),
    );
  }

  Widget noteSectionAll() {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "ALL",
                  style: TextStyle(
                    color: white.withOpacity(0.5),
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            // height: MediaQuery.of(context).size.height,
            child: StaggeredGridView.countBuilder(
              physics: NeverScrollableScrollPhysics(),
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              shrinkWrap: true,
              itemCount: notesList.length,
              crossAxisCount: 4,
              staggeredTileBuilder: (index) => StaggeredTile.fit(2),
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NoteView(note: notesList[index],),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: white.withOpacity(0.4),
                    ),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        notesList[index].title,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                         notesList[index].content.length > 250
                                ? "${notesList[index].content.substring(0, 250)}...."
                            : notesList[index].content,
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget notesListSection() {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "List View",
                  style: TextStyle(
                    color: white.withOpacity(0.5),
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            // height: MediaQuery.of(context).size.height,
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) => Container(
                margin: EdgeInsets.only(bottom: 10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: white.withOpacity(0.4),
                  ),
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Heading",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      index.isEven
                          ? note.length > 250
                              ? "${note.substring(0, 250)}...."
                              : note
                          : note1,
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
