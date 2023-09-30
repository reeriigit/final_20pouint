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
        backgroundColor: Colors.black,
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
                  width: 400,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          data.name,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 17.0,
                            fontStyle: FontStyle.italic,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
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
                      Center(
                        child: Flex(
                          direction: Axis.horizontal,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Flexible(
                              flex: 1,
                              child: Card(
                                color: Colors.blue,
                                child: ListTile(
                                  title: Text(
                                    "เข้ารับชม",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  trailing: Icon(
                                    Icons.arrow_right_rounded,
                                    color: Colors.white,
                                  ),
                                  onTap: () {
                                    // ทำอะไรก็ตามที่คุณต้องการเมื่อคลิกที่ "เข้ารับชม"
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.all(2.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            data.auName,
                            textAlign: TextAlign.justify,
                            style:
                                TextStyle(fontSize: 16.0, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.all(2.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            data.type,
                            textAlign: TextAlign.justify,
                            style:
                                TextStyle(fontSize: 16.0, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.all(2.0),
                  width: 400,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      data.date,
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 16.0, color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(2.0),
                  width: 400,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    border: Border.all(color: Colors.blue),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      data.detail,
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 16.0, color: Colors.white),
                    ),
                  ),
                ),
                Center(
                  child: StarRating(),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.blue)),
                  child: TextFormField(
                    controller: reviewController, // กำหนด Controller
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      labelText: "Description Satisfaction",
                      labelStyle: TextStyle(
                        color: Colors.white,
                      ),
                      alignLabelWithHint: true,
                      contentPadding: EdgeInsets.symmetric(vertical: 0.0),
                      hintText: "Enter your description here",
                      hintStyle: TextStyle(
                        color: Colors.white,
                      ),
                      filled: true,
                      fillColor: Colors.black,
                    ),
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
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


