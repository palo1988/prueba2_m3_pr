import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:prueba2_app/screens/CuentaScreen.dart';
import 'package:prueba2_app/screens/RegistroScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Login());
}

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
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
        title: const Text('Login'),
      ),
      body: Cuerpo(context),
    );
  }
}

Widget Cuerpo(BuildContext context) {
  return Stack(
    children: <Widget>[
      Positioned.fill(
        child: Image.network(
          'https://us.123rf.com/450wm/articular/articular1007/articular100700090/7385554-ilustraci%C3%B3n-de-un-tema-musical-con-altavoces-y-cabeza-de-m%C3%BAsica-abstracta-sobre-fondo-de-grunge.jpg?ver=6',
          fit: BoxFit.cover,
        ),
      ),
      Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                "LOGIN",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              campoCorreo(context),
              const SizedBox(height: 10),
              campoContrasenia(context),
              const SizedBox(height: 20),
              BotonLogin(context),
              BotonRegistro(context)
            ],
          ),
        ),
      ),
    ],
  );
}

final TextEditingController _correo = TextEditingController();
final TextEditingController _contrasenia = TextEditingController();

Widget campoCorreo(BuildContext context) {
  return TextField(
    controller: _correo,
    decoration: const InputDecoration(
      hintText: "Ingrese Correo",
      hintStyle: TextStyle(color: Colors.white),
      filled: true,
      fillColor: Colors.black45,
      border: OutlineInputBorder(),
    ),
    style: const TextStyle(color: Colors.white),
  );
}

Widget campoContrasenia(BuildContext context) {
  return TextField(
    controller: _contrasenia,
    decoration: const InputDecoration(
      hintText: "Ingrese Contraseña",
      hintStyle: TextStyle(color: Colors.white),
      filled: true,
      fillColor: Colors.black45,
      border: OutlineInputBorder(),
    ),
    obscureText: true,
    style: const TextStyle(color: Colors.white),
  );
}

Widget BotonLogin(BuildContext context) {
  return ElevatedButton(
    onPressed: () {
      login(context);
    },
    child: const Text("Login"),
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(
        const Color.fromRGBO(12, 12, 236, 0.925),
      ),
    ),
  );
}

Widget BotonRegistro(BuildContext context) {
  return FilledButton(
    onPressed: () {
      irRegistro(context);
    },
    child: const Text("Registro"),
  );
}

//funcion para navegar
void irRegistro(context) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => const Registro()));
}

Future<void> login(BuildContext context) async {
  try {
    // ignore: unused_local_variable
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _correo.text,
      password: _contrasenia.text,
    );

    ///////////////navegacion///////////////
    Navigator.push(context, MaterialPageRoute(builder: (context) => Cuenta()));
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("usuario no encontrado"),
            );
          });
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("password incorrecto"),
            );
          });
    }
  }
}
