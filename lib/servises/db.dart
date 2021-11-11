import 'package:keep_note_clone/model/Mymodel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
class NotesDatabse {
  static final NotesDatabse instance = NotesDatabse._init();
  static Database? _database;

  NotesDatabse._init();

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initializeDB('NewNotes.db');
    return _database;
  }

  Future<Database> _initializeDB(String filepath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filepath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }


  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final boolType = 'BOOLEAN NOT NULL';
    final textType = 'TEXT NOT NULL';
    await db.execute('''
    CREATE TABLE Notes(
      ${NotesImpNames.id} $idType,
      ${NotesImpNames.pin} $boolType,
      ${NotesImpNames.isArchive} $boolType,
      ${NotesImpNames.title} $textType,
      ${NotesImpNames.content} $textType,
      ${NotesImpNames.createdTime} $textType
    )
    ''');
  }

  Future<Note?> InsertEntry(Note note) async {
    final db = await instance.database;
    final id = await db!.insert(NotesImpNames.TableName, note.toJson());
    return note.copy(id: id);
  }

  Future<List<Note>> readAllNotes() async {
    final db = await instance.database;
    final orderBy = '${NotesImpNames.createdTime} ASC';
    final query_result = await db!.query(
        NotesImpNames.TableName, orderBy: orderBy);
    return query_result.map((json) => Note.fromJson(json)).toList();
  }

  Future<Note?> readOneNote(int id) async {
    final db = await instance.database;
    final map = await db!.query(NotesImpNames.TableName,
        columns: NotesImpNames.values,
        where: '${NotesImpNames.id} = ?',
        whereArgs: [id]
    );
    if (map.isNotEmpty) {
      return Note.fromJson(map.first);
    }
    else {
      return null;
    }
  }

  Future updateNote(Note note) async {
    final db = await instance.database;

    await db!.update(NotesImpNames.TableName, note.toJson(),
        where: '${NotesImpNames.id} = ?', whereArgs: [note.id]);
  }
  Future pinNote(Note note) async {
    final db = await instance.database;

    await db!.update(NotesImpNames.TableName, {NotesImpNames.pin: !note.pin ? 1 :0},
        where: '${NotesImpNames.id} = ?', whereArgs: [note.id]);
  }
  Future arcNote(Note note) async {
    final db = await instance.database;

    await db!.update(NotesImpNames.TableName, {NotesImpNames.isArchive: !note.isArchive ? 1 :0},
        where: '${NotesImpNames.id} = ?', whereArgs: [note.id]);
  }
  Future delteNote(Note note) async {
    final db = await instance.database;

    await db!.delete(NotesImpNames.TableName, where: '${NotesImpNames.id} = ?',
        whereArgs: [note.id]);
  }

  Future closeDb() async {
    final db = await instance.database;
    db!.close();
  }

  Future<List<int>> getNoteString(String query) async {
    final db = await instance.database;
    final result = await db!.query(NotesImpNames.TableName);
    List<int> resultIds = [];
    result.forEach((element) {
      if (element["title"].toString().toLowerCase().contains(query) ||
          element["content"].toString().toLowerCase().contains(query)) {
        resultIds.add(element["id"] as int);
      }
    });


    return resultIds;
  }
}
//
//
// }
// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';
// class NotesDatabse {
//   static final NotesDatabse instance = NotesDatabse._init();
//   static Database? _database;
//   NotesDatabse._init();
//
//   Future<Database?> get database async{
//     if(_database != null) return _database;
//     _database = await _initializeDB('Notes.db');
//     return _database;
//   }
//
//
//   Future<Database> _initializeDB(String filepath) async{
//     final dbPath = await getDatabasesPath();
//     final path = join(dbPath , filepath);
//
//     return await openDatabase(path , version:  1, onCreate: _createDB );
//   }
//
//
//   Future _createDB(Database db, int version) async{
//     await db.execute('''
//     CREATE TABLE Notes(
//       id INTEGER PRIMARY KEY AUTOINCREMENT,
//       pin BOOLEAN NOT NULL,
//       title TEXT NOT NULL,
//       content TEXT NOT NULL,
//       createdTime TEXT NOT NULL
//     )
//     ''');
//   }
//
//   Future<bool?> InsertEntry() async{
//     final db = await instance.database;
//     await db!.insert("Notes", {"id" : 233,"pin" : 0 , "title" : "CODE WITH DHRUV IS BEST CHANNEL FOR LEARNING FLUTTER" , "content" : "THIS IS MY NOTE CONTENT" , "createdTime" : "26 Jan 2018"});
//     return true;
//   }
//
//   Future<String> readAllNotes() async{
//     final db = await instance.database;
//     final orderBy = 'createdTime ASC';
//     final query_result = await db!.query("Notes",orderBy: orderBy);
//     print(query_result);
//     return "SUCCESFULL";
//   }
//
//   Future<String?> readOneNote(int id) async{
//     final db = await instance.database;
//     final map = await db!.query("Notes" ,
//         columns: ["title"] ,
//         where: 'id = ?',
//         whereArgs: [id]
//     );
//     print(map);
//   }
//
//
//
// }