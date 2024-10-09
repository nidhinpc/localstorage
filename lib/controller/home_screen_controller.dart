import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

class HomeScreenController {
  static late Database MyDatabase;
  static Future initDb() async {
    if (kIsWeb) {
      // Change default factory on the web
      databaseFactory = databaseFactoryFfiWeb;
    }

    // open the database
    Database MyDatabase = await openDatabase("employeedata.db", version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
          'CREATE TABLE Employee(id INTEGER PRIMARY KEY, name TEXT, designation TEXT)');
    });
  }

  static Future addEmployee() async {
    MyDatabase.rawInsert('INSERT INTO Test(name, designation) VALUES( ?, ?)',
        ['nidhin', 'flutter']);
    getAllEmployees();
  }

  static Future getAllEmployees() async {
    // Get the records
    List<Map> employeedata =
        await MyDatabase.rawQuery('SELECT * FROM Employee');
    print(employeedata);
  }

  removeEmployee() {}

  updateEmployee() {}
}
