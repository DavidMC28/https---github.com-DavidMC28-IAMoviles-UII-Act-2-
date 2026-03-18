import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AbarrotesScreen(),
    );
  }
}

class AbarrotesScreen extends StatelessWidget {
  const AbarrotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Definimos el degradado en una constante para no repetir código
    const LinearGradient miDegradado = LinearGradient(
      colors: [Color(0xFFFF5F6D), Color(0xFFFFC371), Color(0xFF33D391)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );

    final List<Map<String, String>> items = [
      {'titulo': 'Shop', 'subtitulo': 'Tienda en línea'},
      {'titulo': 'Entrega', 'subtitulo': 'Seguimiento de pedidos'},
      {'titulo': 'Frituras', 'subtitulo': 'Snacks y botanas'},
      {'titulo': 'Comida', 'subtitulo': 'Alimentos preparados'},
    ];

    final Map<String, String> imageMap = {
      'Shop': 'https://raw.githubusercontent.com/DavidMC28/imagenes-para-flutter-6to-I-11-feb-2026/refs/heads/main/img1.PNG',
      'Entrega': 'https://raw.githubusercontent.com/DavidMC28/imagenes-para-flutter-6to-I-11-feb-2026/main/img2.PNG',
      'Frituras': 'https://raw.githubusercontent.com/DavidMC28/imagenes-para-flutter-6to-I-11-feb-2026/main/img3.PNG',
      'Comida': 'https://raw.githubusercontent.com/DavidMC28/imagenes-para-flutter-6to-I-11-feb-2026/main/img4.PNG',
    };

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
          // --- ENCABEZADO ---
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 50, bottom: 20),
            decoration: const BoxDecoration(gradient: miDegradado),
            child: const Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_cart, color: Colors.black),
                  SizedBox(width: 8),
                  Text(
                    'ABARROTES DSM',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // --- LISTA DE TARJETAS ---
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 3,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              image: NetworkImage(imageMap[items[index]['titulo']!]!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              items[index]['titulo']!,
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                            ),
                            Text(
                              items[index]['subtitulo']!,
                              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          // --- FOOTER (Pie de página agregado) ---
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 15),
            decoration: const BoxDecoration(gradient: miDegradado),
            child: const Center(
              child: Text(
                'David Macias 6ºI',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}