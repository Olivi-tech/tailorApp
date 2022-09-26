import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tailor/screens/cutomer_details/add_waist.dart';
import 'package:tailor/utils/widgets.dart';

class AddChest extends StatefulWidget {
  const AddChest({Key? key}) : super(key: key);

  @override
  State<AddChest> createState() => _AddChestState();
}

class _AddChestState extends State<AddChest> {
  String? value;
  @override
  Widget build(BuildContext context) {
    return CommonWidgets.addCustomerDetails(
        context: context,
        list: CommonWidgets.generateList(31, 28),
        stringAssetImg: 'assets/images/chest-removebg-preview.png',
        name: 'Chest',
        onPressed: (String? value) {
          setState(() {
            this.value = value;
          });
        },
        nextOnPressed: () {
          if (value == null || value!.isEmpty) {
            Fluttertoast.showToast(msg: 'Select Value');
          } else {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AddWaist()));
          }
        },
        value: value);
  }
}