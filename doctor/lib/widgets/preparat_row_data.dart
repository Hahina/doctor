import 'package:doctor/screen/preparat_screen.dart';
import 'package:flutter/material.dart';


class PreparatRowData extends StatelessWidget {
  final List<Preparat> preparats;

  const PreparatRowData({
    Key? key, 
    required this.preparats,
    }):super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      child: Column(
        children: preparats.map((preparat) => Text('$preparats')).toList(),
        ),
      );
  }
}