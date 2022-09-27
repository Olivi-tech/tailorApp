import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tailor/screens/cutomer_details/customer_personal_details.dart';
import 'package:tailor/utils/widgets.dart';

class AddCalf extends StatefulWidget {
  const AddCalf({Key? key}) : super(key: key);

  @override
  State<AddCalf> createState() => _AddCalfState();
}

class _AddCalfState extends State<AddCalf> {
  String? value;
  @override
  Widget build(BuildContext context) {
    var user = FirebaseAuth.instance.currentUser!.uid;
    print(user.runtimeType);
    return CommonWidgets.addCustomerDetails(
        context: context,
        list: CommonWidgets.generateList(10, 11),
        stringAssetImg: 'assets/images/calf-removebg-preview.png',
        name: 'Add Calf',
        onPressed: (String? value) {
          setState(() {
            this.value = value;
          });
        },
        nextOnPressed: () {
          if (value == null || value!.isEmpty) {
            Fluttertoast.showToast(msg: 'Select Value');
          } else {
            CustomerPersonalDetails.modelAddCustomer.calf = value!;

            //    print('${CustomerPersonalDetails.modelAddCustomer}');

            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => const AddBiceps()));
          }
        },
        value: value);
  }
}
