import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tailor/screens/customer_details/add_length.dart';
import 'package:tailor/screens/customer_details/customer_personal_details.dart';
import 'package:tailor/utils/widgets.dart';

class AddWrist extends StatefulWidget {
  const AddWrist({Key? key}) : super(key: key);

  @override
  State<AddWrist> createState() => _AddWristState();
}

class _AddWristState extends State<AddWrist> {
  String? value;
  @override
  Widget build(BuildContext context) {
    return CommonWidgets.addCustomerDetails(
        context: context,
        list: CommonWidgets.generateList(5, 5),
        stringAssetImg: 'assets/images/wrist-removebg-preview.png',
        name: 'Wrist',
        onPressed: (String? value) {
          setState(() {
            this.value = value;
          });
        },
        nextOnPressed: () {
          if (value == null || value!.isEmpty) {
            Fluttertoast.showToast(msg: 'Select Value');
          } else {
            CustomerPersonalDetails.modelAddCustomer.wrist = value!;
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AddLength()));
          }
        },
        value: value);
  }
}
