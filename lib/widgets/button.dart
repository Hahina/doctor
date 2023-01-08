import 'package:flutter/material.dart';


class NegativeButton extends StatelessWidget {
  const NegativeButton({Key? key, required this.onPressed, required this.text}) : super(key: key);
  final void Function() onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: OutlinedButton(
        onPressed: onPressed,
          child: Text (text),
      ),
    );
  }
}


class PositivButton extends StatelessWidget {
  const PositivButton({Key? key, required this.onPressed, required this.text}) : super(key: key);
  final void Function() onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ElevatedButton(
        onPressed: onPressed,
          child: Text (text),
        ),
    );
  }
}