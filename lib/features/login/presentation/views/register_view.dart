import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BodyWidget(),
    );
  }
}

class BodyWidget extends StatelessWidget {
  const BodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints){
        return Container(
          padding: EdgeInsets.symmetric(
              horizontal: constraints.maxWidth > 600
                  ? (constraints.maxWidth - 600) / 2 * 24
                  : 24,
              vertical: 40),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
           child: Column(),
        );
    });
  }
}