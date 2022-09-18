import 'package:flutter/material.dart';

class AddItemPractice extends StatelessWidget {
  const AddItemPractice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white.withAlpha(240),
      appBar: AppBar(
        backgroundColor: Colors.white.withAlpha(220),
        elevation: 0.0,
        leading: IconButton(
          color: Colors.green,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_sharp),
        ),
      ),
      body: Container(
        color: Colors.white.withAlpha(220),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
          child: Column(
            children: [
              Card(
                //  color: Colors.white,
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0)),
                child: TextFormField(
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person_add_alt)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
