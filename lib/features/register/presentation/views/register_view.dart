import 'package:bank_app/core/assets.dart';
import 'package:bank_app/features/dashboard/presentation/views/dashboard_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: true,
          body: BodyWidget(),
          appBar: AppBar(
            backgroundColor: Colors.white,
            // Color.fromRGBO(174, 183, 132, 1),
            titleSpacing: 0.01,
            toolbarHeight: 60,
            shape: ShapeBorder.lerp(null, null, 1),
            title: Text(
              "Register",
              style: TextStyle(
                fontFamily: "OpenSans",
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
              textAlign: TextAlign.end,
            ),
          ),
        );
      },
    );
  }
}

class BodyWidget extends StatelessWidget {
  const BodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: constraints.maxWidth > 600
                ? (constraints.maxWidth - 600) / 2 * 24
                : 24,
            vertical: 10,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadiusGeometry.all(Radius.circular(10)),
          ),
          child: Column(
            children: [
              Container(
                alignment: AlignmentGeometry.topStart,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Register",
                      style: TextStyle(
                        fontFamily: "OpenSans",
                        fontSize: 28,
                        color: Color.fromRGBO(65, 67, 27, 1),
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      "Hi there, create an account to continue ",
                      style: TextStyle(fontFamily: "OpenSans", fontSize: 14),
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
                decoration: InputDecoration(
                  hintText: "Username",
                  label: Text(
                    "Username",
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
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  hintText: "****",
                  label: Text(
                    "Confirm Password",
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
              SizedBox(height: 25),
              ElevatedButton(
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
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const DashboardView(),
                    ),
                  );
                },
                child: Text(
                  "Sign up",
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
                  text: "Already have an account? ",
                  style: TextStyle(color: Colors.black, fontSize: 14),
                  children: [
                    TextSpan(
                      text: "Login",
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          print("Register now");
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
          ),
        );
      },
    );
  }
}
