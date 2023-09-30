import 'package:flutter/material.dart';
import 'package:flutter_conn_database/screens/list_type.dart';

class SelectTypeShow extends StatefulWidget {
  const SelectTypeShow({super.key});

  @override
  State<SelectTypeShow> createState() => _SelectTypeShowState();
}

class _SelectTypeShowState extends State<SelectTypeShow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            // เมื่อคลิกที่ Container นี้ ให้ทำการนำทางไปยังหน้า ListType พร้อมส่ง type "A"
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ListType(
                  type: "A",
                ),
              ),
            );
          },
          child: Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(top: 10, bottom: 10, left: 10),
            child: Text(
              "All",
              style: TextStyle(color: Colors.white),
            ),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            // เมื่อคลิกที่ Container นี้ ให้ทำการนำทางไปยังหน้า ListType พร้อมส่ง type "A"
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ListType(
                  type: "B",
                ),
              ),
            );
          },
          child: Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(top: 10, bottom: 10, left: 10),
            child: Text(
              "Drama",
              style: TextStyle(color: Colors.white),
            ),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            // เมื่อคลิกที่ Container นี้ ให้ทำการนำทางไปยังหน้า ListType พร้อมส่ง type "A"
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ListType(
                  type: "C",
                ),
              ),
            );
          },
          child: Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(top: 10, bottom: 10, left: 10),
            child: Text(
              "Love",
              style: TextStyle(color: Colors.white),
            ),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        )
      ],
    );
  }
}
