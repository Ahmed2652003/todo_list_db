import 'package:flutter/material.dart';
import '../constants/styles.dart';

class CustomElvatedButton extends StatelessWidget {
  const CustomElvatedButton({
    super.key,
    required this.onPressed,
    this.icon,
    required this.text,
    required this.textIcon,
  });
  final void Function()? onPressed;
  final IconData? icon;
  final String text;
  final String? textIcon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        minimumSize: const Size(double.infinity, 60),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            textIcon!,
            style: Styles.textStyle30,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            text,
            style: Styles.textStyle25,
          ),
        ],
      ),
    );
  }
}