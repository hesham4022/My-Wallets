import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onTap, this.isLaoding = false});
  final void Function()? onTap;
  final bool isLaoding;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 55,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
            child: isLaoding
                ? const CircularProgressIndicator(
                    color: Colors.black,
                  )
                : const Text(
                    "Add",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
      ),
    );
  }
}
