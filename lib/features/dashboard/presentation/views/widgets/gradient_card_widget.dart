import 'package:flutter/material.dart';

class GradientCard extends StatelessWidget {
  final String title;
  final String amount;
  final List<Color> colors;

  const GradientCard({
    super.key,
    required this.title,
    required this.amount,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(colors: colors),
        boxShadow: [
          BoxShadow(
            color: colors.last.withOpacity(0.4),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style:
                  const TextStyle(color: Colors.black, fontFamily: "OpenSans")),
          const SizedBox(height: 10),
          Text(
            amount,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold,
                fontFamily: "OpenSans"),
          ),
        ],
      ),
    );
  }
}
