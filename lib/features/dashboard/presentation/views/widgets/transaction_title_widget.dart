import 'package:flutter/material.dart';

class TransactionTile extends StatelessWidget {
  final String title;
  final String date;
  final String amount;

  const TransactionTile({
    super.key,
    required this.title,
    required this.date,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    final isNegative = amount.startsWith('-');

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              color: Color.fromRGBO(248, 243, 225, 1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(Icons.store, color: Color.fromRGBO(65, 67, 27, 1)),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      fontFamily: "OpenSans"),
                ),
                const SizedBox(height: 4),
                Text(
                  date,
                  style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 12,
                      fontFamily: "OpenSans"),
                ),
              ],
            ),
          ),
          Text(
            amount,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: isNegative ? Colors.redAccent : Colors.green,
                fontFamily: "OpenSans"),
          ),
        ],
      ),
    );
  }
}
