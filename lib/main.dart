import 'package:covid/dataSource.dart';
import 'package:flutter/material.dart';
import 'HomePage.dart';

void main() {
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(
        ),
        theme: ThemeData(
          primaryColor: primaryBlack,
        ),
      )
  );
}
