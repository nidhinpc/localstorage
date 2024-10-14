import 'package:sqflite/sqflite.dart';

class HomeScreenController {
  static late Database myDatabase;
  static List<Map> employeeDataList = [];
  static Future initDb() async {
    // open the database
    myDatabase = await openDatabase("employeeData.db", version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
          'CREATE TABLE employee (id INTEGER PRIMARY KEY, name TEXT, designation TEXT)');
    });
  }

  static Future addEmployee({required name, required designation}) async {
    await myDatabase.rawInsert(
        'INSERT INTO employee(name, designation) VALUES(?, ?)',
        [name, designation]);
    getAllEmployee();
  }

  static Future getAllEmployee() async {
    employeeDataList = await myDatabase.rawQuery('SELECT * FROM employee');
    print(employeeDataList);
  }

  static Future removeEmployee(int id) async {
    await myDatabase.rawDelete('DELETE FROM employee WHERE id = ?', [id]);
    getAllEmployee();
  }

  static Future updateEmployee(
      String newName, String newDesignation, int id) async {
    await myDatabase.rawUpdate(
        'UPDATE employee SET name = ?, designation = ? WHERE id = ?',
        [newName, newDesignation, id]);
    getAllEmployee();
  }
}
