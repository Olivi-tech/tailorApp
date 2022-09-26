import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tailor/screens/cutomer_details/add_arm_length.dart';
import 'package:tailor/utils/widgets.dart';

class AddWaist extends StatefulWidget {
  const AddWaist({Key? key}) : super(key: key);

  @override
  State<AddWaist> createState() => _AddWaistState();
}

class _AddWaistState extends State<AddWaist> {
  String? value;
  @override
  Widget build(BuildContext context) {
    return CommonWidgets.addCustomerDetails(
        context: context,
        list: CommonWidgets.generateList(34, 25),
        name: 'Waist',
        value: value,
        onPressed: (String? value) {
          setState(() {
            this.value = value;
          });
        },
        stringAssetImg: 'assets/images/waist__1_-removebg-preview.png',
        nextOnPressed: () {
          if (value == null || value!.isEmpty) {
            Fluttertoast.showToast(msg: 'Select Value');
          } else {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AddArmLength()));
          }
        });
  }
}
