import 'package:bank_app/features/dashboard/transfers/view/transfers_view.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:bank_app/theme/colors_enum.dart';
import 'package:bank_app/features/dashboard/settings/views/settings_view.dart';
import 'package:bank_app/features/dashboard/presentation/views/dashboard_view.dart';


class BottomNavBar extends StatefulWidget {
  final int page;
  BottomNavBar({
    required this.page
  });

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  void initState(){
    super.initState();
    _page = widget.page;
  }

  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      key: _bottomNavigationKey,
      index: _page,
      items: <Widget>[
        Icon(Icons.home, size: 30),
        Icon(Icons.transform_rounded, size: 30),
        Icon(Icons.attach_money, size: 30),
        Icon(Icons.add_card, size: 30),
        Icon(Icons.settings, size: 30),
      ],
      color: ColorEnum.green_4,
      buttonBackgroundColor: ColorEnum.green_1,
      backgroundColor: ColorEnum.white_1,
      animationCurve: Curves.easeInOut,
      animationDuration: Duration(milliseconds: 600),
      onTap: (index) {
        setState(() {
          _page = index;
        });
        
        // Aquí puedes agregar navegación si lo necesitas
        print('Tab seleccionado: $index');
        
        // Ejemplo: navegar a diferentes páginas
        switch(index) {
          case 0:
            // Navegar a Home
            break;
          case 1:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => TransfersView())
            );
            break;
          case 2:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => DashboardView())
            );
            break;
          case 3:
            // Navegar a Cards
            break;
          case 4:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => SettingsView())
            );
            break;
            // Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsView()));
            // break;
        }
      },
      letIndexChange: (index) => true,
    );
  }
}