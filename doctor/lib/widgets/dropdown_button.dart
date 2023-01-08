import 'package:doctor/screen/preparat_screen.dart';
import 'package:flutter/material.dart';


class DropdownButtonPreparat extends StatefulWidget {
  final List<Preparat> preparats;

  const DropdownButtonPreparat({
    Key? key, 
    required this.preparats,
    }):super(key: key);

  @override
  State<DropdownButtonPreparat> createState() => _DropdownButtonPreparatState();
}

class _DropdownButtonPreparatState extends State<DropdownButtonPreparat> {
  Preparat? dropdownValue;

  @override
  void initState() {
    dropdownValue = widget.preparats.first;
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      color: Colors.white,
      child: DropdownButton<Preparat>(
        value: dropdownValue,
        isExpanded: true,
        icon: const Icon(Icons.arrow_drop_down),
        elevation: 20,
        underline: Container(
          height: 2,
          color: Colors.green,
        ),
        
        items: widget.preparats.map((preparat) {
          return DropdownMenuItem(
            value: preparat,
            child: Text('$preparat'),
          );
        }).toList(),

        onChanged: (value) {
          // This is called when the user selects an item.
          setState(() {
            dropdownValue = value!;
          });
        },
      ),
    );
  }
}