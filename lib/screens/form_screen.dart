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
      // backgroundColor: Colors.black,
      
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 12,top: 50,right: 12),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: _pickImageFromGallery,
                  child: Container(
                    padding: EdgeInsets.all(0.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 0.1,
                              spreadRadius: 1,
                              offset: Offset(0, 1),
                            ),
                          ],
                      borderRadius: BorderRadius.circular(10),
                      // border: Border.all(width: 3, color: Colors.black),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: _selectedImage != null
                          ? Image.file(
                              _selectedImage!,
                              width: double.infinity,
                              height: 250,
                              fit: BoxFit.cover,
                            )
                          : Container(
                              width: double.infinity,
                              height: 250,
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
                 Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      ),
                  child: TextFormField(
                    controller: detailController,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      labelText: "Description",
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      alignLabelWithHint: true,
                      contentPadding: EdgeInsets.symmetric(vertical: 20.0),
                      hintText: "Enter your description here",
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                  ),
                ),
                TextFormField(
                  cursorColor: Colors.black,
                  controller: nameController,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.black),
                    labelText: "Name",
                    labelStyle: TextStyle(color: Colors.black),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
                TextFormField(
                  cursorColor: Colors.black,
                  controller: auNameController,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.black),
                    labelText: "Athor Name",
                    labelStyle: TextStyle(color: Colors.black),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
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
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.blue),
                            ),
                            child: Text(
                              'Selected Option: $selectedType',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                            ),
                          ),
                          DropdownButton<String>(
                            dropdownColor: Colors.white,
                            isExpanded: true,
                            value: selectedType,
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedType = newValue!;
                              });
                            },
                            hint: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                              ),
                              child: Text(
                                "Select Type",
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            items: <String>['Drama', 'Action', 'Love']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: TextStyle(color: Colors.black),
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
                        boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 0.1,
                              spreadRadius: 1,
                              offset: Offset(0, 1),
                            ),
                          ],
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
