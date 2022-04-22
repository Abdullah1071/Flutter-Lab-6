import 'package:flutter/material.dart';

class Profileitem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String text;
  final bool isSwitch;
  final bool switchVal;
  const Profileitem(
      {Key? key,
      required this.icon,
      required this.label,
      this.text = '',
      this.isSwitch = false,
      this.switchVal = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    icon,
                    color: Theme.of(context).primaryColor,
                  ),
                  Text(
                    label,
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                ],
              ),
              isSwitch ? Switch(value: switchVal, onChanged: null) : Text(text),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
