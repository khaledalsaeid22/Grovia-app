import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.child, this.onPressed});
  final Widget child;
  final Function? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        fixedSize: Size(MediaQuery.of(context).size.width, 50),
      ),
      onPressed: () {},
      child: child,
    );
  }
}
