

// import 'package:flutter/material.dart';
import 'dart:io';

class Transactions{
  String name;
  String auName;
  String date;
  String type;
  double amount;
  File image;
  Transactions(
    {
      required this.name,
      required this.auName,
      required this.date,
      required this.type,
      required this.amount,
      required this.image,
      
     
    }
  );
}