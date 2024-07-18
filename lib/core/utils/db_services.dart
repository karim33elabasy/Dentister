import 'package:sqflite/sqflite.dart';

class DbServices{
  final Database database;
  DbServices(this.database);

  static Future<Database> creatingDatabase ()async{
    String dbFolder  = await getDatabasesPath();
    String dbPath = "$dbFolder/notes.db";
    return await openDatabase(dbPath,version: 1,onCreate: _onCreate);
  }
  static _onCreate(Database db, version)async{
    await db.execute(
      """CREATE TABLE 'notes'(
          'id' INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
          'title' TEXT NOT NULL,
          'body' TEXT NOT NULL,
          'day' INTEGER NOT NULL,
          'month' INTEGER NOT NULL,
          'year' INTEGER NOT NULL)
      """);
  }

  readData(String sql)async{
    return await database.rawQuery(sql);
  }

  writeData(String sql)async{
    return await database.rawInsert(sql);
  }

  deleteData(String sql)async{
    return await database.rawDelete(sql);
  }

  updateData(String sql)async{
    return await database.rawUpdate(sql);
  }

}