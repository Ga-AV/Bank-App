import 'package:flutter/material.dart';
import 'package:bank_app/features/dashboard/presentation/views/widgets/bottomBar/widget/bottomBar.dart';
import 'package:bank_app/theme/colors_enum.dart';
import 'package:bank_app/l10n/app_localizations.dart';

class SettingsPasswordView extends StatefulWidget {
  const SettingsPasswordView({Key? key}) : super(key: key);

  @override
  State<SettingsPasswordView> createState() => _SettingsPasswordViewState();
}

class _SettingsPasswordViewState extends State<SettingsPasswordView> {
  bool showCurrent = false;
  bool showNew = false;
  bool showConfirm = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopAppBar(),
      body: BodyPassword(),
      bottomNavigationBar: BottomNavBar(page: 4),
    );
  }
}

class TopAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TopAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return AppBar(
      title: Text(loc.password_settings),
      backgroundColor: ColorEnum.green_1,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class BodyPassword extends StatefulWidget {
  const BodyPassword({super.key});

  @override
  State<BodyPassword> createState() => _BodyPasswordState();
}

class _BodyPasswordState extends State<BodyPassword> {

  bool showCurrent = false;
  bool showNew = false;
  bool showConfirm = false;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return Stack(
      children: [
        Container(
          color: ColorEnum.green_1,
        ),
        Positioned(
          top: 75,
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 65),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(75),
                topRight: Radius.circular(75),
              ),
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  color: Colors.black26,
                )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: Text(
                    loc.current_password,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  obscureText: !showCurrent,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: ColorEnum.green_4,
                    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(showCurrent ? Icons.visibility : Icons.visibility_off),
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                      onPressed: () {
                        setState(() {
                          showCurrent = !showCurrent;
                        });
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: Text(
                    loc.new_password,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  obscureText: !showNew,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: ColorEnum.green_4,
                    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(showNew ? Icons.visibility : Icons.visibility_off),
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                      onPressed: () {
                        setState(() {
                          showNew = !showNew;
                        });
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: Text(
                    loc.confirm_new_password,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  obscureText: !showConfirm,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: ColorEnum.green_4,
                    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(showConfirm ? Icons.visibility : Icons.visibility_off),
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                      onPressed: () {
                        setState(() {
                          showConfirm = !showConfirm;
                        });
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                Center(
                  child: SizedBox(
                    width: 220,
                    height: 50, 
                    child: ElevatedButton(
                      onPressed: () {
                 
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorEnum.green_2,
                        foregroundColor: ColorEnum.white_1, 
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25), 
                        ),
                      ),
                      child: Text(
                        loc.change_password,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}