import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:test_project/habit.dart';

class HabitsDatabase {
  static final HabitsDatabase instance = HabitsDatabase._init();
  static Database? _database;

  HabitsDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('habits.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    final colorType = 'COLOR NOT NULL';
    final integerType = 'INTEGER NOT NULL';

    await db.execute('''
CREATE TABLE $tableHabits ( 
  ${HabitFields.id} $idType, 
  ${HabitFields.name} $textType,
  ${HabitFields.description} $textType,
  ${HabitFields.numRepetitions} $integerType,
  ${HabitFields.interval} $integerType,
  ${HabitFields.color} $colorType,
  ${HabitFields.createdTime} $textType
  )
''');
  }

  Future<Habit> create(Habit habit) async {
    final db = await instance.database;

    // final json = note.toJson();
    // final columns =
    //     '${NoteFields.title}, ${NoteFields.description}, ${NoteFields.time}';
    // final values =
    //     '${json[NoteFields.title]}, ${json[NoteFields.description]}, ${json[NoteFields.time]}';
    // final id = await db
    //     .rawInsert('INSERT INTO table_name ($columns) VALUES ($values)');

    final id = await db.insert(tableHabits, habit.toJson());
    return habit.copy(id: id);
  }

  Future<Habit> readHabit(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableHabits,
      columns: HabitFields.values,
      where: '${HabitFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Habit.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<Habit>> readAllHabits() async {
    final db = await instance.database;

    final orderBy = '${HabitFields.createdTime} ASC';
    // final result =
    //     await db.rawQuery('SELECT * FROM $tableNotes ORDER BY $orderBy');

    final result = await db.query(tableHabits, orderBy: orderBy);

    return result.map((json) => Habit.fromJson(json)).toList();
  }

  Future<int> update(Habit habit) async {
    final db = await instance.database;

    return db.update(
      tableHabits,
      habit.toJson(),
      where: '${HabitFields.id} = ?',
      whereArgs: [habit.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
      tableHabits,
      where: '${HabitFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
