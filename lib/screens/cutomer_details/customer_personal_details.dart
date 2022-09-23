import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tailor/screens/model_add_customer.dart';
import 'package:tailor/utils/widgets.dart';

import '../dashboard.dart';

class CustomerPersonalDetails extends StatefulWidget {
  const CustomerPersonalDetails({Key? key}) : super(key: key);
  static bool? editing = false;
  static Map<String, dynamic>? map = {};

  @override
  State<CustomerPersonalDetails> createState() =>
      _CustomerPersonalDetailsState();
}

class _CustomerPersonalDetailsState extends State<CustomerPersonalDetails> {
  late final TextEditingController _firstNameController;
  late final TextEditingController _lastNameController;
  late final TextEditingController _phoneController;
  late final TextEditingController _addressController;

  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController(
        text: DashBoard.editing!
            ? DashBoard.map![ModelAddCustomer.keyFirstName]
            : '');
    _lastNameController = TextEditingController(
        text: DashBoard.editing!
            ? DashBoard.map![ModelAddCustomer.keyLastName]
            : '');

    _phoneController = TextEditingController(
        text: DashBoard.editing!
            ? DashBoard.map![ModelAddCustomer.keyPhoneNumber]
            : '');
    _addressController = TextEditingController(
        text: DashBoard.editing!
            ? DashBoard.map![ModelAddCustomer.keyAddress]
            : '');
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height - 70,
        // padding: EdgeInsets.only(right: 10, left: 0.0),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            AppBar(
              elevation: 0.0,
              backgroundColor: Colors.transparent,
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_sharp,
                    color: Colors.green,
                  )),
            ),
            const SizedBox(height: 16),
            const Text(
              'Add Customer Details',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            CommonWidgets.customTextFormField(
                hintText: 'First Name',
                controller: _firstNameController,
                textInputType: TextInputType.name,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp('[a-zA-Z 0-9]'))
                ],
                prefixIcon: const Icon(Icons.person_add_alt_1_rounded)),
            CommonWidgets.customTextFormField(
                hintText: 'Last Name',
                controller: _lastNameController,
                textInputType: TextInputType.name,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp('[a-zA-Z 0-9]'))
                ],
                prefixIcon: const Icon(Icons.person_add_alt_1_rounded)),
            CommonWidgets.customTextFormField(
                hintText: 'Phone Number',
                controller: _phoneController,
                textInputType: TextInputType.phone,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                prefixIcon: const Icon(Icons.phone_android)),
            CommonWidgets.customTextFormField(
                hintText: 'Address',
                controller: _addressController,
                textInputType: TextInputType.streetAddress,
                prefixIcon: const Icon(Icons.place)),
            const SizedBox(height: 16),
            CommonWidgets.customBtn(
              name: 'Save & Add Measurements',
              onPressed: () {
                if (_firstNameController.text.isEmpty ||
                    _lastNameController.text.isEmpty ||
                    _phoneController.text.isEmpty) {
                  Fluttertoast.showToast(
                      msg: _firstNameController.text.isEmpty ||
                              _lastNameController.text.isEmpty
                          ? 'name can\'t be empty'
                          : 'phone number can\'t be empty');
                } else if (_addressController.text.isEmpty) {
                  Fluttertoast.showToast(msg: 'Address Can\'t be empty');
                } else {
                  print(
                      '/////////////////////Save Data to firebase/////////////////');
                }
              },
              width: width * 0.9,
              height: height * 0.06,
            ),
            // const SizedBox(height: 10),
            // CommonWidgets.customBtn(
            //     name: 'Add Measurements',
            //     onPressed: () {},
            //     width: width * 0.9,
            //     height: height * 0.06),
            const SizedBox(height: 10),
            CommonWidgets.customBtn(
                name: 'Cancel',
                onPressed: () {
                  Navigator.pop(context);
                },
                btnBackGroundColor: Colors.brown,
                width: width * 0.9,
                height: height * 0.06),
          ]),
        ),
      ),
    );
  }
}
