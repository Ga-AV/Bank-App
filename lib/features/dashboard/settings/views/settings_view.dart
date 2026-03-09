import 'package:flutter/material.dart';
import 'package:bank_app/features/dashboard/bottomBar/widget/bottomBar.dart';
import 'package:bank_app/theme/colors_enum.dart';

import 'package:bank_app/features/dashboard/settings/views/settings_block_acct_view.dart';
import 'package:bank_app/features/dashboard/settings/views/settings_notificaciont_view.dart';
import 'package:bank_app/features/dashboard/settings/views/settings_password_view.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopAppBar(),
      body: BodyList(),
      bottomNavigationBar: BottomNavBar(page: 4),
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class TopAppBar extends StatelessWidget implements PreferredSizeWidget {

  const TopAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: const Text('Settings'),
      backgroundColor: ColorEnum.green_1,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class BodyList extends StatefulWidget{
  const BodyList({super.key});

  @override
  State<BodyList> createState() => _BodyListState();

}

class _BodyListState extends State<BodyList> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        // Fondo verde
        Container(
          color: ColorEnum.green_1,
        ),

        // Panel blanco
        Positioned(
          top: 75,
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            // padding: EdgeInsets.all(20),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
            decoration: BoxDecoration(
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
              children: [

                ListTile(
                  leading: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: ColorEnum.green_4, // color del círculo
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.notifications,
                      color: ColorEnum.green_2, // color del icono
                      size: 20,
                    ),
                  ),
                  title: Text("Notification Settings"),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SettingsNotificaciontView()),
                    );
                  },
                ),


                ListTile(
                  leading: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: ColorEnum.green_4, // color del círculo
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.password_sharp,
                      color: ColorEnum.green_2, // color del icono
                      size: 20,
                    ),
                  ),
                  title: Text("Password Settings"),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SettingsPasswordView()),
                    );
                  },
                ),


                ListTile(
                  leading: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: ColorEnum.green_4, // color del círculo
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.block,
                      color: ColorEnum.green_2, // color del icono
                      size: 20,
                    ),
                  ),
                  title: Text("Block Account"),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SettingsBlockAcctView()),
                    );
                  },
                ),

              ],
            ),
          ),
        ),
      ],
    );
  }
}
