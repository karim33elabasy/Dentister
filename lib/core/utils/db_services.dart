import 'package:sqflite/sqflite.dart';

class DbServices {
  final Database database;
  DbServices(this.database);

  static Future<Database> creatingDatabase() async {
    String dbFolder = await getDatabasesPath();
    String dbPath = "$dbFolder/datvaa.db";
    return await openDatabase(dbPath, version: 2, onCreate: _onCreate);
  }

  static _onCreate(Database db, version) async {
    await db.execute("""CREATE TABLE IF NOT EXISTS patients (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    currentPatient INTEGER NOT NULL,
    name TEXT NOT NULL,
    gender TEXT NOT NULL,
    dateBirth INTEGER,
    phone TEXT,
    email TEXT,
    address TEXT,
    notes TEXT,
    dentalHistory TEXT,
    medicalHistory TEXT,
    familyHistory TEXT,
    allergies TEXT,
    dentalNotes TEXT,
    lastVisit INTEGER,
    labTest TEXT,
    color TEXT)""");

    await db.execute("""CREATE TABLE IF NOT EXISTS visits (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    name TEXT NOT NULL,
    visitDone INTEGER NOT NULL,
    patientId INTEGER NOT NULL,
    title TEXT NOT NULL,
    note TEXT,
    visitDate INTEGER NOT NULL  -- stores epoch time
    )""");

    await db.execute("""CREATE TABLE IF NOT EXISTS finances (
    financeId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    patientId INTEGER NOT NULL,
    visitId INTEGER,
    isIn INTEGER NOT NULL,
    visitNotes TEXT,
    date INTEGER,
    value INTEGER NOT NULL)""");
  }

  readData(String table,String? where,List<Object?>? whereArgs) async {
    return await database.query(table,where:where,whereArgs: whereArgs);
  }

  Future<int> insertData(String table, Map<String, Object?> values) async {
    return await database.insert(table, values);
  }

  deleteData(String table,int id) async {
    return await database.delete(table,where: "id = ?",whereArgs: [id]);
  }

  updateData({required String table, required Map<String,Object?> values, required String? where, required List<Object?>? whereArgs}) async {
    return await database.update(table, values, where: where,whereArgs: whereArgs);
  }
}
