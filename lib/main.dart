import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:prueba2_app/screens/LoginScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Prueba());
}

class Prueba extends StatelessWidget {
  const Prueba({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PABLO ROSERO'),
      ),
      body: Cuerpo(context),
    );
  }
}

// ignore: non_constant_identifier_names
Widget Cuerpo(context) {
  return Container(
    decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(
                'https://img.freepik.com/foto-gratis/collage-fondo-pelicula_23-2149876016.jpg'),
            fit: BoxFit.cover)),
    child: Center(
      child: (Column(
        children: <Widget>[
          const Text("usuario de github palo88"),
          BotonLogin(context),
        ],
      )),
    ),
  );
}

/////////////////////boton1
// ignore: non_constant_identifier_names

// ignore: non_constant_identifier_names
Widget BotonLogin(BuildContext context) {
  return FilledButton(
    onPressed: () {
      irLogin(context);
    },
    child: const Text("Login "),
  );
}

//funcion para navegar
void irLogin(context) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => const Login()));
}
