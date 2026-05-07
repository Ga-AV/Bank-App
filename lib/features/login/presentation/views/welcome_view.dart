import 'package:bank_app/core/assets.dart';
import 'package:bank_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white, body: BodyWidget());
  }
}

class BodyWidget extends StatelessWidget {
  const BodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: constraints.maxWidth > 600
                ? (constraints.maxWidth - 600) / 2 * 24
                : 24,
            vertical: 200,
          ),
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                Assets.background,
                width: double.infinity,
                height: 300,
                //fit: BoxFit.cover,
                alignment: AlignmentGeometry.topCenter,
              ),
              Text(
                loc.welcome,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  fontFamily: "OpenSans",
                ),
              ),
              Text(
                loc.slogan,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  fontFamily: "OpenSans",
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 32),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Color.fromRGBO(174, 183, 132, 1),
                  ),
                  padding: WidgetStatePropertyAll(
                    EdgeInsetsGeometry.only(
                      top: 10,
                      bottom: 10,
                      left: 100,
                      right: 100,
                    ),
                  ),
                ),
                onPressed: () {
                   context.go('/login');
                },
                child: Text(
                  loc.enter,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontFamily: "OpenSans",
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
