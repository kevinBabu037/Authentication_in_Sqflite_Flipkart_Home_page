// ignore: depend_on_referenced_packages
import 'package:flipkart_home/data/shared_prefrenses/shared_prefrenses.dart';
// ignore: depend_on_referenced_packages
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flipkart_home/data/model/user_model.dart';

class SqfliteService {

  static final SqfliteService _instance = SqfliteService._internal();
  Database? _db;

 
  factory SqfliteService() {
    return _instance; 
  }

  SqfliteService._internal();

  Future<void> initializeDatabase() async {
    if (_db != null) return;

    _db = await openDatabase(
      join(await getDatabasesPath(), 'user.db'),
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          "CREATE TABLE user (id INTEGER PRIMARY KEY AUTOINCREMENT, email TEXT UNIQUE, name TEXT, password TEXT)",
        );
      },
    );
  } 

  Future<Database> _getDb() async {
    if (_db == null) {
      await initializeDatabase();
    }
    return _db!;
  }

  Future<int> addUser(UserModel user) async {
    final db = await _getDb();
    final int result = await db.insert(
      'user',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    if (result != 0) {
      await SharedPreferenses.saveBoolValue(true); 
    }
    return result;
  }


  Future<UserModel?> loginUser(String email, String password) async {
    final db = await _getDb();
    final List<Map<String, dynamic>> maps = await db.query(
      'user',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );

    if (maps.isNotEmpty) {
     SharedPreferenses.saveBoolValue(true);
      return UserModel.fromMap(maps.first);

    } else {
      return null;
    }
  }

  Future<List<UserModel>> getAllUsers() async {
    final db = await _getDb();
    final List<Map<String, dynamic>> maps = await db.query('user');
    return List.generate(maps.length, (i) {
      return UserModel.fromMap(maps[i]);
    });
  }

  
}
