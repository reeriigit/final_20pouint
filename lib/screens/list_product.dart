import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_conn_database/model/Transactions.dart';
import 'package:flutter_conn_database/providers/Transaction_provider.dart';
import 'package:flutter_conn_database/screens/detail_screen.dart';
import 'package:flutter_conn_database/screens/selectTypeShow.dart';
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
      backgroundColor: Colors.black,
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
        padding: EdgeInsets.only(top: 0.0),
        child: Consumer(
          builder: (context, TransactionProvider provider, widget) {
            return CustomScrollView(
              slivers: <Widget>[
                SliverToBoxAdapter(
                  child: SelectTypeShow()
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, int index) {
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
                          margin: const EdgeInsets.only(top: 5,left: 5,right: 5,bottom: 5),
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                            border: Border.all(width: 3, color: Colors.blue),
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 3,
                                spreadRadius: 1,
                                offset: Offset(1, 2),
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
                        ),
                      );
                    },
                    childCount: provider.transactions.length,
                  ),
                ),
                SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (context, int index) {
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
                      );
                    },
                    childCount: provider.transactions.length,
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

