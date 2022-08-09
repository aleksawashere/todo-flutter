import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';
import 'package:flutter/widgets.dart';

import 'models/task.dart';

class DatabaseHelper{

  //Method for creating database
  Future<Database> database() async{
    WidgetsFlutterBinding.ensureInitialized();
    return openDatabase(
        join(await getDatabasesPath(), 'todo_v3.db'),
        onCreate: (db, version) {
          return db.execute(
            "CREATE TABLE tasks(id INTEGER PRIMARY KEY NOT NULL, title TEXT, description TEXT)",
          );
        },
      version: 1,
    );
  }

  Future<void> insertTask(Task task) async {

    final db = await database();
    await db.insert(
        'tasks',
        task.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
    );

  }

  Future<List<Task>> getTasks() async{
    Database _db = await database();
    List<Map<String,dynamic>> taskMap = await _db.query('tasks');
    return List.generate(taskMap.length, (index) {
      return Task(id: taskMap[index]['id'],title: taskMap[index]['title'], description: taskMap[index]['description']);
    });
  }
}