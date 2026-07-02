import 'package:bank_app/features/dashboard/domain/entities/product.dart';
import 'package:bank_app/features/dashboard/presentation/provider/dashboard_provider.dart';
import 'package:bank_app/features/dashboard/presentation/state/dashboard_state.dart';
import 'package:bank_app/features/dashboard/presentation/views/widgets/bottomBar/widget/bottomBar.dart';
import 'package:bank_app/features/dashboard/presentation/views/widgets/transaction_title_widget.dart';
import 'package:bank_app/features/login/presentation/provider/auth_provider.dart';
import 'package:bank_app/features/transfers/view/transfers_view.dart';
import 'package:bank_app/features/movements/presentation/views/movements_view.dart';
import 'package:bank_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:provider/provider.dart';

class DashboardView extends ConsumerStatefulWidget {
  const DashboardView({super.key});

  @override
  ConsumerState<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends ConsumerState<DashboardView> {
  final PageController controller = PageController(viewportFraction: 1);
  int currentPage = 0;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(dashboardProvider.notifier).loadProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: bodyWidget(),
      bottomNavigationBar: BottomNavBar(page: 2),
    );
  }

  Widget bodyWidget() {
    final state = ref.watch(dashboardProvider);

    if (state.isLoading) {
      return const Scaffold(
        backgroundColor: Color.fromARGB(255, 246, 247, 246),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (state.error != null) {
      return Scaffold(
        backgroundColor: const Color.fromARGB(255, 246, 247, 246),
        body: Center(child: Text(state.error!)),
      );
    }

    final products = state.products;

    if (products.isEmpty) {
      return const Scaffold(
        backgroundColor: Color.fromARGB(255, 246, 247, 246),
        body: Center(child: Text("No products available")),
      );
    }

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 246, 247, 246),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderSection(),

            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,

              child: PageView.builder(
                controller: controller,
                itemCount: products.length,

                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },

                itemBuilder: (_, index) {
                  final product = products[index];

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),

                    child: Column(
                      children: [
                        const SizedBox(height: 25),

                        CreditCardWidget(product: product),

                        const SizedBox(height: 20),

                        const ActionButtons(),

                        const SizedBox(height: 20),

                        SmoothPageIndicator(
                          controller: controller,
                          count: products.length,
                          effect: const WormEffect(
                            dotHeight: 10,
                            dotWidth: 10,
                            activeDotColor: Color.fromRGBO(174, 183, 132, 1),
                          ),
                        ),

                        const SizedBox(height: 10),

                        _TransactionsSection(),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TransactionsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return Column(
      children: [
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsetsGeometry.only(left: 20),
              child: Text(
                loc.transactions,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: "OpenSans",
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsGeometry.only(right: 20),
              child: Text(
                loc.all_transactions,
                style: TextStyle(
                  color: Color.fromRGBO(65, 67, 27, 1),
                  fontFamily: "OpenSans",
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        TransactionTile(
          title: "Supermaket",
          date: "20 January 2026",
          amount: "-\Q200.00",
        ),
        const SizedBox(height: 15),
        TransactionTile(
          title: "Wi-Fi Bill",
          date: "24 January 2026",
          amount: "-\Q120.00",
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
          children: [
            Icon(Icons.home),
            GestureDetector(
              child: Icon(Icons.history),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const Movements(),
                  ),
                ),
              },
            ),
            SizedBox(width: 40),
            Icon(Icons.add_card),
            Icon(Icons.settings),
          ],
        ),
      ),
    );
  }
}

class HeaderSection extends ConsumerWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(authProvider);
    final username = userState.title;
    final loc = AppLocalizations.of(context)!;
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 60, 20, 30),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(174, 183, 132, 1),
            Color.fromRGBO(174, 183, 132, 1),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                loc.good_morning,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "OpenSans",
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              Icon(Icons.notifications_none, color: Colors.white, size: 30),
            ],
          ),
          const SizedBox(height: 5),
          Text(
            username,
            style: TextStyle(
              fontSize: 26,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: "OpenSans",
            ),
          ),
        ],
      ),
    );
  }
}

class CreditCardWidget extends StatelessWidget {
  final Product product;
  const CreditCardWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return Container(
      height: 180,
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [
            Color.fromRGBO(171, 179, 139, 1),
            Color.fromRGBO(212, 227, 187, 1),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.productName,
            style: TextStyle(
              color: Colors.white,
              fontFamily: "OpenSans",
              fontSize: 12,
            ),
          ),
          Text(
            "•••• •••• •••• ${product.accountNumber}",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: "OpenSans",
              fontWeight: FontWeight.w500,
            ),
          ),
          Spacer(),
          Text(
            loc.balance,
            style: TextStyle(color: Colors.white, fontFamily: "OpenSans"),
          ),
          SizedBox(height: 4),
          Text(
            "Q${product.balance.toStringAsFixed(2)}",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontFamily: "OpenSans",
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  Widget actionItem(IconData icon, String label, context, Function function) {
    return GestureDetector(
      child: Column(
        children: [
          Container(
            height: 55,
            width: 100,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(245, 249, 223, 1),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Icon(icon, color: Colors.black),
          ),
          const SizedBox(height: 8),
          Text(label, style: TextStyle(fontFamily: "OpenSans")),
        ],
      ),
      onTap: () => {function()},
    );
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          actionItem(
            Icons.send,
            loc.transfer,
            context,
            () => {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const TransfersView(),
                ),
              ),
            },
          ),
          actionItem(
            Icons.payment,
            loc.movements,
            context,
            () => {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const Movements(),
                ),
              ),
            },
          ),
        ],
      ),
    );
  }
}
