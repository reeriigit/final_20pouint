// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_conn_database/model/Transactions.dart';
import 'package:flutter_conn_database/providers/Transaction_provider.dart';
import 'package:provider/provider.dart';

class ListProduct extends StatefulWidget {
  const ListProduct({super.key});

  @override
  State<ListProduct> createState() => _ListProductState();
}

class _ListProductState extends State<ListProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("App Creater"),
          actions: [
            IconButton(
              onPressed: () {
                SystemNavigator.pop();
              },
              icon: Icon(Icons.exit_to_app),
            )
          ],
        ),
        body:
            Consumer(builder: (context, TransactionProvider provider, widget) {
          var count = provider.transactions.length;
          if (count <= 0) {
            return Center(
              child: Text(
                "ไม่พบข้อมูล",
                style: TextStyle(fontSize: 20),
              ),
            );
          } else {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // Number of columns
                crossAxisSpacing: 10.0, // Spacing between columns
                mainAxisSpacing: 10.0, // Spacing between rows
              ),
              itemCount: provider.transactions.length,
              itemBuilder: (context, int index) {
                Transactions data = provider.transactions[index];
                return Card(
                  elevation: 5,
                  margin: const EdgeInsets.all(10.0),
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.blue),
                    ),
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
          }
        }));
  }
}
