import 'package:flutter/material.dart';
import 'package:flutter_conn_database/model/Transactions.dart';
import 'package:flutter_conn_database/providers/Transaction_provider.dart';
import 'package:flutter_conn_database/screens/detail_screen.dart';
import 'package:flutter_conn_database/vdos/playVdoScreen.dart';
import 'package:provider/provider.dart';

class ListType extends StatelessWidget {
  final String type;

  ListType({required this.type});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
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
              crossAxisCount: 1, // 2 คอลัมน์
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
            ),
            itemCount: filteredTransactions.length,
            itemBuilder: (context, index) {
              Transactions data = filteredTransactions[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PlayVdoScreen(data),
                    ),
                  );
                },
                child: Container(
                            margin: EdgeInsets.only(bottom: 10),
                            // color: Colors.black,
                            padding: EdgeInsets.only(top: 5),
                            child: Column(
                              children: [
                                Container(
                                  width: 400,
                                  height: 200,
                                  decoration: BoxDecoration(),
                                  child: ClipRRect(
                                    // ignore: unnecessary_null_comparison
                                    child: data.image != null
                                        ? Image.file(
                                            data.image,
                                            fit: BoxFit.cover,
                                          )
                                        : Placeholder(
                                            fallbackWidth: 200,
                                            fallbackHeight: 200,
                                          ),
                                  ),
                                ),
                                Card(
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      radius: 25,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(250),
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
                                    ),
                                    title: Text(
                                      data.detail,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18,
                                      ),
                                      maxLines:
                                          2, // กำหนดจำนวนบรรทัดสูงสุดที่ Text จะแสดง (ในกรณีนี้ 2 บรรทัด)
                                      overflow: TextOverflow
                                          .ellipsis, // เมื่อข้อมูลเกินจำนวนบรรทัดสูงสุดจะแสดง ...
                                    ),
                                    subtitle: Text(
                                        data.type +
                                        "\n" +
                                        data.date +
                                        "\n" 
                                        
                                        ),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              DetailScreen(data),
                                        ),
                                      );
                                    },
                                  ),
                                )
                              ],
                            ),
                          )
              );
            },
          );
        },
      ),
    );
  }
}
