import 'package:flutter/material.dart';

class NumberPage extends StatefulWidget {
  const NumberPage({super.key});

  @override
  State<NumberPage> createState() => _NumberPageState();
}

class _NumberPageState extends State<NumberPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('个人中心'),
      ),
    );
  }
}
