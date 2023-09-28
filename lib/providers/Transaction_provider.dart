import 'package:flutter/foundation.dart';
import 'package:flutter_conn_database/model/Transactions.dart';
import 'package:flutter_conn_database/database/Transaction_db.dart';


class TransactionProvider with ChangeNotifier {
  List<Transactions> transactions = [];

  List<Transactions> getTransaction() {
    return transactions;
  }
  // void initData() async{
  //         var db=TransactionDB(dbname: "transactions.db");
  //         //ดึงข้อมูลมาแสดงผล
  //         transactions=await db.loadAllData();
  //         notifyListeners();
  //     }


  void addTransaction(Transactions statement) async {
    var db = TransactionDB(dbname: "Transactions.db");

    //save data
    await db.insertData(statement,);

    //pull data then select
    await db.loadAllDta();

    transactions.insert(0,statement);
    //save data
  
    //alert consumer
    notifyListeners();
  }
}
