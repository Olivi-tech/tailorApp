import 'package:flutter/material.dart';

class AddItemPractice extends StatelessWidget {
  const AddItemPractice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          color: Colors.green,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_sharp),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(children: const [
            Text(
              'Add Your Customer Info',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ]),
        ),
      ),
    );
  }
}
