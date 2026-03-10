import 'package:flutter/material.dart';
import 'package:bank_app/theme/colors_enum.dart';

class SettingsBlockAcctView extends StatefulWidget {
  const SettingsBlockAcctView({Key? key}) : super(key: key);

  @override
  State<SettingsBlockAcctView> createState() => _SettingsBlockAcctViewState();
}

class _SettingsBlockAcctViewState extends State<SettingsBlockAcctView> {
  bool showPass = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Block Account"),
        backgroundColor: ColorEnum.green_1,
      ),
      body: Stack(
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
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Padding(
                        padding: EdgeInsets.only(left: 1),
                        child: Text(
                          "Mensaje Importante",
                          style: TextStyle(
                            fontSize: 30,
                            fontFamily: "OpenSans-Bold"
                          ),
                        ),
                      ),

                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Text(
                        "Al bloquear tu cuenta, se pausarán todas las transacciones salientes, transferencias y pagos con tarjeta hasta que contactes a soporte técnico o reactives tu acceso.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    const SizedBox(height: 25),

                    TextField(
                      obscureText: !showPass,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: ColorEnum.green_4,
                        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(showPass ? Icons.visibility : Icons.visibility_off),
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                          onPressed: () {
                            setState(() {
                              showPass = !showPass;
                            });
                          },
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    // BOTON YES
                    Center(
                      child: SizedBox(
                        width: 200, // ancho del botón
                        height: 45, // alto del botón
                        child: ElevatedButton(
                          onPressed: () {
                            // acción del botón
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorEnum.green_2, // color fondo
                            foregroundColor: ColorEnum.white_1, // color texto
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25), // botón circular
                            ),
                          ),
                          child: const Text(
                            "Block",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    // BOTON CANCEL
                    SizedBox(
                      width: 200,
                      height: 45,
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Cancel"),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}