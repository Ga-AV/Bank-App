import 'package:flutter/material.dart';

//pantallas de iconos
import 'package:bank_app/features/dashboard/presentation/views/dashboard_view.dart';
import 'package:bank_app/features/dashboard/settings/views/settings_view.dart';


class BottomNavBar extends StatelessWidget {
  const BottomNavBar();

  @override
  Widget build(BuildContext context){
    return BottomAppBar(
      color: const Color.fromRGBO(217, 231, 211, 1),
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      child: SizedBox(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            NavigableIconButton(
              icon: Icons.home,
              destinationScreen: DashboardView(),
              slideDirection: SlideDirection.right,
            ),
            NavigableIconButton(
              icon: Icons.history,
              destinationScreen: DashboardView(),
              slideDirection: SlideDirection.right,
            ),
            SizedBox(width: 40),
            NavigableIconButton(
              icon: Icons.add_card,
              destinationScreen: DashboardView(),
              slideDirection: SlideDirection.left,
            ),
            NavigableIconButton(
              icon: Icons.settings,
              destinationScreen: SettingsView(),
              slideDirection: SlideDirection.right,
            ),
          ],

        ),

      ),
    );
  }
}

class NavigableIconButton extends StatelessWidget {
  final IconData icon;
  final Widget destinationScreen;
  final SlideDirection slideDirection;
  final VoidCallback? onPressed;

  const NavigableIconButton({
    super.key,
    required this.icon,
    required this.destinationScreen,
    required this.slideDirection,
    this.onPressed,
  });

  Offset _getBeginOffset() {
    switch (slideDirection) {
      case SlideDirection.left:
        return const Offset(-1.0, 0.0); // Desde la izquierda
      case SlideDirection.right:
        return const Offset(1.0, 0.0);  // Desde la derecha
    }
  }

  void _navigateWithSlide (BuildContext context) {
    if (onPressed != null) {
      onPressed!();
    } else {
      Navigator.pushAndRemoveUntil(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              destinationScreen,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final begin = _getBeginOffset();
            const end = Offset.zero;
            const curve = Curves.ease;

            var tween = Tween(begin: begin, end: end)
                .chain(CurveTween(curve: curve));
            var offsetAnimation = animation.drive(tween);

            return SlideTransition(
              position: offsetAnimation,
              child: child,

            );
          },
        ),
        (route) => false, // Elimina todas las rutas anteriores
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon),
      onPressed: () => _navigateWithSlide(context),
    );
  }
}

enum SlideDirection {
  left,
  right
}