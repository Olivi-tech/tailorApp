import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tailor/utils/widgets.dart';

class AddCollar extends StatelessWidget {
  const AddCollar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.amberAccent.withOpacity(0.5),
      width: width,
      height: height,
      child: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: [
          const Image(
              image: AssetImage('assets/images/neck-removebg-preview.png'),
              fit: BoxFit.cover),
          Padding(
              padding: EdgeInsets.only(top: height * 0.8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                      width: width * 0.85,
                      height: height * 0.075,
                      child: CommonWidgets.customTextFormField(
                          hintText: 'Collar',
                          onTap: () {
                            Fluttertoast.showToast(msg: 'select');
                          },
                          suffixIcon: const Icon(Icons.arrow_drop_down_outlined,
                              color: Colors.black),
                          hintStyle: const TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center)),
                  CommonWidgets.customBtn(
                      width: width * 0.83,
                      height: height * 0.066,
                      btnTextColor: Colors.black,
                      btnBackGroundColor: Colors.white,
                      name: 'Next',
                      fontSize: 15,
                      onPressed: () {}),
                ],
              ))
        ],
      ),
    );
  }
}
