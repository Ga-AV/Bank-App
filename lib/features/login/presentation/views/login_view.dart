import 'package:bank_app/core/assets.dart';
import 'package:bank_app/features/login/presentation/provider/auth_provider.dart';
import 'package:bank_app/features/login/presentation/state/login_state.dart';
import 'package:bank_app/features/register/presentation/views/register_view.dart';
import 'package:bank_app/l10n/app_localizations.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LoginView extends ConsumerWidget {
  LoginView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var loc = AppLocalizations.of(context)!;
    final authState = ref.watch(authProvider);
    final isLoading = authState is LoginLoadingState;
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: BodyWidget(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        titleSpacing: 20,
        toolbarHeight: 60,
        shape: ShapeBorder.lerp(null, null, 1),
        title: Text(
          loc.sign_in,
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

class BodyWidget extends ConsumerWidget {
  BodyWidget({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool showPassword = false;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var loc = AppLocalizations.of(context)!;
    final authState = ref.watch(authProvider);
    final isLoading = authState is LoginLoadingState;

    ref.listen(authProvider, (previous, next) {
      if (next is LoginSuccessState) {
        context.go('/dashboard');
      }

      if (next is LoginErrorState) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: const Color.fromARGB(255, 245, 104, 94),
            content: Text(
              textAlign: TextAlign.center,
              loc.invalid_credentials,
              style: TextStyle(
                fontFamily: "OpenSans",
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          ),
        );
      }
    });

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
          child: Column(
            children: [
              Container(
                alignment: AlignmentGeometry.topStart,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      loc.welcome_back,
                      style: TextStyle(
                        fontFamily: "OpenSans",
                        fontSize: 28,
                        color: Color.fromRGBO(65, 67, 27, 1),
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      loc.hi_there,
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
                controller: usernameController,
                decoration: InputDecoration(
                  hintText: loc.username,
                  label: Text(
                    loc.username,
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
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "****",
                  label: Text(
                    loc.password,
                    style: TextStyle(fontFamily: "OpenSans"),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffixIcon: InkWell(
                    child: Icon(
                      Icons.visibility_off,
                      color: Color.fromRGBO(174, 183, 132, 1),
                    ),
                    onTap: () {
                      showPassword = !showPassword;
                    },
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
                        text: loc.forgot_password,
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
                onPressed: isLoading
                    ? null
                    : () async {
                        await ref
                            .read(authProvider.notifier)
                            .login(
                              username: usernameController.text,
                              password: passwordController.text,
                            );
                      },
                child: isLoading
                    ? const CircularProgressIndicator()
                    : Text(
                        loc.sign_in,
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
                  text: loc.not_member,
                  style: TextStyle(color: Colors.black, fontSize: 14),
                  children: [
                    TextSpan(
                      text: loc.sign_up,
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
          ),
        );
      },
    );
  }
}
