import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tailor/screens/customer_details/add_calf.dart';
import 'package:tailor/screens/customer_details/customer_personal_details.dart';
import 'package:tailor/utils/widgets.dart';

class AddInseam extends StatefulWidget {
  const AddInseam({Key? key}) : super(key: key);

  @override
  State<AddInseam> createState() => _AddInseamState();
}

class _AddInseamState extends State<AddInseam> {
  String? value;
  @override
  Widget build(BuildContext context) {
    return CommonWidgets.addCustomerDetails(
        context: context,
        list: CommonWidgets.generateList(18, 23),
        stringAssetImg: 'assets/images/inseam-removebg-preview.png',
        name: 'Inseam',
        onPressed: (String? value) {
          setState(() {
            this.value = value;
          });
        },
        nextOnPressed: () {
          if (value == null || value!.isEmpty) {
            Fluttertoast.showToast(msg: 'Select Value');
          } else {
            CustomerPersonalDetails.modelAddCustomer.inseam = value!;

            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AddCalf()));
          }
        },
        value: value);
  }
}
