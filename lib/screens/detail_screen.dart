import 'package:flutter/material.dart';
import 'package:flutter_conn_database/model/Transactions.dart';


class DetailScreen extends StatelessWidget {
  // const MovieDataScreen({super.key});
  final Transactions data;
  DetailScreen(this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Scaffold(
          appBar: AppBar(
            title: Text(data.name),
          ),
          body: Container(
            decoration: BoxDecoration(color: Colors.black),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                // Image.network(
                //   "",
                //   height: 300,
                //   width: 400,
                //   fit: BoxFit.fitWidth,
                // ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  width: 400,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red),
                      borderRadius: BorderRadius.circular(5)),
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
                              color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "",
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 22.0, color: Colors.white),
                        ),
                      ),
                      Center(
                        child: Flex(
                          direction: Axis
                              .horizontal, // Change to Axis.vertical for a column layout
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Flexible(
                              flex: 1,
                              child: Card(
                                color: Colors.red,
                                child: ListTile(
                                  title: Text("เข้ารับชม",style: TextStyle(color: Colors.white),),
                                  trailing: Icon(Icons.arrow_right_rounded,color: Colors.white,),
                                  onTap: () {
                                    
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
                  padding: const EdgeInsets.all(8.0),
                  margin: const EdgeInsets.all(8.0),
                  width: 400,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red),
                      borderRadius: BorderRadius.circular(5)),
                  child: Expanded(
                    child: Text(
                      "movie.detail",
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 16.0, color: Colors.white),
                    ),
                  ),
                )
              ]),
            ),
          )),
    );
  }
}

// class DetailProduct extends StatefulWidget {
//   const DetailProduct({super.key});

//   @override
//   State<DetailProduct> createState() => _DetailProductState();
// }

// class _DetailProductState extends State<DetailProduct> {
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Container(
//         width: 100,
//         height: 100,
//         decoration: BoxDecoration(color: Colors.red),
//       ),
//     );
//   }
// }
