import 'package:flutter/material.dart';
import 'package:flutter_conn_database/model/Transactions.dart';
import 'package:flutter_conn_database/screens/detail_screen.dart';

class PlayVdoScreen extends StatefulWidget {
  final Transactions data;

  PlayVdoScreen(this.data);

  @override
  State<PlayVdoScreen> createState() => _PlayVdoScreenState();
}

class _PlayVdoScreenState extends State<PlayVdoScreen> {
  @override
  Widget build(BuildContext context) {
    Transactions data =
        widget.data; // เข้าถึงข้อมูลที่ถูกส่งเข้ามาผ่านคอนสตรักเตอร์

    return Scaffold(
        // backgroundColor: Colors.black,

        body: Column(
      children: [
        Container(
          width: 400,
          height: 250,
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
        Container(
          padding: EdgeInsets.only(left: 10, top: 10),
          // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          height: 300,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
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
              Text(data.date),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(data),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(),
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  width: 400,
                  // color: Colors.red,
                  child: Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        padding: EdgeInsets.all(0),
                        margin: EdgeInsets.only(right: 10, bottom: 0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
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
                        width: 220,
                        child: Text(
                          data.auName,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 10, left: 15, right: 10),
                        width: 90,
                        height: 35,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 0.1,
                                spreadRadius: 1,
                                offset: Offset(0, 1),
                              ),
                            ],
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          "subscribe",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Container(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 0.1,
                              spreadRadius: 1,
                              offset: Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 30.0, // กำหนดความกว้างเป็น 50
                              height: 30.0, // กำหนดความสูงเป็น 50
                              child: Icon(
                                Icons.thumb_up,
                                color: Colors.black,
                                size: 25.0, // ขนาดของ icon ยังคงเป็น 30
                              ),
                            ),
                            Text("2.4พัน"),
                            SizedBox(
                              width: 30.0, // กำหนดความกว้างเป็น 50
                              height: 30.0, // กำหนดความสูงเป็น 50
                              child: Icon(
                                Icons.thumb_down,
                                color: Colors.black,
                                size: 25.0, // ขนาดของ icon ยังคงเป็น 30
                              ),
                            ),
                          ],
                        )),
                    Container(
                        margin: EdgeInsets.only(right: 10),
                        padding: EdgeInsets.only(left: 10, right: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 0.1,
                              spreadRadius: 1,
                              offset: Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 30.0, // กำหนดความกว้างเป็น 50
                              height: 30.0, // กำหนดความสูงเป็น 50
                              child: Icon(
                                Icons.share,
                                color: Colors.black,
                                size: 25.0, // ขนาดของ icon ยังคงเป็น 30
                              ),
                            ),
                            Text("shere"),
                          ],
                        )),
                    Container(
                      // กำหนดความกว้างเป็น 50
                      height: 30.0,
                      margin: EdgeInsets.only(right: 10),
                      padding: EdgeInsets.only(top: 5, left: 10, right: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 0.1,
                            spreadRadius: 1,
                            offset: Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Text("Download"),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 15, top: 15),
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade300),
                width: double.infinity,
                height: 100,
                child: Text(
                  "comment",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        )
      ],
    ));
  }
}
