import 'package:sqflite/sqflite.dart';

class DbServices {
  final Database database;
  DbServices(this.database);

  static Future<Database> creatingDatabase() async {
    String dbFolder = await getDatabasesPath();
    String dbPath = "$dbFolder/note.db";
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
    labTest TEXT)""");

    await db.execute("""CREATE TABLE IF NOT EXISTS visits (
    visitId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    patientId INTEGER NOT NULL,
    visitDate INTEGER NOT NULL,  -- stores epoch time
    visitNotes TEXT)""");

    await db.execute("""CREATE TABLE IF NOT EXISTS finances (
    financeId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    patientId INTEGER NOT NULL,
    visitId INTEGER,
    isIn INTEGER NOT NULL,
    visitNotes TEXT,
    date INTEGER,
    value INTEGER NOT NULL)""");
  }

  readData(String sql) async {
    return await database.rawQuery(sql);
  }

  Future<int> insertData(String table, Map<String, Object?> values) async {
    return await database.insert(table, values);
  }

  deleteData(String sql) async {
    return await database.rawDelete(sql);
  }

  updateData(String sql) async {
    return await database.rawUpdate(sql);
  }
}
