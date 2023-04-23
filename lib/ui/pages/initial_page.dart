import 'package:flutter/material.dart';

import 'description_page.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const DescriptionPage()),
          );
        },
        child: Center(
          child: RichText(
            textAlign: TextAlign.center,
            text:  const TextSpan(
              style: TextStyle(
                fontSize: 50.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: 'E',
                  style: TextStyle(
                    color: Color.fromARGB(255, 82, 212, 87),
                  ),
                ),
                TextSpan(
                  text: '-FOOD',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}