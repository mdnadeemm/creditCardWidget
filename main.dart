import 'package:flutter/material.dart';
import './credit_card_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Credit Card Example'),
        ),
        body: Center(
          child: CreditCardWidget(),
        ),
      ),
    );
  }
}
