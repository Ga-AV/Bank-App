import 'package:flutter/material.dart';
import 'package:bank_app/features/dashboard/bottomBar/widget/bottomBar.dart';
import 'package:bank_app/theme/colors_enum.dart';

class TransfersView extends StatefulWidget {
  const TransfersView({ Key? key }) : super(key: key);

  @override
  _TransfersViewState createState() => _TransfersViewState();
}

class _TransfersViewState extends State<TransfersView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopAppBar(),
      body: const BodyTransfers(),
      bottomNavigationBar: BottomNavBar(page: 1),
    );
  }
}

class TopAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TopAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: const Text("Transfers"),
      backgroundColor: ColorEnum.green_1,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class BodyTransfers extends StatelessWidget {
  const BodyTransfers({super.key});

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
          top: 20,
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  color: Colors.black26,
                )
              ],
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // Cuenta origen
                  const Text(
                    "Cuenta origen",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 8),

                  DropdownButtonFormField<String>(
                    items: const [
                      DropdownMenuItem(value: "4551 5667 8886 7775", child: Text("4551 5667 8886 7775")),
                      DropdownMenuItem(value: "4551 5667 8382 1244", child: Text("4551 5667 8382 1244")),
                    ],
                    onChanged: (value) {},
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: ColorEnum.green_4, // color de fondo

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25), // redondeo
                        borderSide: BorderSide.none,
                      ),

                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),

                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(color: Colors.green, width: 2),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Saldo cuenta origen
                  const Text(
                    "Saldo en cuenta origen",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 5),

                  const Text(
                    "Q. 121,000", // tú lo reemplazas
                    style: TextStyle(fontSize: 16),
                  ),

                  const SizedBox(height: 15),

                  const Divider(),

                  const SizedBox(height: 15),

                  // Cuenta destino
                  const Text(
                    "Cuenta destino",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 8),

                  DropdownButtonFormField<String>(
                    items: const [
                      DropdownMenuItem(value: "4981 2567 3409 7824", child: Text("Karen Alvarez")),
                      DropdownMenuItem(value: "2458 7391 6042 9185", child: Text("Marvin Son")),
                      DropdownMenuItem(value: "5127 8934 2651 4098", child: Text("Selene Espadas")),
                      DropdownMenuItem(value: "4551 5667 8382 1244", child: Text("Pedro Castillo")),
                    ],
                    onChanged: (value) {},
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: ColorEnum.green_4, // color de fondo

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25), // redondeo
                        borderSide: BorderSide.none,
                      ),

                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),

                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(color: Colors.green, width: 2),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  TextButton(
                    onPressed: () {},
                    child: const Text("Gestionar cuentas de terceros"),
                  ),

                  const SizedBox(height: 20),

                  // Monto
                  const Text(
                    "Monto a transferir",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 8),

                  TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: ColorEnum.green_4,
                    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                  const SizedBox(height: 30),

                  // Botón transferir
                  Center(
                    child: SizedBox(
                      width: 200,
                      height: 45,
                      child: ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text("Confirmar transferencia"),
                                content: const Text(
                                  "Transferir de cuenta XXX a cuenta YYY",
                                ),
                                actions: [

                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text("Cancelar"),
                                  ),

                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      // aquí ejecutas la transferencia
                                    },
                                    child: const Text("Transferir"),
                                  ),

                                ],
                              );
                            },
                          );
                        },
                        child: const Text("Transferir"),
                      ),
                    ),
                  ),

                ],
              ),
            )
          ),
        ),

      ],
    );
  }
}