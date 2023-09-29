import 'package:flutter/material.dart';
import 'package:flutter_conn_database/model/Transactions.dart';

class DetailScreen extends StatelessWidget {
  final Transactions data;

  DetailScreen(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(data.name),
      ),
      body: Container(
        color: Colors.black,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 400,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.red),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      data.toString(),
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
                            color: Colors.red,
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
            Container(
              margin: const EdgeInsets.all(8.0),
              width: 400,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.red),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "movie.detail", // ใส่ข้อความรายละเอียดที่ต้องการแสดง
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 16.0, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
