import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_conn_database/providers/Transaction_provider.dart';
import 'package:provider/provider.dart';

import '../model/Transactions.dart';
import 'detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      appBar: AppBar(
        title: Text("App Creator"),
        actions: [
          IconButton(
            onPressed: () {
              SystemNavigator.pop();
            },
            icon: Icon(Icons.exit_to_app),
          )
        ],
      ),
      body: Consumer<TransactionProvider>(
        builder: (context, provider, child) {
          var count = provider.transactions.length;
          if (count <= 0) {
            return Center(
              child: Text(
                "ไม่พบข้อมูล",
                style: TextStyle(fontSize: 20, color: Colors.blue),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: provider.transactions.length,
              itemBuilder: (context, int index) {
                Transactions data = provider.transactions[index];
                return Card(
                 
                  margin: const EdgeInsets.all(5.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
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
                    ),
                    title: Text(data.name),
                    subtitle: Text(
                      data.auName +
                          "\n" +
                          data.date +
                          "\n" +
                          data.type +
                          "\n" 
                        
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(data),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
