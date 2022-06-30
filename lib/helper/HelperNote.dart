import 'package:note_app/Model/todoModel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:async';
import 'dart:io' as io;

class Note {

  static Database? _db;

  static Future <Database?> get db async {
    if (_db==null)
      {
        _db= await intialDB();
        return _db;
      }
    else
      return _db;

  }

  static intialDB() async {
    io.Directory directory= await getApplicationDocumentsDirectory();
    String path= join(directory.path,"todolist.db");
    var mydb= await openDatabase(path,version: 1,onCreate: _onCreate);
    return mydb;
  }


   static _onCreate(Database db, int version) {
    db.execute("CREATE TABLE todo(id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,description TEXT NOT NULL,title TEXT NOT NULL,date TEXT NOT NULL, done TEXT NOT NULL)");
    print("table has been created");
  }

  static Future <int> insertdb(Map<String,dynamic>data)async{
    Database? db_clint=await db;
    var result =await db_clint!.insert("todo", data);
    return result;
  }

  static Future <int> deleteNote(int id)async{
    Database? db_clint=await db;
    var result =await db_clint!.rawUpdate('DELETE FROM todo WHERE id="$id"');
    return result;
  }

  static Future <int> updatNote(String note,int id)async{
    Database? db_clint=await db;
    var result =await db_clint!.rawUpdate("UPDATE todo SET note='$note' WHERE id='$id'");
    return result;
  }

  static Future <List> getData() async {
    Database? db_clint=await db;
    List<TodoModel> list=[];
    var result= await db_clint!.query("todo");
    for (var i in result)
      {
        TodoModel x=TodoModel(id: i["id"],description: i["description"],title: i["title"],date: i["date"],done: i["done"]);
        list.add(x);
      }
    return list;


  }

  static Future <List>getSingleRow(int id) async{
    Database? db_clint=await db;
    var result =await db_clint!.query("todo",where: 'id ="$id"');
    return result;
  }
}