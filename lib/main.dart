import 'package:flutter/material.dart';
import 'database/data.dart'; // Twój plik z AppDatabase

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final db = AppDatabase();
  runApp(MyApp(database: db));
}

class MyApp extends StatelessWidget {
  final AppDatabase database;
  const MyApp({super.key, required this.database});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drift Inspector Demo',
      home: HomeScreen(database: database),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final AppDatabase database;
  const HomeScreen({super.key, required this.database});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Test Plan Manager')),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final count = await (database.select(database.users)).get();
            debugPrint('Users in db: ${count.length}');
          },
          child: const Text('Ping DB'),
        ),
      ),
    );
  }
}
