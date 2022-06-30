import 'package:flutter/material.dart';
import '../style/my_style.dart';

class CustomButton extends StatelessWidget {
  final Function() onTap;
  final String text;
  const CustomButton({
    Key? key,
    required this.onTap, required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.6,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          primary: Style.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 15.0,
        ),
        child:  Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            text,
            style:const TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
