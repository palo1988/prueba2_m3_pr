import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:prueba2_app/main.dart';
import 'package:prueba2_app/screens/LoginScreen.dart';

void main() {
  runApp(Registro());
}

class Registro extends StatelessWidget {
  const Registro({super.key});

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
  // Controladores para los campos de texto

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro'),
      ),
      body: Cuerpo(context),
    );
  }
}

final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
final TextEditingController _nicknameController = TextEditingController();

Widget Cuerpo(context) {
  return Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: NetworkImage(
            'https://media.istockphoto.com/id/1566653954/es/foto/manos-sosteniendo-tablillas-haciendo-cine-de-video-en-el-estudio-claqueta-de-producci%C3%B3n-de.jpg?s=612x612&w=0&k=20&c=B7JoPct1gkPTnEuhC5lKvHG79HOzQm6ulyLZ9LyeVec='),
        fit: BoxFit.cover,
      ),
    ),
    child: Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 16),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Correo Electrónico',
                filled: true,
                fillColor: Colors.white70,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Contraseña',
                filled: true,
                fillColor: Colors.white70,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              obscureText: true,
            ),
            SizedBox(height: 16),
            TextField(
              controller: _nicknameController,
              decoration: InputDecoration(
                labelText: 'Nickname',
                filled: true,
                fillColor: Colors.white70,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              obscureText: true,
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                registro(context);
                guardar();
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Registro Exitoso"),
                      content: Text("Correo: ${_emailController.text}"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Prueba()));
                          },
                          child: Text("OK"),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Registrarse'),
            ),
          ],
        ),
      ),
    ),
  );
}

Future<void> registro(context) async {
  try {
    // ignore: unused_local_variable
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    );
    Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }
}

Future<void> guardar() async {
  DatabaseReference ref =
      FirebaseDatabase.instance.ref("users/" + _nicknameController.text);

  await ref.set({
    "nick": _nicknameController.text,
    "email": _emailController.text,
  });
}
