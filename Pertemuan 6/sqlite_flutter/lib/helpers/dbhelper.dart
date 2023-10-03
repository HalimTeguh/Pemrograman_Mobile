import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqlite_flutter/models/item.dart';



class DbHelper {
  static DbHelper? _dbHelper;
  static Database? _database;
  DbHelper.createObject();


  Future<Database> initDb() async {

    //Untuk menentukan nama database dan lokasi yang dibuat
    Directory directory = await getApplicationDocumentsDirectory();

    String path = directory.path + 'item.db';

    //create, read databases
    var itemDatabase = openDatabase(path, version: 1, onCreate: _createDb);

    //mengambalikan nilai object sebagai hasili dari fungsinya
    return itemDatabase;
  }

  //buat table baru dengan nama item
  void _createDb(Database db, int version) async {
    await db.execute(
        "CREATE TABLE item(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, price INTEGER)");
  }

  //select databases
  Future<List <Map <String, dynamic>>> select() async{
    Database db = await this.initDb();

    var mapList = await db.query('item', orderBy: 'name');

    return mapList;
  }


  //create databases
  Future<int> insert(Item object) async {
    Database db = await this.initDb();

    int count = await db.insert('item', object.toMap());

    return count;
  }

  Future<int> update(Item object) async{
    Database db = await this.initDb();

    int count = await db.update('item', object.toMap(),
    where: 'id=?',
    whereArgs: [object.id]);

    return count;
  }

  Future<int> delete(int id) async{
    Database db = await this.initDb();
    int count = await db.delete('item', where: 'id=?', whereArgs: [id]);

    return count;
  }

  Future <List <Item>> getItemList() async {
    var itemMapList = await select();

    int count = itemMapList.length;





    //Ini tidak sesuai dengan jobsheet
    List<Item> itemList = List<Item>.from(itemMapList.map((itemMap) => Item.fromMap(itemMap)));

    for(int i = 0; i<count; i++){
      itemList.add(Item.fromMap(itemMapList[i]));
    }

    return itemList;
  }

  factory DbHelper(){
    if(_dbHelper == null){
      _dbHelper = DbHelper.createObject();
    }

    return _dbHelper!;
  }

  Future<Database?> get database async{
    if (_database == null){
      _database = await initDb();
    }

    return _database;
  }

}

