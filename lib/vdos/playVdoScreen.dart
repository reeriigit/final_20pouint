import 'package:flutter/material.dart';
import 'package:flutter_conn_database/model/Transactions.dart';

class PlayVdoScreen extends StatefulWidget {
  final Transactions data;

  PlayVdoScreen(this.data);

  @override
  State<PlayVdoScreen> createState() => _PlayVdoScreenState();
}

class _PlayVdoScreenState extends State<PlayVdoScreen> {
  @override
  Widget build(BuildContext context) {
    Transactions data = widget.data; // เข้าถึงข้อมูลที่ถูกส่งเข้ามาผ่านคอนสตรักเตอร์

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(data.name), // ใช้ข้อมูล data.name เป็นชื่อใน AppBar
      ),
      body: Column(
        children: [
          Container(
            
            width: double.infinity,
          )
        ],
      )
    );
  }
}
