import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_conn_database/main.dart';
import 'package:flutter_conn_database/model/Transactions.dart';
import 'package:flutter_conn_database/providers/Transaction_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final nameController = TextEditingController();
  final auNameController = TextEditingController();
  String selectedType = 'Drama';
  final detailController = TextEditingController();
  DateTime _dataTime = DateTime.now();
  File? _selectedImage;
  final ImagePicker _imagePicker = ImagePicker();

  void _showDataPicker() {
    showDatePicker(
      context: context,
      initialDate: _dataTime,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    ).then((value) {
      if (value != null) {
        setState(() {
          _dataTime = DateTime(value.year, value.month, value.day);
        });
      }
    });
  }

  Future<void> _pickImageFromGallery() async {
    final pickedImage =
        await _imagePicker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedImage != null) {
        setState(() {
          _selectedImage = File(pickedImage.path);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("แบบฟอร์มบันทึกข้อมูล"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: _pickImageFromGallery,
                  child: Container(
                    padding: EdgeInsets.all(0.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 3, color: Colors.blue),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: _selectedImage != null
                          ? Image.file(
                              _selectedImage!,
                              width: 200,
                              height: 200,
                              fit: BoxFit.cover,
                            )
                          : Container(
                              width: 200,
                              height: 200,
                              margin: EdgeInsets.all(10),
                              child: Center(
                                child: Text(
                                  "Choose Image",
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ),
                            ),
                    ),
                  ),
                ),
                TextFormField(
                  cursorColor: Colors.white,
                  controller: nameController,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.white),
                    labelText: "listName",
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
                TextFormField(
                  cursorColor: Colors.white,
                  controller: auNameController,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.white),
                    labelText: "listNameAth",
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue,
                  ),
                  child: TextButton(
                    onPressed: _showDataPicker,
                    child: Text(
                      'Choose Date: ${DateFormat('yyyy-MM-dd').format(_dataTime)}',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.blue),
                            ),
                            child: Text(
                              'Selected Option: $selectedType',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                          DropdownButton<String>(
                            dropdownColor: Colors.blue,
                            isExpanded: true,
                            value: selectedType,
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedType = newValue!;
                              });
                            },
                            hint: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                              ),
                              child: Text(
                                "Select Type",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            items: <String>['Drama', 'Action', 'Love']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: TextStyle(color: Colors.white),
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.blue)),
                  child: TextFormField(
                    controller: detailController,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      labelText: "Description",
                      labelStyle: TextStyle(
                        color: Colors.white,
                      ),
                      alignLabelWithHint: true,
                      contentPadding: EdgeInsets.symmetric(vertical: 20.0),
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
                SizedBox(height: 20),
                TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.green),
                    ),
                    onPressed: () {
                      var name = nameController.text;
                      var auName = auNameController.text;
                      var date = DateFormat('yyyy-MM-dd').format(_dataTime);
                      var type = selectedType;
                      var detail = detailController.text;

                      Transactions statement = Transactions(
                        name: name,
                        auName: auName,
                        date: date,
                        type: type,
                        detail: detail,
                        image: _selectedImage ?? File('index_image.jpg'),
                      );

                      var provider = Provider.of<TransactionProvider>(context,
                          listen: false);
                      provider.addTransaction(statement);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          fullscreenDialog: true,
                          builder: (context) {
                            return MyHomePage(title: "home_screen.dart");
                          },
                        ),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Save Data",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
