import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_conn_database/model/Transactions.dart';
import 'package:flutter_conn_database/providers/Transaction_provider.dart';
import 'package:flutter_conn_database/screens/detail_screen.dart';
import 'package:flutter_conn_database/screens/selectTypeShow.dart';
import 'package:flutter_conn_database/users_profile/profilePage.dart';
import 'package:flutter_conn_database/vdos/playVdoScreen.dart';
import 'package:flutter_conn_database/vdos/vdos_screen.dart';
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VdoScreen(),
                ),
              );
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilePage(),
                ),
              );
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
                SliverToBoxAdapter(child: SelectTypeShow()),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, int index) {
                      Transactions data = provider.transactions[index];
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
                          ));
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
                          width: 200,
                          height: 400,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.black,
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
                                    height: 400,
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
