import 'package:bank_app/features/dashboard/bottomBar/widget/bottomBar.dart';
import 'package:bank_app/features/dashboard/presentation/views/widgets/transaction_title_widget.dart';
import 'package:flutter/material.dart';

class Movements extends StatefulWidget {
  const Movements({super.key});

  @override
  State<Movements> createState() => _MovementsState();
}

class _MovementsState extends State<Movements> {
  int selectedIndex = 0;
  final List<String> filters = ["1W", "1M", "3M", "6M", "1Y", "All"];
  final List<String> spending = [
    "Q2,000",
    "Q8,000",
    "Q24,000",
    "Q48,000",
    "Q96,000",
    "Q100,000",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 246, 247, 246),
      appBar: AppBar(
        backgroundColor: Colors.white70,
        surfaceTintColor: Colors.white70,
        titleSpacing: 0.01,
        toolbarHeight: 60,
        shape: ShapeBorder.lerp(null, null, 1),
      ),
      bottomNavigationBar: BottomNavBar(page: 1),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFFF7F7F7),
              borderRadius: BorderRadius.circular(35),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 233, 238, 234),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(filters.length, (index) {
                        final isSelected = selectedIndex == index;

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? Color.fromRGBO(174, 183, 132, 1)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              filters[index],
                              style: TextStyle(
                                color: isSelected
                                    ? Colors.white
                                    : Colors.black87,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                  const SizedBox(height: 25),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(174, 183, 132, 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Total Spendings",
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 13,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                spending[selectedIndex],
                                style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text(
                              "From selection",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 18,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    Color.fromRGBO(171, 179, 139, 1),
                                    Color.fromRGBO(212, 227, 187, 1),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                filters[selectedIndex],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    "Recent Transactions",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 15),
                  Expanded(
                    child: ListView(
                      children: const [
                        TransactionTile(
                          title: "Supermaket",
                          date: "20 January 2026",
                          amount: "- \Q200.00",
                        ),
                        SizedBox(height: 12),
                        TransactionTile(
                          title: "Wi-fi Bill",
                          date: "24 January 2026",
                          amount: "- \Q120.00",
                        ),
                        SizedBox(height: 12),
                        TransactionTile(
                          title: "Starbucks",
                          date: "30 January 2026",
                          amount: "- \Q49.99",
                        ),
                        SizedBox(height: 12),
                        TransactionTile(
                          title: "Parking",
                          date: "2 February 2026",
                          amount: "- \Q40.00",
                        ),
                        SizedBox(height: 12),
                        TransactionTile(
                          title: "Subway",
                          date: "5 February 2026",
                          amount: "- \Q20.00",
                        ),
                        SizedBox(height: 12),
                        TransactionTile(
                          title: "Supermarket",
                          date: "8 February 2026",
                          amount: "- \Q250.00",
                        ),
                        SizedBox(height: 12),
                        TransactionTile(
                          title: "Go Green",
                          date: "8 February 2026",
                          amount: "- \Q35.00",
                        ),
                        SizedBox(height: 12),
                        TransactionTile(
                          title: "Retaurant",
                          date: "14 February 2026",
                          amount: "- \Q130.00",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FilterChipWidget extends StatelessWidget {
  final String text;
  final bool selected;

  const FilterChipWidget({
    super.key,
    required this.text,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: selected ? Color.fromRGBO(174, 183, 132, 1) : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: selected ? Colors.white : Colors.black87,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
