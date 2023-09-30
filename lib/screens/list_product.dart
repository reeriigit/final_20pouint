import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_conn_database/model/Transactions.dart';
import 'package:flutter_conn_database/providers/Transaction_provider.dart';
import 'package:flutter_conn_database/screens/detail_screen.dart';
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
        title: Text("Vshere"),
        actions: [
          IconButton(
            onPressed: () {
              SystemNavigator.pop();
            },
            icon: Icon(Icons.notifications),
          ),
          IconButton(
            onPressed: () {
              SystemNavigator.pop();
            },
            icon: Icon(Icons.search_sharp),
          ),
          IconButton(
            onPressed: () {
              SystemNavigator.pop();
            },
            icon: Icon(Icons.account_circle),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 20.0),
        child: Consumer(
          builder: (context, TransactionProvider provider, widget) {
            return Column(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(color: Colors.blue),
                  child: Text("ยอดนิยม"),
                ),
                Expanded(

                  child: ListView.builder(
                    
                    scrollDirection: Axis
                        .horizontal, // Set the scroll direction to horizontal
                    itemCount: provider.transactions.length,
                    itemBuilder: (context, int index) {
                      Transactions data = provider.transactions[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailScreen(data),
                            ),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.all(2.0),
                          width: 250,
                          height: 250,
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
                          // ignore: unnecessary_null_comparison
                          child: data.image != null
                              ? Image.file(
                                  data.image,
                                  width: 250,
                                  height: 250,
                                  fit: BoxFit.cover,
                                )
                              : Placeholder(
                                  fallbackWidth: 200,
                                  fallbackHeight: 200,
                                ),
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                    ),
                    itemCount: provider.transactions.length,
                    itemBuilder: (context, int index) {
                      Transactions data = provider.transactions[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailScreen(data),
                            ),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.all(2.0),
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
                          // ignore: unnecessary_null_comparison
                          child: data.image != null
                              ? Image.file(
                                  data.image,
                                  width: 300,
                                  height: 300,
                                  fit: BoxFit.cover,
                                )
                              : Placeholder(
                                  fallbackWidth: 200,
                                  fallbackHeight: 200,
                                ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
