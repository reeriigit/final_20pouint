import 'package:flutter/material.dart';
import 'package:flutter_conn_database/model/Transactions.dart';
import 'package:flutter_conn_database/providers/Transaction_provider.dart';
import 'package:flutter_conn_database/screens/detail_screen.dart';
import 'package:provider/provider.dart';

class VdoScreen extends StatefulWidget {
  const VdoScreen({Key? key}) : super(key: key);

  @override
  State<VdoScreen> createState() => _VdoScreenState();
}

class _VdoScreenState extends State<VdoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      
      body: Padding(
        padding: EdgeInsets.only(top: 0.0),
        child: Consumer(
          builder: (context, TransactionProvider provider, widget) {
            return ListView.builder(
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
                    width: double.infinity,
                    height: 800, // กำหนดความสูงของ ListTile
                    child: Row(
                      children: [
                        Expanded(
                          // ใช้ Expanded เพื่อควบคุมพื้นที่ใน Row
                          child: Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              Image.file(
                                data.image,
                                fit: BoxFit.cover,
                              ),
                              Container(
                                width: 50,
                                  height: 50,
                                
                                padding: EdgeInsets.all(0),
                                margin: EdgeInsets.only(right: 10, bottom: 10),
                              
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  // ignore: unnecessary_null_comparison
                                  child: data.image != null
                                      ? Image.file(
                                          
                                          data.image,
                                          fit: BoxFit.cover,
                                        )
                                      : Placeholder(
                                          fallbackWidth: 50,
                                          fallbackHeight: 50,
                                        ),
                                ),
                              ),
                              Container(
                                // color: Colors.orange,
                                padding: EdgeInsets.all(10),
                                margin: EdgeInsets.only(right: 100),
                                width: 300,
                                height: 200,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data.detail,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18,
                                      ),
                                      maxLines:
                                          2, // กำหนดจำนวนบรรทัดสูงสุดที่ Text จะแสดง (ในกรณีนี้ 2 บรรทัด)
                                      overflow: TextOverflow
                                          .ellipsis, // เมื่อข้อมูลเกินจำนวนบรรทัดสูงสุดจะแสดง ...
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin:
                                    EdgeInsets.only(bottom: 100.0, right: 0.0),
                                // color: Colors.orange,
                                padding: EdgeInsets.all(10),
                                width: 80,
                                height: 300,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 70.0, // กำหนดความกว้างเป็น 50
                                      height: 70.0, // กำหนดความสูงเป็น 50
                                      child: Icon(
                                        Icons.supervised_user_circle,
                                        color: Colors.white,
                                        size: 50.0, // ขนาดของ icon ยังคงเป็น 30
                                      ),
                                    ),
                                    SizedBox(
                                      width: 70.0, // กำหนดความกว้างเป็น 50
                                      height: 70.0, // กำหนดความสูงเป็น 50
                                      child: Icon(
                                        Icons.favorite,
                                        color: Colors.white,
                                        size: 50.0, // ขนาดของ icon ยังคงเป็น 30
                                      ),
                                    ),
                                    SizedBox(
                                      width: 70.0, // กำหนดความกว้างเป็น 50
                                      height: 70.0, // กำหนดความสูงเป็น 50
                                      child: Icon(
                                        Icons.comment,
                                        color: Colors.white,
                                        size: 50.0, // ขนาดของ icon ยังคงเป็น 30
                                      ),
                                    ),
                                    SizedBox(
                                      width: 70.0, // กำหนดความกว้างเป็น 50
                                      height: 70.0, // กำหนดความสูงเป็น 50
                                      child: Icon(
                                        Icons.share,
                                        color: Colors.white,
                                        size: 50.0, // ขนาดของ icon ยังคงเป็น 30
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
