import 'package:flutter/material.dart';
import 'package:flutter_conn_database/model/Transactions.dart';

class DetailScreen extends StatelessWidget {
  final Transactions data;

  DetailScreen(this.data);

  final TextEditingController reviewController =
      TextEditingController(); // เพิ่ม Controller สำหรับ TextFormField

  @override // เก็บความคิดเห็นที่ผู้ใช้เพิ่มเข้ามา

  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text(data.name),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 0.1,
                        spreadRadius: 1,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
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
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(top: 10),
                  width: double.infinity,
                  height: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 0.1,
                        spreadRadius: 1,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Discription",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w800),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10, bottom: 10),
                        child: Text(
                          data.detail,
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.w700),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            height: 200,
                            width: 150,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Text(
                                    "Name ",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Text(
                                    "Athor Name ",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Text(
                                    "Date",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Text(
                                    "Type ",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 200,
                            width: 200,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 9),
                                  child: Text(
                                    data.name,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w800,
                                        fontSize: 15),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Text(
                                    data.auName,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w800,
                                        fontSize: 15),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Text(
                                    data.date,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w800,
                                        fontSize: 15),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Text(
                                    data.type,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w800,
                                        fontSize: 15),
                                  ),
                                )
                              ],
                            ),
                          ),
                          //
                        ],
                      ),
                      //สรุปคนดู
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 20,right: 20),
                            child: Text(
                              "2,423,426",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 15),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20,right: 20),
                            child: Text(
                              "12,424,663",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 15),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20,right: 10),
                            child: Text(
                              data.date,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 15),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 40,right: 40),
                            child: Text(
                              "ชอบ",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 15),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 40,right: 40),
                            child: Text(
                              "ยอดดู",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 15),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 40,right: 10),
                            child: Text(
                              "date",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 15),
                            ),
                          )
                        ],
                      ),
                      //จบสรุปคนดู
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class StarRating extends StatefulWidget {
  @override
  _StarRatingState createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  int _rating = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        buildStar(1),
        buildStar(2),
        buildStar(3),
        buildStar(4),
        buildStar(5),
      ],
    );
  }

  Widget buildStar(int starNumber) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _rating = starNumber;
        });
      },
      child: Icon(
        _rating >= starNumber ? Icons.star : Icons.star_border,
        color: Colors.amber, // สีของดาวที่ถูกเลือก
        size: 30.0,
      ),
    );
  }
}
