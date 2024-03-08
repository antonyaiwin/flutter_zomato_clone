import 'package:flutter/material.dart';

class ResDummyScreen extends StatelessWidget {
  const ResDummyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(
            10,
            (index) => ExpansionTile(
              initiallyExpanded: true,
              title: Text('$index'),
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  color: Colors.red,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
