import 'package:flutter/material.dart';

class DropDownCity extends StatefulWidget {
  const DropDownCity({super.key});

  @override
  State<DropDownCity> createState() => _DropDownLangState();
}

class _DropDownLangState extends State<DropDownCity> {
  String dropdownvalue = 'Cairo';

  var items = [
    'Cairo',
    'Alex',
    'Giza',
    'Shubra',
    'Port',
    'Suez',
    'Luxor',
    'Asyut',
    'Ismailia',
    'Faiyum',
    'Zagazig',
    'Damietta',
    'Aswan',
    'Minya',
    'Damanhur',
    'Suef',
    'Sohag',
    'Hurghada',
    'Tanta',
    'Mansoura',
    'Banha',
    'Kafr El',
    'Mallawi',
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
