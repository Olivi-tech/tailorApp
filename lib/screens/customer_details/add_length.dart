import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tailor/screens/customer_details/add_thigh.dart';
import 'package:tailor/screens/customer_details/customer_personal_details.dart';
import 'package:tailor/utils/widgets.dart';

class AddLength extends StatefulWidget {
  const AddLength({Key? key}) : super(key: key);

  @override
  State<AddLength> createState() => _AddLengthState();
}

class _AddLengthState extends State<AddLength> {
  String? value;
  @override
  Widget build(BuildContext context) {
    return CommonWidgets.addCustomerDetails(
        context: context,
        list: CommonWidgets.generateList(11, 20),
        stringAssetImg: 'assets/images/shirt_length-removebg-preview.png',
        name: 'Shirt Length',
        onPressed: (String? value) {
          setState(() {
            this.value = value;
          });
        },
        nextOnPressed: () {
          if (value == null || value!.isEmpty) {
            Fluttertoast.showToast(msg: 'Select Value');
          } else {
            CustomerPersonalDetails.modelAddCustomer.length = value!;
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AddThigh()));
          }
        },
        value: value);
  }
}
