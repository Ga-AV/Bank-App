import 'package:bank_app/features/login/presentation/provider/auth_provider.dart';
import 'package:bank_app/features/login/presentation/views/welcome_view.dart';
import 'package:bank_app/features/movements/presentation/views/movements_view.dart';
import 'package:bank_app/features/dashboard/transfers/view/transfers_view.dart';
import 'package:bank_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:bank_app/theme/colors_enum.dart';
import 'package:bank_app/features/dashboard/settings/views/settings_view.dart';
import 'package:bank_app/features/dashboard/presentation/views/dashboard_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class BottomNavBar extends ConsumerStatefulWidget {
  final int page;
  BottomNavBar({required this.page});

  @override
  ConsumerState<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends ConsumerState<BottomNavBar> {
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _page = widget.page;
  }

  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      key: _bottomNavigationKey,
      index: _page,
      items: <Widget>[
        Icon(Icons.home, size: 30),
        Icon(Icons.add_card, size: 30),
        Icon(Icons.attach_money, size: 30),
        Icon(Icons.history, size: 30),
        Icon(Icons.settings, size: 30),
      ],
      color: ColorEnum.green_4,
      buttonBackgroundColor: ColorEnum.green_1,
      backgroundColor: Colors.transparent,
      animationCurve: Curves.easeInOut,
      animationDuration: Duration(milliseconds: 600),
      onTap: (index) {
        setState(() {
          _page = index;
        });
        switch (index) {
          case 0:
            showLogoutDialog(context, ref);
            break;
          case 1:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TransfersView()),
            );
            break;
          case 2:
            Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => DashboardView(),
              ),
            );
            break;
          case 3:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Movements()),
            );
            break;
          case 4:
            Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const SettingsView(),
              ),
            );
            break;
        }
      },
      letIndexChange: (index) => true,
    );
  }

  Future<void> showLogoutDialog(BuildContext context, WidgetRef ref) async {
    var loc = AppLocalizations.of(context)!;
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(loc.logout),
          content: Text(loc.confirmation_logout),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: Text(loc.cancel),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: Text(loc.confirmation),
            ),
          ],
        );
      },
    );

    if (confirm == true) {
      await ref.read(authProvider.notifier).logout();

      if (context.mounted) {
        context.go('/');
      }
    }
  }
}
