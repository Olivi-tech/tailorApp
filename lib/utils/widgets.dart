import 'package:flutter/material.dart';

class CommonWidgets {
  // static late String hintText;
  static Widget customBtn({
    required String name,
    double? width,
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
            backgroundColor: MaterialStateProperty.all(Colors.brown),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0))),
            foregroundColor: MaterialStateProperty.all(Colors.green)),
        child: Text(name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
      ),
    );
  }

  static Widget customTextFormField(
      {required String? hintText,
      String? Function(String?)? validator,
      Icon? prefixIcon,
      String? initialValue,
      TextEditingController? controller,
      Icon? suffixIcon,
      TextInputType? keyboardType,
      bool obscureText = false}) {
    return TextFormField(
      keyboardType: keyboardType,
      initialValue: initialValue,
      validator: validator,
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        constraints: const BoxConstraints(maxHeight: 60),
        label: Text(hintText!),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.black)),
      ),
    );
  }

  static String? customValidator(String? value) {
    if (value!.isEmpty || value.length < 6) {
      return 'value must be greater or equal to 6';
    } else if (value.length > 16 && value.length > 6) {
      return 'Value Can\'t be greater than 16 characters';
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
