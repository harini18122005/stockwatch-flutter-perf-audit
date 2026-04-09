import 'package:flutter/material.dart';
import 'screens/stock_list_screen.dart';
import 'screens/portfolio_screen.dart';

void main() {
  runApp(const StockWatchApp());
}

/// The root widget of the StockWatch application.
/// Sets up the theme and initial route.
class StockWatchApp extends StatelessWidget {
  const StockWatchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StockWatch',
      debugShowCheckedModeBanner: false,
      // Modern Fintech Theme: Blue and White
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1565C0), // Colors.blue[800]
          primary: const Color(0xFF1565C0),
        ),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0,
        ),
      ),
      home: const MainScaffold(),
    );
  }
}

/// A scaffold that handles bottom navigation between Market and Portfolio pages.
class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  // Current tab index
  int _selectedIndex = 0;

  // List of screens for navigation
  final List<Widget> _screens = [
    const StockListScreen(), // Markets Screen
    const PortfolioScreen(), // Portfolio Screen
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        selectedItemColor: Colors.blue[800],
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.show_chart),
            label: 'Markets',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: 'Portfolio',
          ),
        ],
      ),
    );
  }
}
