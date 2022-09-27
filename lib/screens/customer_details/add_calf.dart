import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tailor/screens/customer_details/customer_personal_details.dart';
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
    String collection = FirebaseAuth.instance.currentUser!.uid;
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
        nextOnPressed: () async {
          if (value == null || value!.isEmpty) {
            Fluttertoast.showToast(msg: 'Select Value');
          } else {
            CustomerPersonalDetails.modelAddCustomer.calf = value!;
            await FirebaseFirestore.instance
                .collection(collection)
                .doc(CustomerPersonalDetails.modelAddCustomer.phoneNumber)
                .set(CustomerPersonalDetails.modelAddCustomer.toMap())
                .whenComplete(() {
              AwesomeDialog(
                context: context,
                animType: AnimType.SCALE,
                headerAnimationLoop: false,
                dialogType: DialogType.SUCCES,
                showCloseIcon: true,
                //  autoDismiss: true,
                autoHide: Duration(seconds: 3),
                title: 'Succes',
                desc:
                    'Added ${CustomerPersonalDetails.modelAddCustomer.firstName}',
                btnOkOnPress: () {
                  debugPrint('OnClcik');
                },
                btnOkIcon: Icons.check_circle,
                onDissmissCallback: (type) {
                  debugPrint('Dialog Dissmiss from callback $type');
                },
              ).show();
            }).onError((error, stackTrace) {
              print('////////////////////////Error/////////////////////////');
            });
            print('${CustomerPersonalDetails.modelAddCustomer}');

            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => const AddBiceps()));
          }
        },
        value: value);
  }
}
