import 'package:flutter/material.dart';
import 'package:bank_app/features/dashboard/presentation/views/widgets/bottomBar/widget/bottomBar.dart';
import 'package:bank_app/theme/colors_enum.dart';
import 'package:bank_app/l10n/app_localizations.dart';

import 'package:bank_app/features/settings/views/settings_block_acct_view.dart';
import 'package:bank_app/features/settings/views/settings_notificaciont_view.dart';
import 'package:bank_app/features/settings/views/settings_password_view.dart';
import 'package:bank_app/features/settings/views/settings_preferences_view.dart';

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
    final loc = AppLocalizations.of(context)!;
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text(loc.settings),
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
                      color: ColorEnum.green_4,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.notifications,
                      color: ColorEnum.green_2,
                      size: 20,
                    ),
                  ),
                  title: Text(loc.notification_settings),
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
                      color: ColorEnum.green_4,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.password_sharp,
                      color: ColorEnum.green_2,
                      size: 20,
                    ),
                  ),
                  title: Text(loc.password_settings),
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
                      color: ColorEnum.green_4,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.block,
                      color: ColorEnum.green_2,
                      size: 20,
                    ),
                  ),
                  title: Text(loc.block_account),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SettingsBlockAcctView()),
                    );
                  },
                ),

                ListTile(
                  leading: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: ColorEnum.green_4,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.block,
                      color: ColorEnum.green_2,
                      size: 20,
                    ),
                  ),
                  title: Text(loc.preferences),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SettingsPreferencesView()),
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
