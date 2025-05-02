import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final String label;
  final Function()? onTap;
  final Gradient? gradient;
  final Color? color;
  const CommonButton({super.key, required this.label, this.onTap, this.gradient, this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(

        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 70),
        decoration: BoxDecoration(
          color: Colors.white,
          gradient: gradient,
          borderRadius: BorderRadius.circular(25)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text(label, style:  TextStyle(fontSize:  15, color: color ?? Colors.black),)
        ],),
      ),
    );
  }
}
