import 'package:flutter/material.dart';
import 'package:bank_app/features/dashboard/bottomBar/widget/bottomBar.dart';
import 'package:bank_app/theme/colors_enum.dart';
import 'package:bank_app/l10n/app_localizations.dart';
import 'package:bank_app/core/utils/locale_notifier.dart';

class SettingsPreferencesView extends StatefulWidget {
  const SettingsPreferencesView({Key? key}) : super(key: key);

  @override
  State<SettingsPreferencesView> createState() => _SettingsPreferencesViewState();
}

class _SettingsPreferencesViewState extends State<SettingsPreferencesView> {
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
    final loc = AppLocalizations.of(context)!;
    return AppBar(
      title: Text(loc.preferences),
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
    final loc = AppLocalizations.of(context)!;
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
              mainAxisAlignment: MainAxisAlignment.start,
              
              children: [

                SwitchListTile(
                  title: Text(loc.general_notifications),
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
                  title: Text(loc.sound),
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

                DropdownButtonLenguage(),

              ],
            ),
          ),
        ),
      ],
    );
  }
}


class DropdownButtonLenguage extends StatefulWidget {
  const DropdownButtonLenguage({super.key});

  @override
  State<DropdownButtonLenguage> createState() => _DropdownButtonLenguageState();
}

class _DropdownButtonLenguageState extends State<DropdownButtonLenguage> {
  final Map<String, String> _idiomas = {
    'es': 'Español',
    'en': 'English',
  };

  String? _opcionSeleccionada;

  @override
  void initState() {
    super.initState();
    _opcionSeleccionada = localeNotifier.value.languageCode;
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return SizedBox(
      width: double.infinity,
      
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: ColorEnum.green_2,
            width: 1,
          ),
        ),

        child: DropdownButton<String>(
          isExpanded: true,
          value: _opcionSeleccionada,
          hint: Text(loc.select_language),
          icon: const Icon(Icons.arrow_drop_down),
          underline: const SizedBox(),
          items: _idiomas.entries.map((entry){
            return DropdownMenuItem<String>(
              value: entry.key,
              child: Text(entry.value),
            );
          }).toList(),
          onChanged: (String? nuevoValor){
            setState((){
              _opcionSeleccionada = nuevoValor;
            });
            if (nuevoValor != null) {
              localeNotifier.value = Locale(nuevoValor);
            }
          },
        ),
      ),
    );
  }
}