import 'package:flutter/material.dart';

void main() {
  runApp(Historial());
}

class Historial extends StatelessWidget {
  const Historial({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Historial Cta",
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
        title: const Text('Historial'),
      ),
      body: Cuerpo(),
    );
  }
}

Widget Cuerpo() {
  // Información de ejemplo de las transacciones
  final List<Map<String, String>> transactions = [
    {
      'beneficiary': 'Juan Pérez',
      'amount': '\$100.00',
      'date': '2024-06-01',
    },
    {
      'beneficiary': 'María López',
      'amount': '\$200.00',
      'date': '2024-06-10',
    },
    {
      'beneficiary': 'Carlos Sánchez',
      'amount': '\$150.00',
      'date': '2024-06-12',
    },
  ];

  return Stack(
    children: [
      // Imagen de fondo
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://img.freepik.com/vector-gratis/concepto-ahorrar-dinero_52683-7986.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
      // Lista de transacciones
      ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          final transaction = transactions[index];
          return Card(
            margin: const EdgeInsets.all(10.0),
            child: ListTile(
              leading: Icon(Icons.monetization_on, color: Colors.green),
              title: Text('Beneficiario: ${transaction['beneficiary']}'),
              subtitle: Text('Fecha: ${transaction['date']}'),
              trailing: Text(
                transaction['amount']!,
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    ],
  );
}
