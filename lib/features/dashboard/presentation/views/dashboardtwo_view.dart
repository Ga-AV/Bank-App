import 'package:flutter/material.dart';

class DashboardTwoView extends StatelessWidget {
  const DashboardTwoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white, body: BodyWidget());
  }
}

class BodyWidget extends StatelessWidget {
  const BodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 253, 253, 253),
      body: SafeArea(
        child: Column(
          children: [
            MyAppBar(),
            //SizedBox(height: 10),
            //_TopCards(),
            const SizedBox(height: 30),
            _CreditCard(),
            const SizedBox(height: 50),
            _PayBillsSection(),
            const SizedBox(height: 40),
            Expanded(child: _TransactionsSection()),
          ],
        ),
      ),
      bottomNavigationBar: const _BottomNavBar(),
      floatingActionButton: const _CenterFAB(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _TopCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: _GradientCard(
              title: "Income",
              amount: "\Q21,000",
              //colors: [Color.fromARGB(255, 171, 213, 127), Color.fromARGB(255, 134, 231, 191)],
              colors: [
                Color.fromRGBO(174, 183, 132, 1),
                Color.fromRGBO(227, 219, 187, 1),
              ],
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: _GradientCard(
              title: "Expenditure",
              amount: "\Q11,000",
              colors: [
                Color.fromRGBO(174, 183, 132, 1),
                Color.fromRGBO(227, 219, 187, 1),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _GradientCard extends StatelessWidget {
  final String title;
  final String amount;
  final List<Color> colors;

  const _GradientCard({
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
          Text(title, style: const TextStyle(color: Colors.black, fontFamily: "OpenSans")),
          const SizedBox(height: 10),
          Text(
            amount,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              fontFamily: "OpenSans"
            ),
          ),
        ],
      ),
    );
  }
}

class _CreditCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      padding: const EdgeInsets.only(left: 70, right: 70, top: 20, bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient: const LinearGradient(
          colors: [
            Color.fromRGBO(174, 183, 132, 1),
            Color.fromRGBO(227, 219, 187, 1),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(174, 183, 132, 1).withOpacity(1),
            blurRadius: 25,
            offset: const Offset(0, 15),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text(
            "User Name",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
              fontFamily: "OpenSans"
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Account Number:",
            style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold, fontFamily: "OpenSans"),
          ),
          Text(
            "4551 5667 8886 7775",
            style: TextStyle(color: Colors.black, fontSize: 12, fontFamily: "OpenSans"),
          ),
          SizedBox(height: 20),
          Text("Account Balance", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontFamily: "OpenSans")),
          Text(
            "\Q121,000",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: "OpenSans"
            ),
          ),
        ],
      ),
    );
  }
}

class _PayBillsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Pay Bills",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(65, 67, 27, 1),
              fontFamily: "OpenSans"
            ),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              _BillItem(
                icon: Icons.water_drop,
                label: "Water",
                color: Color.fromRGBO(174, 183, 132, 1),
              ),
              _BillItem(
                icon: Icons.flash_on,
                label: "Power",
                color: Color.fromRGBO(174, 183, 132, 1),
              ),
              _BillItem(
                icon: Icons.wifi,
                label: "Wi-Fi",
                color: Color.fromRGBO(174, 183, 132, 1),
              ),
              _BillItem(
                icon: Icons.shopping_cart,
                label: "Grocery",
                color: Color.fromRGBO(174, 183, 132, 1),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _TransactionsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children: const [
        _TransactionTile(
          title: "Supermaket",
          date: "20 January 2026",
          amount: "-\Q22",
        ),
        SizedBox(height: 15),
        _TransactionTile(
          title: "Wi-Fi Bill",
          date: "24 January 2026",
          amount: "-\Q120",
        ),
      ],
    );
  }
}

class _BillItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const _BillItem({
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [color.withOpacity(0.8), color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.4),
                blurRadius: 15,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Icon(icon, color: Colors.white, size: 28),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: Color.fromRGBO(65, 67, 27, 1),
            fontFamily: "OpenSans"
          ),
        ),
      ],
    );
  }
}

class _TransactionTile extends StatelessWidget {
  final String title;
  final String date;
  final String amount;

  const _TransactionTile({
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
          // Leading Icon Container
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

          // Title & Date
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    fontFamily: "OpenSans"
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  date,
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 12, fontFamily: "OpenSans"),
                ),
              ],
            ),
          ),

          // Amount
          Text(
            amount,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isNegative ? Colors.redAccent : Colors.green,
              fontFamily: "OpenSans"
            ),
          ),
        ],
      ),
    );
  }
}

class _CenterFAB extends StatelessWidget {
  const _CenterFAB();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      backgroundColor: Color.fromRGBO(174, 183, 132, 1),
      child: const Icon(Icons.attach_money, size: 30, color: Colors.black),
    );
  }
}

class _BottomNavBar extends StatelessWidget {
  const _BottomNavBar();

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Color.fromRGBO(217, 231, 211, 1),
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      child: SizedBox(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Icon(Icons.home),
            Icon(Icons.history),
            SizedBox(width: 40), // space for FAB
            Icon(Icons.add_card),
            Icon(Icons.settings),
          ],
        ),
      ),
    );
  }
}

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 50),
        Icon(
          Icons.emoji_people,
          color: Color.fromRGBO(65, 67, 27, 1),
          size: 40,
        ),
        SizedBox(width: 10),
        Text(
          "Hey! @UserName",
          style: TextStyle(
            fontFamily: "OpenSans",
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        SizedBox(width: 80),
        Container(
          alignment: AlignmentGeometry.bottomEnd,
          child: Row(
            children: [
              Icon(
                Icons.search,
                color: Color.fromRGBO(65, 67, 27, 1),
                size: 30,
              ),
              SizedBox(width: 5),
              Icon(
                Icons.notifications,
                color: Color.fromRGBO(65, 67, 27, 1),
                size: 30,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
