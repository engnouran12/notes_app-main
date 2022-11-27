import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
late Database db;
class Sqlflite{
 Future createDatabase() async {
    db = await openDatabase('todo.db', version: 1, onCreate: ((db, version) {
      print('database is created');
      db
          .execute(
              'CREATE TABLE Test (id INTEGER PRIMARY KEY, name TEXT, value INTEGER, num REAL)')
          .then((value) {
        print(' table is created');
      }).catchError((onError) {
        print('error on creating table ${onError.toString()}');
      });
    }), onOpen: (db) {
      print('db is opended');
    });
  }

  Future<Database?> get database async {
    if (db == null) {
      // initialize database from _createDatabase result.
      db = await createDatabase();
      return db;
    }
    // because _database have beeen initialized above,
    // then we can use ! to tell that the _database can't be null.
    else {
      return db;
    }
  }

  //insert to db manual
  Future<void> inserttodb({
    required String tittle,
     required String subTitle,
    
  }) async {
    await db.transaction((txn) async {
      return txn
          .rawInsert(
              'INSERT INTO Test(tittle, time, date) VALUES("$tittle", "$subTitle", )')
          .then((value) {
        print('$value  one rec inesrted');
      }).catchError((onError) {
        print('error on insert table ${onError.toString()}');
      });
    });
  }
}
