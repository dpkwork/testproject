import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  final String label;
  final String path;
  final Function()? onTap;
  const SocialButton({super.key, required this.label, required this.path, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.blue,
                Colors.lightBlue.withOpacity(0.7),
                Colors.purple.withOpacity(0.8),
                Colors.purple
              ])
        ),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(22)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(path, height: 30, width: 30,),
              const SizedBox(width: 10),
              Text(label, style: const TextStyle(fontSize: 15),)
            ],
          ),
        ),
      ),
    );
  }
}
