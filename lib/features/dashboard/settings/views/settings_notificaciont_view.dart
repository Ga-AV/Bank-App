import 'package:flutter/material.dart';
import 'package:bank_app/features/dashboard/bottomBar/widget/bottomBar.dart';
import 'package:bank_app/theme/colors_enum.dart';

class SettingsNotificaciontView extends StatefulWidget {
  const SettingsNotificaciontView({Key? key}) : super(key: key);

  @override
  State<SettingsNotificaciontView> createState() => _SettingsNotificaciontViewState();
}

class _SettingsNotificaciontViewState extends State<SettingsNotificaciontView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopAppBar(),
      body: BodyNotification(),
      bottomNavigationBar: BottomNavBar(page: 4),
    );
  }
}

class TopAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TopAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Notification Settings'),
      backgroundColor: ColorEnum.green_1,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class BodyNotification extends StatefulWidget {
  const BodyNotification({super.key});

  @override
  State<BodyNotification> createState() => _BodyNotificationState();
}

class _BodyNotificationState extends State<BodyNotification> {

  bool generalNotifications = true;
  bool sound = false;
  bool soundCall = true;
  bool vibrate = true;
  bool transactionUpdate = false;
  bool expenseReminder = true;
  bool budgetNotifications = false;
  bool lowBalanceAlerts = true;

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
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
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
              children: [

                SwitchListTile(
                  title: const Text("General Notifications"),
                  value: generalNotifications,
                  onChanged: (value) {
                    setState(() {
                      generalNotifications = value;
                    });
                  },
                  activeThumbColor: ColorEnum.green_2,
                  activeTrackColor: ColorEnum.green_1,
                  inactiveThumbColor: ColorEnum.green_1,
                  inactiveTrackColor: ColorEnum.green_2,
                ),

                SwitchListTile(
                  title: const Text("Sound"),
                  value: sound,
                  onChanged: (value) {
                    setState(() {
                      sound = value;
                    });
                  },
                  activeThumbColor: ColorEnum.green_2,
                  activeTrackColor: ColorEnum.green_1,
                  inactiveThumbColor: ColorEnum.green_1,
                  inactiveTrackColor: ColorEnum.green_2,
                ),

                SwitchListTile(
                  title: const Text("Sound Call"),
                  value: soundCall,
                  onChanged: (value) {
                    setState(() {
                      soundCall = value;
                    });
                  },
                  activeThumbColor: ColorEnum.green_2,
                  activeTrackColor: ColorEnum.green_1,
                  inactiveThumbColor: ColorEnum.green_1,
                  inactiveTrackColor: ColorEnum.green_2,
                ),

                SwitchListTile(
                  title: const Text("Vibrate"),
                  value: vibrate,
                  onChanged: (value) {
                    setState(() {
                      vibrate = value;
                    });
                  },
                  activeThumbColor: ColorEnum.green_2,
                  activeTrackColor: ColorEnum.green_1,
                  inactiveThumbColor: ColorEnum.green_1,
                  inactiveTrackColor: ColorEnum.green_2,
                ),

                SwitchListTile(
                  title: const Text("Transaction Update"),
                  value: transactionUpdate,
                  onChanged: (value) {
                    setState(() {
                      transactionUpdate = value;
                    });
                  },
                  activeThumbColor: ColorEnum.green_2,
                  activeTrackColor: ColorEnum.green_1,
                  inactiveThumbColor: ColorEnum.green_1,
                  inactiveTrackColor: ColorEnum.green_2,
                ),

                SwitchListTile(
                  title: const Text("Expense Reminder"),
                  value: expenseReminder,
                  onChanged: (value) {
                    setState(() {
                      expenseReminder = value;
                    });
                  },
                  activeThumbColor: ColorEnum.green_2,
                  activeTrackColor: ColorEnum.green_1,
                  inactiveThumbColor: ColorEnum.green_1,
                  inactiveTrackColor: ColorEnum.green_2,
                ),

                SwitchListTile(
                  title: const Text("Budget Notifications"),
                  value: budgetNotifications,
                  onChanged: (value) {
                    setState(() {
                      budgetNotifications = value;
                    });
                  },
                  activeThumbColor: ColorEnum.green_2,
                  activeTrackColor: ColorEnum.green_1,
                  inactiveThumbColor: ColorEnum.green_1,
                  inactiveTrackColor: ColorEnum.green_2,
                ),

                SwitchListTile(
                  title: const Text("Low Balance Alerts"),
                  value: lowBalanceAlerts,
                  onChanged: (value) {
                    setState(() {
                      lowBalanceAlerts = value;
                    });
                  },
                  activeThumbColor: ColorEnum.green_2,
                  activeTrackColor: ColorEnum.green_1,
                  inactiveThumbColor: ColorEnum.green_1,
                  inactiveTrackColor: ColorEnum.green_2,
                ),

              ],
            ),
          ),
        ),
      ],
    );
  }
}