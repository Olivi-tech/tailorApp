import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CommonWidgets {
  // static late String hintText;
  static Widget customBtn({
    required String name,
    double? fontSize = 18.0,
    double? width,
    FontWeight fontWeight = FontWeight.bold,
    // Gradient? btnBackGroundGradientColor = const LinearGradient(colors: [
    //   Colors.deepOrangeAccent,
    //   Colors.yellow,
    //   //Colors.indigo
    // ]),
    Color? btnBackGroundColor = Colors.brown,
    Color? btnTextColor = Colors.green,
    double? height,
    required VoidCallback? onPressed,
  }) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            elevation: MaterialStateProperty.all(5.0),
            backgroundColor: MaterialStateProperty.all(btnBackGroundColor),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0))),
            foregroundColor: MaterialStateProperty.all(btnTextColor)),
        child: Text(name,
            style: TextStyle(fontSize: fontSize, fontWeight: fontWeight)),
      ),
    );
  }

  static Widget customTextFormField({
    required String? hintText,
    String? Function(String?)? validator,
    Icon? prefixIcon,
    TextAlign textAlign = TextAlign.start,
    List<TextInputFormatter>? inputFormatters,
    String? initialValue,
    Widget? suffixWidget,
    TextEditingController? controller,
    Icon? suffixIcon,
    BoxConstraints? boxConstraints =
        const BoxConstraints(maxHeight: 50, minHeight: 50),
    int? maxLength,
    TextInputType? textInputType,
    TextStyle? hintStyle,
    bool obscureText = false,
    void Function()? onTap,
  }) {
    return Card(
      elevation: 1,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          30,
        ),
      ),
      child: TextFormField(
        keyboardType: textInputType,
        initialValue: initialValue,
        textAlign: textAlign,
        onTap: onTap,
        inputFormatters: inputFormatters,
        validator: validator,
        controller: controller,
        maxLength: maxLength,
        obscureText: obscureText,
        decoration: InputDecoration(
          constraints: boxConstraints,
          suffix: suffixWidget,
          hintText: hintText,
          contentPadding: const EdgeInsets.only(left: 20, top: 15),
          prefixIcon: prefixIcon,
          hintStyle: hintStyle,
          suffixIcon: suffixIcon,
          border: InputBorder.none, focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,

          // border: OutlineInputBorder(
          //     borderRadius: BorderRadius.circular(20),
          //     borderSide: const BorderSide(color: Colors.black)),
        ),
      ),
    );
  }

  static String? customValidator(String? value) {
    if (value!.isEmpty || value.length < 6) {
      return 'value must be greater or equal to 6';
    } else if (value.length > 30 && value.length > 6) {
      return 'Value Can\'t be greater than 30 characters';
    }
    return null;
  }

  static String? customValidatorForMeasurementTile(String? value) {
    if (value!.isEmpty || value.length < 2) {
      return 'keep more than 1';
    } else if (value.length > 4) {
      return 'keep less than 5';
    }
    return null;
  }

  static Widget customMeasurementTile(
      {required String stringAssetImage,
      required String title,
      String? initialValue,
      required String? Function(String?)? validator,
      required TextEditingController controller}) {
    return ListTile(
      tileColor: Colors.black26,
      contentPadding: const EdgeInsets.only(left: 0.0, right: 3),
      leading: CircleAvatar(
        backgroundImage: AssetImage(stringAssetImage),
        radius: 27.5,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: const BorderSide(color: Colors.black45),
      ),
      title: Text(
        title,
        // style: TextStyle(color: Colors.redAccent),
      ),
      trailing: SizedBox(
        height: 50,
        width: 130,
        // color: Colors.green,
        child: TextFormField(
          keyboardType: TextInputType.number,
          validator: validator,
          initialValue: initialValue,
          controller: controller,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
              hintText: 'inch...',
              contentPadding: const EdgeInsets.only(
                  left: 7, top: 10, right: 0.0, bottom: 0.0),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(color: Colors.deepPurple))),
        ),
      ),
    );
  }
}
