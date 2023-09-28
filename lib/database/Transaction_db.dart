import 'dart:io';
import 'dart:typed_data';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import '../model/Transactions.dart';

class TransactionDB {
  String dbname;

  TransactionDB({required this.dbname});

  Future<Database> openDatabase() async {
    //หาตำแหน่งที่จะเก็บข้อมูล
    Directory appDirectory = await getApplicationDocumentsDirectory();
    String dbLocation = join(appDirectory.path, dbname);
    // สร้าง database
    DatabaseFactory dbFactory = await databaseFactoryIo;
    Database db = await dbFactory.openDatabase(dbLocation);
    return db;
  }
  //save data
Future<int> insertData(Transactions statement) async {
  var db = await this.openDatabase();
  var store = intMapStoreFactory.store("express");

  // Convert the File to Uint8List
  Uint8List fileBytes = await statement.image.readAsBytes();
  
  // Convert the Uint8List to List<int>
  List<int> intList = fileBytes.toList();

  // Add the data to the store
  var keyID = store.add(db, {
    "name": statement.name,
    "auName": statement.auName,
    "date": statement.date,
    "type": statement.type,
    "amount": statement.amount,
    "image": intList, // Store the List<int>
  });

  // Close the database
  db.close();

  return keyID;
}


  //create method pull data
  Future<bool> loadAllDta() async {
    var db = await this.openDatabase();
    var store = intMapStoreFactory.store("expense");
    var snapshot = await store.find(db);

    print(snapshot);
    return true;
  }
}
