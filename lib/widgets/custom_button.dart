import 'package:flutter/material.dart';


class CustomButton extends StatelessWidget {
  const CustomButton({Key? key,
    required this.onPressed,
    required this.content,


  }) : super(key: key);
  final VoidCallback? onPressed;
  final String content;



  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed:
        onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.orange,
        side:  const BorderSide(color: Colors.orange),
    shape: RoundedRectangleBorder(
    borderRadius : BorderRadius.circular(32)),
    //  backgroundColor: widget.backgroundColor
    ),
    child:  Center(
    child: Text(
    content,
    style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w500,
        fontSize: 20
    ),
    )
    ));
  }
}
