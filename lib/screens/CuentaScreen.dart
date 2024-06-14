// ignore: unused_import
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prueba2_app/screens/HistorialScreen.dart';

void main() {
  runApp(Cuenta());
}

class Cuenta extends StatelessWidget {
  const Cuenta({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme:
            // ignore: prefer_const_constructors
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 198, 218, 211)),
        useMaterial3: true,
      ),
      home: const Cuerpo(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Cuerpo extends StatefulWidget {
  const Cuerpo({super.key});

  @override
  State<Cuerpo> createState() => _CuerpoState();
}

class _CuerpoState extends State<Cuerpo> {
  int indice = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [Body(context), const Historial()];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Cuenta"),
      ),
      body: screens[indice],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (value) {
          setState(() {
            indice = value;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.login), label: "Cuenta"),
          BottomNavigationBarItem(
              icon: Icon(Icons.app_registration), label: "Historial"),
        ],
      ),
    );
  }
}

Widget Body(context) {
  // Información de ejemplo
  final String accountNumber = '1234567890';
  final double accountValue = 2500.75;

  return Container(
    decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(
                'https://img.freepik.com/vector-gratis/ilustracion-concepto-industria-bancaria_114360-13934.jpg'),
            fit: BoxFit.cover)),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage:
                AssetImage('assets/user_image.png'), // Reemplaza con tu imagen
          ),
          SizedBox(height: 16),
          Text(
            'Número de Cuenta: $accountNumber',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          SizedBox(height: 8),
          Text(
            'Valor Total de la Cuenta: \$${accountValue.toStringAsFixed(2)}',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ],
      ),
    ),
  );
}
