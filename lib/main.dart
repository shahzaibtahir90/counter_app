import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

/// Root widget of the application
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App with Persistent Storage',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const CounterPage(),
    );
  }
}

/// Counter page widget - Stateful to manage counter state
class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  // Variable to store the counter value
  int _counter = 0;

  // Late initialization for SharedPreferences instance
  late SharedPreferences _prefs;

  // Key for storing counter in SharedPreferences
  static const String _counterKey = 'counter_value';

  @override
  void initState() {
    super.initState();
    // Load saved counter value when app starts
    _loadCounterValue();
  }

  /// Load counter value from SharedPreferences
  /// If no value exists, default to 0
  Future<void> _loadCounterValue() async {
    try {
      // Initialize SharedPreferences
      _prefs = await SharedPreferences.getInstance();

      // Get the saved counter value (default to 0 if not found)
      final savedCounter = _prefs.getInt(_counterKey) ?? 0;

      // Update UI with loaded value using setState
      setState(() {
        _counter = savedCounter;
      });
    } catch (e) {
      // Handle any errors during loading
      debugPrint('Error loading counter: $e');
    }
  }

  /// Increment counter and save to SharedPreferences
  Future<void> _incrementCounter() async {
    setState(() {
      _counter++;
    });
    // Save the new counter value persistently
    await _prefs.setInt(_counterKey, _counter);
  }

  /// Decrement counter and save to SharedPreferences
  Future<void> _decrementCounter() async {
    setState(() {
      _counter--;
    });
    // Save the new counter value persistently
    await _prefs.setInt(_counterKey, _counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App'),
        centerTitle: true,
        elevation: 2,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Title text
            const Text(
              'Counter Value',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 20),

            // Display counter value in large text
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),

            // Row with increment and decrement buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Decrement button
                FloatingActionButton.extended(
                  onPressed: _decrementCounter,
                  backgroundColor: Colors.red,
                  icon: const Icon(Icons.remove),
                  label: const Text('Decrease'),
                ),
                const SizedBox(width: 20),

                // Increment button
                FloatingActionButton.extended(
                  onPressed: _incrementCounter,
                  backgroundColor: Colors.green,
                  icon: const Icon(Icons.add),
                  label: const Text('Increase'),
                ),
              ],
            ),
            const SizedBox(height: 40),

            // Info text about persistence
            const Text(
              'Value is saved automatically',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
