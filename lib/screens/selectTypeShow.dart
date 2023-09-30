import 'package:flutter/material.dart';
import 'package:flutter_conn_database/screens/list_product.dart';
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
                builder: (context) => ListProduct()
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
              color: Color.fromARGB(255, 41, 41, 41),
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
                  type: "Drama",
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
              color: Color.fromARGB(255, 41, 41, 41),
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
                  type: "Action",
                ),
              ),
            );
          },
          child: Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(top: 10, bottom: 10, left: 10),
            child: Text(
              "Action",
              style: TextStyle(color: Colors.white),
            ),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 41, 41, 41),
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
                  type: "Love",
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
              color: Color.fromARGB(255, 41, 41, 41),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        )
      ],
    );
  }
}
