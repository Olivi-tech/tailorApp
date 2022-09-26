import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tailor/utils/widgets.dart';

class AddArmLength extends StatefulWidget {
  const AddArmLength({Key? key}) : super(key: key);

  @override
  State<AddArmLength> createState() => _AddArmLengthState();
}

class _AddArmLengthState extends State<AddArmLength> {
  String? value;
  @override
  Widget build(BuildContext context) {
    return CommonWidgets.addCustomerDetails(
      context: context,
      list: CommonWidgets.generateList(12, 20),
      stringAssetImg: 'assets/images/arm_length-removebg-preview.png',
      name: 'Arm Length',
      value: value,
      onPressed: (String? value) {
        setState(() {
          this.value = value;
        });
      },
      nextOnPressed: () {
        if (value == null || value!.isEmpty) {
          Fluttertoast.showToast(msg: 'Select Value');
        } else {
          //   Navigator.push(context,
          //       MaterialPageRoute(builder: (context) => const AddArmLength()));
        }
      },
    );
  }
}
