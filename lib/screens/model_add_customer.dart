// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:tailor/utils/widgets.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:awesome_dialog/awesome_dialog.dart';
//
// class EditCustomerInfo extends StatefulWidget {
//   String fullName;
//   String phoneNumber;
//   String address;
//   String collar;
//   String waist;
//   String armLength;
//   String biceps;
//   String wrist;
//   String length;
//   String thigh;
//   String chest;
//   String inseam;
//   String shoulder;
//   String calf;
//   static String title = 'Edit Customer Info';
//   EditCustomerInfo({
//     Key? key,
//      this.fullName,
//      this.phoneNumber,
//      this.address,
//      this.shoulder,
//      this.collar,
//      this.chest,
//      this.waist,
//      this.armLength,
//      this.biceps,
//      this.wrist,
//      this.length,
//      this.thigh,
//      this.inseam,
//      this.calf,
//   }) : super(key: key);
//
//   @override
//   State<EditCustomerInfo> createState() => _EditCustomerInfoState();
// }
//
// class _EditCustomerInfoState extends State<EditCustomerInfo> {
//   final GlobalKey<FormState> _formKeyCustomer = GlobalKey<FormState>();
//   final GlobalKey<FormState> _formKeyMeasurement = GlobalKey<FormState>();
//
//   ///adding customer info/////
//   late final TextEditingController _nameController;
//   late final TextEditingController _phoneController;
//   late final TextEditingController _addressController;
//
//   ///adding customer's Measurements /////
//   late final TextEditingController _collarController;
//   late final TextEditingController _shoulderController;
//   late final TextEditingController _chestController;
//   late final TextEditingController _waistController;
//   late final TextEditingController _armLengthController;
//   late final TextEditingController _bicepsController;
//   late final TextEditingController _wristController;
//   late final TextEditingController _lengthController;
//   late final TextEditingController _thighController;
//   late final TextEditingController _inseamController;
//   late final TextEditingController _calfController;
//
//   @override
//   void initState() {
//     /// customer /////
//     _nameController = TextEditingController();
//     _phoneController = TextEditingController();
//     _addressController = TextEditingController();
//
//     ///customer's Measurements /////
//     _collarController = TextEditingController();
//     _shoulderController = TextEditingController();
//     _chestController = TextEditingController();
//     _waistController = TextEditingController();
//     _armLengthController = TextEditingController();
//     _bicepsController = TextEditingController();
//     _wristController = TextEditingController();
//     _lengthController = TextEditingController();
//     _thighController = TextEditingController();
//     _inseamController = TextEditingController();
//     _calfController = TextEditingController();
//
//     _nameController.addListener(() {
//       setState(() {});
//     });
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     ///customer /////
//     _nameController.dispose();
//     _phoneController.dispose();
//     _addressController.dispose();
//
//     ///customer's Measurements /////
//     _collarController.dispose();
//     _shoulderController.dispose();
//     _chestController.dispose();
//     _waistController.dispose();
//     _armLengthController.dispose();
//     _bicepsController.dispose();
//     _wristController.dispose();
//     _lengthController.dispose();
//     _thighController.dispose();
//     _inseamController.dispose();
//     _calfController.dispose();
//
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     User? currentUser = FirebaseAuth.instance.currentUser;
//     final customerCollection =
//         FirebaseFirestore.instance.collection(currentUser!.uid);
//     Future<void> addCustomer() async {
//       Map<String, dynamic> customerMap = {
//         'fullName': _nameController.text,
//         'phoneNumber': _phoneController.text,
//         'address': _addressController.text,
//         'collar': _collarController.text,
//         'shoulder': _shoulderController.text,
//         'chest': _chestController.text,
//         'waist': _waistController.text,
//         'armLength': _armLengthController.text,
//         'biceps': _bicepsController.text,
//         'wrist': _wristController.text,
//         'length': _lengthController.text,
//         'thigh': _thighController.text,
//         'inseam': _inseamController.text,
//         'calf': _calfController.text,
//       };
//       var docPath = _phoneController.text;
//       return await customerCollection.doc(docPath.toString()).set(customerMap);
//     }
//
//     // double width = MediaQuery.of(context).size.width;
//     // double height = MediaQuery.of(context).size.height;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(''),
//         elevation: 0.0,
//         actions: [
//           Padding(
//             padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
//             child: ElevatedButton(
//               onPressed: () async {
//                 if (_formKeyCustomer.currentState!.validate() &&
//                     _formKeyMeasurement.currentState!.validate()) {
//                   await addCustomer().whenComplete(() {
//                     AwesomeDialog(
//                       context: context,
//                       animType: AnimType.SCALE,
//                       headerAnimationLoop: false,
//                       dialogType: DialogType.SUCCES,
//                       showCloseIcon: true,
//                       title: 'Success',
//                       desc: 'Added ${_nameController.text}',
//                       btnOkOnPress: () {
//                         debugPrint('OnClick');
//                       },
//                       btnOkIcon: Icons.check_circle,
//                       onDissmissCallback: (type) {
//                         debugPrint('Dialog Dismiss from callback $type');
//                       },
//                     ).show();
//                   }).onError((error, stackTrace) {
//                     AwesomeDialog(
//                       context: context,
//                       dialogType: DialogType.ERROR,
//                       animType: AnimType.RIGHSLIDE,
//                       headerAnimationLoop: true,
//                       title: 'Error',
//                       desc: error.toString(),
//                       btnOkOnPress: () {},
//                       btnOkIcon: Icons.cancel,
//                       btnOkColor: Colors.red,
//                     ).show();
//                   });
//                 }
//               },
//               style: ElevatedButton.styleFrom(
//                   textStyle: const TextStyle(
//                       fontWeight: FontWeight.bold, color: Colors.black),
//                   // fixedSize: Size(80, 5),
//                   minimumSize: const Size(80, 10),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   )),
//               child: const Text('Save Data'),
//             ),
//           )
//         ],
//       ),
//       backgroundColor: Colors.white,
//       // resizeToAvoidBottomInset: false,
//       body: Padding(
//         padding:
//             const EdgeInsets.only(top: 8.0, left: 20, right: 20, bottom: 15),
//         child: SingleChildScrollView(
//           reverse: true,
//           child: Column(
//             children: [
//               Form(
//                 key: _formKeyCustomer,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text(
//                       'Customer Info :',
//                       style:
//                           TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     CommonWidgets.customTextFormField(
//                         hintText: 'Full Name',
//                         initialValue: widget.fullName,
//                         controller: _nameController,
//                         prefixIcon: const Icon(Icons.person_add_alt_outlined),
//                         validator: (value) {
//                           return CommonWidgets.customValidator('$value');
//                         }),
//                     const SizedBox(height: 10.0),
//                     CommonWidgets.customTextFormField(
//                         controller: _phoneController,
//                         keyboardType: TextInputType.phone,
//                         hintText: 'Phone Number',
//                         prefixIcon: const Icon(Icons.phone_enabled_outlined),
//                         validator: (value) {
//                           return CommonWidgets.customValidator('$value');
//                         }),
//                     const SizedBox(height: 10.0),
//                     CommonWidgets.customTextFormField(
//                         keyboardType: TextInputType.streetAddress,
//                         hintText: 'Address',
//                         controller: _addressController,
//                         prefixIcon: const Icon(Icons.maps_home_work_outlined),
//                         validator: (value) {
//                           return CommonWidgets.customValidator('$value');
//                         }),
//                     const SizedBox(height: 5.0),
//                     const Text(
//                       'Dress Measurements:',
//                       style:
//                           TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                     ),
//                     const SizedBox(height: 10.0),
//                   ],
//                 ),
//               ),
//               Form(
//                   key: _formKeyMeasurement,
//                   child: Column(
//                     children: [
//                       CommonWidgets.customMeasurementTile(
//                           stringAssetImage: 'assets/images/neck.jpg',
//                           title: 'Collar',
//                           controller: _collarController,
//                           validator: (value) {
//                             return CommonWidgets
//                                 .customValidatorForMeasurementTile(value);
//                           }),
//                       const SizedBox(height: 10),
//                       CommonWidgets.customMeasurementTile(
//                           stringAssetImage: 'assets/images/shoulder.jpg',
//                           title: 'Shoulder',
//                           controller: _shoulderController,
//                           validator: (value) {
//                             return CommonWidgets
//                                 .customValidatorForMeasurementTile(value);
//                           }),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       CommonWidgets.customMeasurementTile(
//                           stringAssetImage: 'assets/images/chest.jpg',
//                           title: 'Chest',
//                           controller: _chestController,
//                           validator: (value) {
//                             return CommonWidgets
//                                 .customValidatorForMeasurementTile(value);
//                           }),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       CommonWidgets.customMeasurementTile(
//                           stringAssetImage: 'assets/images/waist.jpg',
//                           controller: _waistController,
//                           title: 'Waist',
//                           validator: (value) {
//                             return CommonWidgets
//                                 .customValidatorForMeasurementTile(value);
//                           }),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       CommonWidgets.customMeasurementTile(
//                         stringAssetImage: 'assets/images/arm_length.jpg',
//                         title: 'Arm Length',
//                         controller: _armLengthController,
//                         validator: (value) {
//                           return CommonWidgets
//                               .customValidatorForMeasurementTile(value);
//                         },
//                       ),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       CommonWidgets.customMeasurementTile(
//                           stringAssetImage: 'assets/images/biceps.jpg',
//                           title: 'Biceps',
//                           controller: _bicepsController,
//                           validator: (value) {
//                             return CommonWidgets
//                                 .customValidatorForMeasurementTile(value);
//                           }),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       CommonWidgets.customMeasurementTile(
//                           stringAssetImage: 'assets/images/wrist.jpg',
//                           title: 'Wrist',
//                           controller: _wristController,
//                           validator: (value) {
//                             return CommonWidgets
//                                 .customValidatorForMeasurementTile(value);
//                           }),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       CommonWidgets.customMeasurementTile(
//                           stringAssetImage: 'assets/images/shirt_length.jpg',
//                           title: 'Length',
//                           controller: _lengthController,
//                           validator: (value) {
//                             return CommonWidgets
//                                 .customValidatorForMeasurementTile(value);
//                           }),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       CommonWidgets.customMeasurementTile(
//                           stringAssetImage: 'assets/images/thigh.png',
//                           title: 'Thigh',
//                           controller: _thighController,
//                           validator: (value) {
//                             return CommonWidgets
//                                 .customValidatorForMeasurementTile(value);
//                           }),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       CommonWidgets.customMeasurementTile(
//                           stringAssetImage: 'assets/images/inseam.jpg',
//                           title: 'Inseam',
//                           controller: _inseamController,
//                           validator: (value) {
//                             return CommonWidgets
//                                 .customValidatorForMeasurementTile(value);
//                           }),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       CommonWidgets.customMeasurementTile(
//                           stringAssetImage: 'assets/images/calf.png',
//                           title: 'Calf',
//                           controller: _calfController,
//                           validator: (value) {
//                             return CommonWidgets
//                                 .customValidatorForMeasurementTile(value);
//                           })
//                     ],
//                   ))
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
class ModelAddCustomer {
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? address;
  String? collar;
  String? waist;
  String? armLength;
  String? biceps;
  String? wrist;
  String? length;
  String? thigh;
  String? chest;
  String? inseam;
  String? shoulder;
  String? calf;

