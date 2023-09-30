import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text('โปรไฟล์'),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 10,left: 5,right: 5),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.blue,width: 3,)),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue,
                          blurRadius: 1,
                          spreadRadius: 2,
                          offset: Offset(0, 1),
                        ),
                      ],
                      border: Border.all(width: 5, color: Colors.blue),
                      borderRadius: BorderRadius.circular(100)),
                  width: 200,
                  height: 200,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(
                        'https://scontent.fbkk20-1.fna.fbcdn.net/v/t39.30808-6/371334382_1585498788923012_4347138309240839361_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=a2f6c7&_nc_eui2=AeGOcvaw0wT6nLGrE1iYJX6bBDOcQ32934AEM5xDfb3fgDIjcxLT1WDu7_n62EEDIx6hFNYwRbx4Wa7E3ASScsq8&_nc_ohc=s4dydqvsROwAX_D4A4c&_nc_ht=scontent.fbkk20-1.fna&oh=00_AfDdmRbsi8R9fuNzy7ZfxWpZecqS5rM5rVNTK3Yi3-70Kg&oe=651C9B40'),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'ชื่อของคุณ',
                  style: TextStyle(fontSize: 24,color: Colors.white),
                ),
                SizedBox(height: 10),
                Text(
                  'อีเมล: email@example.com', // เปลี่ยนเป็นอีเมลของคุณ
                  style: TextStyle(fontSize: 16,color: Colors.white),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    // เพิ่มโค้ดเมื่อคุณคลิกปุ่มแก้ไขโปรไฟล์
                    // ตัวอย่าง: Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfilePage()));
                  },
                  child: Text('แก้ไขโปรไฟล์'),
                ),
                Container(
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.blue)),
                )
              ],
            ),
          ),
        ),
        ));
  }
}
