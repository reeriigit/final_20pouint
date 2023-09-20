import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_conn_database/providers/Transaction_provider.dart';
import 'package:provider/provider.dart';

import '../model/Transactions.dart';
import 'detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            return ListView.builder(
                itemCount: provider.transactions.length,
                itemBuilder: (context, int index) {
                  Transactions data = provider.transactions[index];
                  return Card(
                    elevation: 5,
                    margin: const EdgeInsets.all(10.0),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: FittedBox(
                          child: data.image != null
                              ? Image.file(
                                  data.image!,
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
                      title: Text(data.name + "\n"),
                      subtitle: Text(
                        data.auName +
                            "\n" +
                            data.date +
                            "\n" +
                            data.type +
                            "\n" +
                            data.amount.toString() +
                            "\n",
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailScreen(data),
                            ));
                      },
                    ),
                  );
                });
          }
        }));
  }
}
