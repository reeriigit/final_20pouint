import 'package:flutter/material.dart';
import 'package:flutter_conn_database/model/Transactions.dart';
import 'package:flutter_conn_database/providers/Transaction_provider.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final nameController = TextEditingController();
  final auNameController = TextEditingController();
  String selectedType = 'A'; // เพิ่มตัวแปรสำหรับเก็บค่าที่เลือกจาก Dropdown
  final amountController = TextEditingController();

  
  DateTime _dataTime = DateTime.now();

  void _showDataPicker() {
    showDatePicker(
      context: context,
      initialDate: _dataTime,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    ).then((value) {
      if (value != null) {
        setState(() {
          _dataTime = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("แบบฟอร์มบันทึกข้อมูล"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(labelText: "listName"),
              ),
              TextFormField(
                controller: auNameController,
                decoration: InputDecoration(labelText: "Author's name"),
              ),
              TextButton(
                onPressed: _showDataPicker,
                child: Text(
                  'Choose Date: ${DateFormat('yyyy-MM-dd').format(_dataTime)}',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  DropdownButton<String>(
                    value: selectedType,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedType = newValue!;
                      });
                    },
                    items: <String>['A', 'B', 'C']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Selected Option: $selectedType',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
              TextFormField(
                controller: amountController,
                decoration: InputDecoration(labelText: "Input Amount"),
                keyboardType: TextInputType.number,
              ),
              TextButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.green),
                ),
                onPressed: () {
                  var name = nameController.text;
                  var auName = auNameController.text;
                  var date = _dataTime.toIso8601String();
                  var type = selectedType; // ใช้ค่าที่ถูกเลือกจาก Dropdown
                  var amount = amountController.text;

                  if (double.tryParse(amount) != null) {
                    Transactions statement = Transactions(
                      name: name,
                      auName: auName,
                      date: date,
                      type: type,
                      amount: double.parse(amount),
                    );

                    var provider = Provider.of<TransactionProvider>(context,
                        listen: false);
                    provider.addTransaction(statement);
                    Navigator.pop(context);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("บันทึกข้อมูลสำเร็จ."),
                      ),
                    );
                    Future.delayed(Duration(seconds: 2), () {
                      Navigator.of(context).pop(); // สลับหน้าไปยังหน้าก่อนหน้า
                    });
                  }
                },
                child: Text("เพิ่มข้อมูล"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