  // String toString() {
  //   return 'ModelAddCustomer{fullName: $fullName, phoneNumber: $phoneNumber, address: $address, collar: $collar, waist: $waist, armLength: $armLength, biceps: $biceps, wrist: $wrist, length: $length, thigh: $thigh, chest: $chest, inseam: $inseam, shoulder: $shoulder, calf: $calf}';
  // }

  static String keyFirstName = 'firstName';
  static String keyLastName = 'lastName';
  static String keyPhoneNumber = 'phoneNumber';
  static String keyAddress = 'address';
  static String keyCollar = 'collar';
  static String keyShoulder = 'shoulder';
  static String keyChest = 'chest';
  static String keyWaist = 'waist';
  static String keyArmLength = 'armLength';
  static String keyBiceps = 'biceps';
  static String keyWrist = 'wrist';
  static String keyInseam = 'inseam';
  static String keyThigh = 'thigh';
  static String keyLength = 'length';
  static String keyCalf = 'calf';

  ModelAddCustomer({
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.address,
    this.shoulder,
    this.collar,
    this.chest,
    this.waist,
    this.armLength,
    this.biceps,
    this.wrist,
    this.length,
    this.thigh,
    this.inseam,
    this.calf,
  });

  Map<String, dynamic> toMap() {
    return {
      keyFirstName: firstName,
      keyLastName: lastName,
      keyPhoneNumber: phoneNumber,
      keyAddress: address,
      keyCollar: collar,
      keyChest: chest,
      keyShoulder: shoulder,
      keyWaist: waist,
      keyArmLength: armLength,
      keyBiceps: biceps,
      keyWrist: wrist,
      keyLength: length,
      keyThigh: thigh,
      keyInseam: inseam,
      keyCalf: calf
    };
  }
}
