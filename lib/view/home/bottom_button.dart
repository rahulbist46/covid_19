import 'package:flutter/material.dart';
import '../countries_details/country_screen.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const CountryScreen()));
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: const Color(0xff1aa260),
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Center(
          child: Text('Track Countries'),
        ),
      ),
    );
  }
}
