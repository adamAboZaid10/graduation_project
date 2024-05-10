import 'package:flutter/material.dart';

class DropDownLang extends StatefulWidget {
  const DropDownLang({super.key});

  @override
  State<DropDownLang> createState() => _DropDownLangState();
}

class _DropDownLangState extends State<DropDownLang> {
  String dropdownvalue = 'English';

  var items = [
    'English',
    'Arabic',
  ];
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: width * .27,
            child: DropdownButton(
              value: dropdownvalue,
              icon: const Icon(Icons.keyboard_arrow_down),
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
