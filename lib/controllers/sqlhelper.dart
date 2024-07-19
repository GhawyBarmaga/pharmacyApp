import 'package:path_provider/path_provider.dart';
import 'package:pharmacy_app/models/customers.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DatabaseHelper{
  final databaseName = "pharmacy.db";

  //It must be same as your column in table with json model
  String customersTbl = '''
  CREATE TABLE customers (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  custname TEXT NOT NULL,
  company TEXT NOT NULL,
  amount INTEGER,
  currentDate TEXT,
  phone INTEGER,
  address TEXT
  )''';

  //Database connection
  Future<Database> init()async{
    final databasePath = await getApplicationDocumentsDirectory();
    final path = "${databasePath.path}/$databaseName";
    return openDatabase(path,version: 1,onCreate: (db,version)async{

      //Tables
      await db.execute(customersTbl);

    });
  }

  //CRUD Methods

  //Get
  Future<List<Customers>> getcustomers()async{
    final Database db = await init();
    List<Map<String,Object?>> result = await db.query("customers",orderBy: "id DESC");
    return result.map((e) => Customers.fromJson(e)).toList();
  }

  //Insert
  Future<int> insertcustomer(Customers customer)async{
    final Database db = await init();
    return db.insert("customers", customer.toJson());
  }

  //Update
  Future<int> updatecustomer(String custname, String company, int phone, String address,int amount, int id )async{
    final Database db = await init();
    return db.rawUpdate("update customers set custname = ?, company = ?,phone=?,address=?,amount=? where id = ?"
    ,[custname,company,phone,address,amount,id]);
  }

  //Delete
  Future<int> deletecustomer(int id)async{
    final Database db = await init();
    return db.delete("customers",where: "id = ?",whereArgs: [id]);
  }

  Future<List<Customers>> filter(String keyword)async{
    final Database db = await init();
    List<Map<String,Object?>> result = await db.rawQuery("select * from customers where custname LIKE ? OR company LIKE ?"
    ,["%$keyword%","%$keyword%"]);
    return result.map((e) => Customers.fromJson(e)).toList();
  }

 }