import 'package:flutter/material.dart';
import 'package:tailor/add_item.dart';

import 'model_add_customer.dart';

class CustomerDetailPage extends StatelessWidget {
  Map<String, dynamic>? map = {};
  // final String fullName;
  // final String phoneNumber;
  // final String address;
  // final String collar;
  // final String waist;
  // final String armLength;
  // final String biceps;
  // final String wrist;
  // final String length;
  // final String thigh;
  // final String chest;
  // final String inseam;
  // final String shoulder;
  // final String calf;
  // final String title;
  CustomerDetailPage({Key? key, required this.map}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print('//////////////////////////$fullName//////////////////////////');
    // print('//////////////////////////$phoneNumber//////////////////////////');
    // print('//////////////////////////$address//////////////////////////');
    // print('//////////////////////////$chest//////////////////////////');
    // print('//////////////////////////$collar//////////////////////////');
    // print('//////////////////////////$shoulder//////////////////////////');
    // print('//////////////////////////$waist//////////////////////////);
    // print('//////////////////////////$armLength//////////////////////////');
    // print('//////////////////////////$biceps//////////////////////////');
    // print('//////////////////////////$wrist//////////////////////////');
    // print('//////////////////////////$length//////////////////////////');
    // print('//////////////////////////$thigh//////////////////////////');
    // print('//////////////////////////$inseam//////////////////////////');
    // print('//////////////////////////$calf//////////////////////////');
    // print('//////////////////////////$title//////////////////////////');
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text('Customer Details'),
        centerTitle: true,
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                splashFactory: InkSplash.splashFactory,
                fixedSize: const Size(60, 20),
                backgroundColor: Colors.teal,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50))),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AddItem(
                            map: map,
                            editing: true,
                          )));
            },
            child: const Text(
              'Edit',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              text(name: 'Full Name : ${map![ModelAddCustomer.keyFullName]}'),
              text(
                  name:
                      'Phone Number : ${map![ModelAddCustomer.keyPhoneNumber]}'),
              text(name: 'Address :${map![ModelAddCustomer.keyAddress]}'),
              text(name: 'Collar : ${map![ModelAddCustomer.keyCollar]}'),
              text(name: 'Shoulder : ${map![ModelAddCustomer.keyShoulder]}'),
              text(name: 'Chest : ${map![ModelAddCustomer.keyChest]}'),
              text(name: 'Waist : ${map![ModelAddCustomer.keyWaist]}'),
              text(name: 'Arm Length : ${map![ModelAddCustomer.keyArmLength]}'),
              text(name: 'Biceps : ${map![ModelAddCustomer.keyBiceps]}'),
              text(name: 'Wrist : ${map![ModelAddCustomer.keyWrist]}'),
              text(name: 'Length : ${map![ModelAddCustomer.keyLength]}'),
              text(name: 'Inseam : ${map![ModelAddCustomer.keyInseam]}'),
              text(name: 'Calf : ${map![ModelAddCustomer.keyCalf]}'),
            ],
          ),
        ),
      ),
    );
  }

  Widget text({required name}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          name,
          style: textStyle(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: Divider(
            color: Colors.green.shade200,
            height: 30,
            thickness: 1,
          ),
        )
      ],
    );
  }

  TextStyle textStyle() {
    return const TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 18,
    );
  }
}
