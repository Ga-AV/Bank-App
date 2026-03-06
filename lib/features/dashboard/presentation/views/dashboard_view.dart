import 'package:bank_app/features/dashboard/presentation/views/widgets/bill_item_widget.dart';
import 'package:bank_app/features/dashboard/presentation/views/widgets/gradient_card_widget.dart';
import 'package:bank_app/features/dashboard/presentation/views/widgets/transaction_title_widget.dart';
import 'package:bank_app/features/dashboard/bottomBar/widget/bottomBar.dart';
import 'package:flutter/material.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white, 
      body: BodyWidget(),
    );
  }
}

class BodyWidget extends StatelessWidget {
  const BodyWidget({super.key});

  void _handleFabPress() {
    print("FAB presionado en Dashboard");
    // Aquí va la lógica para agregar dinero, transacción, etc.
    // ScaffoldMessenger.of(context).showSnackBar(
    //   const SnackBar(content: Text('Agregar transacción')),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 253, 253, 253),
      body: SafeArea(
        child: Column(
          children: [
            const MyAppBar(),
            const SizedBox(height: 30),
            const _CreditCard(),
            const SizedBox(height: 50),
            const _PayBillsSection(),
            const SizedBox(height: 40),
            const Expanded(child: _TransactionsSection()),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(page: 2)
    );
  }
}

class _TopCards extends StatelessWidget {
  const _TopCards();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: GradientCard(
              title: "Income",
              amount: "\Q21,000",
              colors: const [
                Color.fromRGBO(174, 183, 132, 1),
                Color.fromRGBO(227, 219, 187, 1),
              ],
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: GradientCard(
              title: "Expenditure",
              amount: "\Q11,000",
              colors: const [
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

class _CreditCard extends StatelessWidget {
  const _CreditCard();

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
            color: const Color.fromRGBO(174, 183, 132, 1),
            blurRadius: 25,
            offset: const Offset(0, 15),
          ),
        ],
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "User Name",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
                fontFamily: "OpenSans"),
          ),
          SizedBox(height: 20),
          Text(
            "Account Number:",
            style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: "OpenSans"),
          ),
          Text(
            "4551 5667 8886 7775",
            style: TextStyle(
                color: Colors.black, fontSize: 12, fontFamily: "OpenSans"),
          ),
          SizedBox(height: 20),
          Text("Account Balance",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: "OpenSans")),
          Text(
            "\Q121,000",
            style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: "OpenSans"),
          ),
        ],
      ),
    );
  }
}

class _PayBillsSection extends StatelessWidget {
  const _PayBillsSection();

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
                fontFamily: "OpenSans"),
          ),
          const SizedBox(height: 15),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BillItem(
                icon: Icons.water_drop,
                label: "Water",
                color: Color.fromRGBO(174, 183, 132, 1),
              ),
              BillItem(
                icon: Icons.flash_on,
                label: "Power",
                color: Color.fromRGBO(174, 183, 132, 1),
              ),
              BillItem(
                icon: Icons.wifi,
                label: "Wi-Fi",
                color: Color.fromRGBO(174, 183, 132, 1),
              ),
              BillItem(
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
  const _TransactionsSection();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children: const [
        TransactionTile(
          title: "Supermaket",
          date: "20 January 2026",
          amount: "-\Q22",
        ),
        SizedBox(height: 15),
        TransactionTile(
          title: "Wi-Fi Bill",
          date: "24 January 2026",
          amount: "-\Q120",
        ),
      ],
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
        const SizedBox(height: 50),
        const Icon(
          Icons.person_rounded,
          color: Color.fromRGBO(65, 67, 27, 1),
          size: 30,
        ),
        const SizedBox(width: 10),
        const Text(
          "Hey! @UserName",
          style: TextStyle(
            fontFamily: "OpenSans",
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        const SizedBox(width: 80),
        Container(
          alignment: Alignment.bottomCenter,
          child: const Row(
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