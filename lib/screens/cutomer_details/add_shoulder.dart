import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tailor/screens/cutomer_details/add_neck.dart';
import 'package:tailor/utils/widgets.dart';

class AddShoulder extends StatefulWidget {
  const AddShoulder({Key? key}) : super(key: key);

  @override
  State<AddShoulder> createState() => _AddShoulderState();
}

class _AddShoulderState extends State<AddShoulder> {
  List<String> list = ['1', '2'];
  String? value;
  @override
  Widget build(BuildContext context) {
    return CommonWidgets.addCustomerDetails(
        context: context,
        list: list,
        name: 'Shoulder',
        value: value,
        onPressed: (String? value) {
          setState(() {
            this.value = value;
          });
        },
        stringAssetImg: 'assets/images/shoulder-removebg-preview.png',
        nextOnPressed: () {
          if (value == null || value!.isEmpty) {
            Fluttertoast.showToast(msg: 'Select Value');
          } else {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AddNeck()));
          }
        });
  }
}
