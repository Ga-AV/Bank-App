import 'package:bank_app/features/dashboard/presentation/views/widgets/bill_item_widget.dart';
import 'package:bank_app/features/dashboard/presentation/views/widgets/gradient_card_widget.dart';
import 'package:bank_app/features/dashboard/presentation/views/widgets/transaction_title_widget.dart';
import 'package:bank_app/features/dashboard/bottomBar/widget/bottomBar.dart';
import 'package:flutter/material.dart';


class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

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
      bottomNavigationBar: const BottomNavBar(),
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
            child: GradientCard(
              title: "Income",
              amount: "\Q21,000",
              colors: [
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
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

// class _BottomNavBar extends StatelessWidget {
//   const _BottomNavBar();

//   @override
//   Widget build(BuildContext context) {
//     return BottomAppBar(
//       color: Color.fromRGBO(217, 231, 211, 1),
//       shape: const CircularNotchedRectangle(),
//       notchMargin: 8,
//       child: SizedBox(
//         height: 70,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: const [
//             Icon(Icons.home),
//             Icon(Icons.history),
//             SizedBox(width: 40),
//             Icon(Icons.add_card),
//             Icon(Icons.settings),
//           ],
//         ),
//       ),
//     );
//   }
// }



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
          Icons.person_rounded,
          color: Color.fromRGBO(65, 67, 27, 1),
          size: 30,
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

