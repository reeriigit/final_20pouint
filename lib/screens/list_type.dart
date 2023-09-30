import 'package:flutter/material.dart';
import 'package:flutter_conn_database/model/Transactions.dart';
import 'package:flutter_conn_database/providers/Transaction_provider.dart';
import 'package:provider/provider.dart';

class ListType extends StatelessWidget {
  final String type;

  ListType({required this.type});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List by Type: $type"),
      ),
      body: Consumer<TransactionProvider>(
        builder: (context, provider, widget) {
          // กรองข้อมูลตาม type ที่รับมา
          List<Transactions> filteredTransactions = provider.transactions
              .where((transaction) => transaction.type == type)
              .toList();

          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // 2 คอลัมน์
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
            ),
            itemCount: filteredTransactions.length,
            itemBuilder: (context, index) {
              Transactions data = filteredTransactions[index];
              return Container(
                
                margin: const EdgeInsets.only(top: 10,left: 5,right: 5,bottom: 10),
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.blue),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5,
                      spreadRadius: 2,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  // ignore: unnecessary_null_comparison
                  child: data.image != null
                      ? Image.file(
                          data.image,
                          width: 200,
                          height: 200,
                          fit: BoxFit.cover,
                        )
                      : Placeholder(
                          fallbackWidth: 200,
                          fallbackHeight: 200,
                        ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}