import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tailor/screens/cutomer_details/add_chest.dart';
import 'package:tailor/screens/cutomer_details/add_neck.dart';
import 'package:tailor/utils/widgets.dart';

class AddShoulder extends StatefulWidget {
  const AddShoulder({Key? key}) : super(key: key);

  @override
  State<AddShoulder> createState() => _AddShoulderState();
}

class _AddShoulderState extends State<AddShoulder> {
  List<String> list = [
    '13"',
    '13 1/4"',
    '13 1/2"',
    '13 3/4"',
    '14"',
    '14 1/4"',
    '14 1/2"',
    '14 3/4"',
    '15"',
    '15 1/4"',
    '15 1/2"',
    '15 3/4"',
    '16"',
    '16 1/4"',
    '16 1/2"',
    '16 3/4"',
    '17"',
    '17 1/4"',
    '17 1/2"',
    '17 3/4"',
    '18"',
    '18 1/4"',
    '18 1/2"',
    '18 3/4"',
    '19"',
    '19 1/4"',
    '19 1/2"',
    '19 3/4"',
    '20 1/4"',
    '20 1/2"',
    '20 3/4"',
    '21"',
    '21 1/4"',
    '21 1/2"',
    '21 3/4"',
  ];
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
                MaterialPageRoute(builder: (context) => const AddChest()));
          }
        });
  }
}
