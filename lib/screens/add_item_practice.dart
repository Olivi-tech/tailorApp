import 'package:flutter/material.dart';
import '../utils/widgets.dart';

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
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
            child: Column(children: [
              const Text(
                'Add Customer Details',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Card(
                elevation: 1,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                color: Colors.white,
                child: TextFormField(
                    cursorColor: Colors.black,
                    decoration: const InputDecoration(
                      constraints: BoxConstraints(maxHeight: 50, minHeight: 50),
                      hintStyle: TextStyle(fontSize: 18, color: Colors.black),
                      hintText: 'First Name',
                      prefixIcon: Icon(Icons.person_add_alt_1),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 20, top: 15),
                    ),
                    validator: (value) {
                      return CommonWidgets.customValidator('$value');
                    }),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
