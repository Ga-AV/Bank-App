import 'package:bank_app/core/assets.dart';
import 'package:bank_app/features/dashboard/presentation/views/dashboard_view.dart';
import 'package:bank_app/features/login/presentation/provider/login_provider.dart';
import 'package:bank_app/features/register/presentation/views/register_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BodyWidget(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        // Color.fromRGBO(174, 183, 132, 1),
        titleSpacing: 0.01,
        toolbarHeight: 60,
        shape: ShapeBorder.lerp(null, null, 1),
        title: Text(
          "Sign in",
          style: TextStyle(
            fontFamily: "OpenSans",
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
          textAlign: TextAlign.end,
        ),
      ),
    );
  }
}

class BodyWidget extends StatelessWidget {
  BodyWidget({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: constraints.maxWidth > 600
                ? (constraints.maxWidth - 600) / 2 * 24
                : 24,
            vertical: 40,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadiusGeometry.all(Radius.circular(10)),
          ),
          child: Consumer<LoginProvider>(
            builder: (context, auth, child) {
              if (auth.error != null) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        auth.error!,
                        style: TextStyle(fontFamily: "OpenSans", fontSize: 14, color: Colors.black),
                      ),
                      backgroundColor: Colors.red,
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      duration: const Duration(seconds: 3),
                    ),
                  );
                });
              }
              if (auth.user != null) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DashboardView(),
                    ),
                  );
                });
              }
              return Column(
                children: [
                  Container(
                    alignment: AlignmentGeometry.topStart,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome Back",
                          style: TextStyle(
                            fontFamily: "OpenSans",
                            fontSize: 28,
                            color: Color.fromRGBO(65, 67, 27, 1),
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        Text(
                          "Hi there, sign in to continue ",
                          style: TextStyle(
                            fontFamily: "OpenSans",
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Image.asset(
                    Assets.user,
                    width: double.infinity,
                    height: 200,
                    //fit: BoxFit.cover,
                    alignment: AlignmentGeometry.topCenter,
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: "Your email",
                      label: Text(
                        "Email",
                        style: TextStyle(fontFamily: "OpenSans"),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      suffixIcon: Icon(
                        Icons.check_circle,
                        color: Color.fromRGBO(174, 183, 132, 1),
                      ),
                    ),
                    cursorColor: Color.fromRGBO(174, 183, 132, 1),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      hintText: "****",
                      label: Text(
                        "Password",
                        style: TextStyle(fontFamily: "OpenSans"),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      suffixIcon: Icon(
                        Icons.visibility_off,
                        color: Color.fromRGBO(174, 183, 132, 1),
                      ),
                      focusColor: Color.fromRGBO(174, 183, 132, 1),
                    ),
                    cursorColor: Color.fromRGBO(174, 183, 132, 1),
                  ),
                  SizedBox(height: 15),
                  Container(
                    alignment: AlignmentGeometry.topEnd,
                    child: Column(
                      children: [
                        RichText(
                          textAlign: TextAlign.end,
                          text: TextSpan(
                            text: "Forgot your password?",
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                print("Register now");
                              },
                            style: TextStyle(
                              color: Color.fromRGBO(65, 67, 27, 1),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 32),
                  auth.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : ElevatedButton(
                          style: ButtonStyle(
                            alignment: AlignmentGeometry.bottomCenter,
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
                            context.read<LoginProvider>().login(
                              emailController.text,
                              passwordController.text,
                            );
                          },
                          child: Text(
                            "Sign in",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              fontFamily: "OpenSans",
                            ),
                          ),
                        ),
                  SizedBox(height: 15),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: "Don’t have account? ",
                      style: TextStyle(color: Colors.black, fontSize: 14),
                      children: [
                        TextSpan(
                          text: "Sign Up",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute<void>(
                                  builder: (BuildContext context) =>
                                      const RegisterView(),
                                ),
                              );
                            },
                          style: TextStyle(
                            color: Color.fromRGBO(65, 67, 27, 1),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
