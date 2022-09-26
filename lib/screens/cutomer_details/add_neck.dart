import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tailor/screens/cutomer_details/add_shoulder.dart';
import 'package:tailor/utils/widgets.dart';

class AddNeck extends StatefulWidget {
  const AddNeck({Key? key}) : super(key: key);

  @override
  State<AddNeck> createState() => _AddNeckState();
}

class _AddNeckState extends State<AddNeck> {
  List<String> list = [
    '12 3/4"',
    '13"',
    '13 1/4"',
    '13 1/2"',
    '13 3/4"',
    '14"',
    '14 1/4"',
    '14 1/2"',
    '14 3/4"',
    '15"',
    '15 1/4"',
    '15 1/2"',
    '15 3/4"',
    '16"',
    '16 1/4"',
    '16 1/2"',
    '16 3/4"',
    '17"',
    '17 1/4"',
    '17 1/2"',
    '17 3/4"',
    '18"',
    '18 1/4"',
    '18 1/2"',
    '18 3/4"',
    '19"',
    '19 1/4"',
    '19 1/2"',
    '19 3/4"',
    '20 1/4"',
    '20 1/2"',
    '20 3/4"',
    '21"',
    '21 1/4"',
    '21 1/2"',
    '21 3/4"',
    '22"',
    '22 1/4"',
    '22 1/2"',
    '22 3/4"',
    '23"'
  ];
  String? value;
  @override
  Widget build(BuildContext context) {
    return CommonWidgets.addCustomerDetails(
        context: context,
        list: list,
        name: 'Neck',
        value: value,
        onPressed: (String? value) {
          setState(() {
            this.value = value;
          });
        },
        stringAssetImg: 'assets/images/neck-removebg-preview.png',
        nextOnPressed: () {
          if (value == null || value!.isEmpty) {
            Fluttertoast.showToast(msg: 'Select Value');
          } else {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AddShoulder()));
          }
        });
  }
}

// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:tailor/screens/cutomer_details/add_shoulder.dart';
// import 'package:tailor/utils/widgets.dart';
//
// class AddCollar extends StatefulWidget {
//   const AddCollar({Key? key}) : super(key: key);
//
//   @override
//   State<AddCollar> createState() => _AddCollarState();
// }
//
// class _AddCollarState extends State<AddCollar> {
//   List<String> list = [
//     '12 3/4"',
//     '13"',
//     '13 1/4"',
//     '13 1/2"',
//     '13 3/4"',
//     '14"',
//     '14 1/4"',
//     '14 1/2"',
//     '14 3/4"',
//     '15"',
//     '15 1/4"',
//     '15 1/2"',
//     '15 3/4"',
//     '16"',
//     '16 1/4"',
//     '16 1/2"',
//     '16 3/4"',
//     '17"',
//     '17 1/4"',
//     '17 1/2"',
//     '17 3/4"',
//     '18"',
//     '18 1/4"',
//     '18 1/2"',
//     '18 3/4"',
//     '19"',
//     '19 1/4"',
//     '19 1/2"',
//     '19 3/4"',
//     '20 1/4"',
//     '20 1/2"',
//     '20 3/4"',
//     '21"',
//     '21 1/4"',
//     '21 1/2"',
//     '21 3/4"',
//     '22"',
//     '22 1/4"',
//     '22 1/2"',
//     '22 3/4"',
//     '23"'
//   ];
//   String? value;
//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.of(context).size.height;
//     double width = MediaQuery.of(context).size.width;
//     // print('//////////////////$height//////////////////////////');
//     return Material(
//       child: Container(
//         color: Colors.teal.withOpacity(1),
//         width: width,
//         height: height,
//         child: Stack(
//           alignment: Alignment.center,
//           fit: StackFit.expand,
//           children: [
//             const Image(
//                 image: AssetImage('assets/images/neck-removebg-preview.png'),
//                 fit: BoxFit.cover),
//             Padding(
//                 padding: EdgeInsets.only(top: height * 0.8),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Container(
//                       width: width * 0.5,
//                       padding: const EdgeInsets.symmetric(horizontal: 30),
//                       decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(30)),
//                       height: height <= 700 ? height * 0.075 : height * 0.065,
//                       child: DropdownButtonHideUnderline(
//                         child: DropdownButton(
//                             hint: const Text(
//                               'Neck',
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 16,
//                                   color: Colors.black),
//                             ),
//                             iconSize: 30,
//                             items: list
//                                 .map<DropdownMenuItem<String>>((String value) {
//                               return DropdownMenuItem<String>(
//                                 value: value,
//                                 child: Text(value),
//                               );
//                             }).toList(),
//                             value: value,
//                             isExpanded: true,
//                             onChanged: (String? value) {
//                               setState(() {
//                                 this.value = value;
//                               });
//                             }),
//                       ),
//                     ),
//                     CommonWidgets.customBtn(
//                         width: width * 0.5,
//                         height: height <= 700 ? height * 0.072 : height * 0.05,
//                         btnTextColor: Colors.black,
//                         btnBackGroundColor: Colors.white,
//                         name: 'Next',
//                         fontSize: 15,
//                         onPressed: () {
//                           if (value == null || value!.isEmpty) {
//                             Fluttertoast.showToast(msg: 'Select Value');
//                           } else {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => const AddShoulder()));
//                           }
//                         }),
//                   ],
//                 ))
//           ],
//         ),
//       ),
//     );
//   }
// }
