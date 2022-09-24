import 'package:flutter/material.dart';

class AddCollar extends StatelessWidget {
  const AddCollar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
        width: width,
        height: height,
        color: Colors.transparent,
        child: Column(
          children: [
            Image(
                image: const AssetImage('assets/images/neck.jpg'),
                width: width,
                height: height * 0.6,
                fit: BoxFit.cover),
          ],
        ));
  }
}
