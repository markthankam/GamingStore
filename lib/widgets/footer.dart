import 'package:flutter/material.dart';

import '../homepage.dart';
import '../map.dart';
import 'package:work/product_1.dart';
import 'package:work/product_2.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: SizedBox.shrink(),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: SizedBox.shrink(),
          label: 'Shop',
        ),
        BottomNavigationBarItem(
          icon: SizedBox.shrink(),
          label: 'Service',
        ),
      ],
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      backgroundColor: Colors.black,

      onTap: (index) {
        if (index == 1) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Map()),
          );
        }
        if (index == 0) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        }
        // if (index == 2) {
        //   Navigator.push(
        //     context,
        //     MaterialPageRoute(builder: (context) => MapSample()),
        //   );
        // }
      },
    );
  }
}
