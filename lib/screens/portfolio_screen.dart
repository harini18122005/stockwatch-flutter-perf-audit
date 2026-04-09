import 'package:flutter/material.dart';
import '../data/fake_stocks.dart';

/// Screen 3: Shows a summary of the user's current holdings.
/// Calculates total portfolio value based on 5 hardcoded holdings.
class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Hardcoded holdings: 5 stocks with specific quantities
    final List<Map<String, dynamic>> holdings = [
      {'stock': fakeStocks[0], 'quantity': 10}, // Reliance
      {'stock': fakeStocks[2], 'quantity': 25}, // HDFC Bank
      {'stock': fakeStocks[4], 'quantity': 15}, // ICICI Bank
      {'stock': fakeStocks[7], 'quantity': 40}, // Bharti Airtel
      {'stock': fakeStocks[10], 'quantity': 100}, // ITC
    ];

    // Calculate total portfolio value
    double totalValue = 0;
    for (var item in holdings) {
      final Stock stock = item['stock'];
      final int quantity = item['quantity'];
      totalValue += stock.price * quantity;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Portfolio'),
        backgroundColor: Colors.blue[800],
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // Portfolio Summary Card
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.blue[800],
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.blue.withOpacity(0.3),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Total Portfolio Value',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '₹${totalValue.toStringAsFixed(2)}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // Holdings List Header
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              children: [
                Text(
                  'Your Holdings',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // List of Holdings
          Expanded(
            child: ListView.builder(
              itemCount: holdings.length,
              itemBuilder: (context, index) {
                final item = holdings[index];
                final Stock stock = item['stock'];
                final int quantity = item['quantity'];
                final double currentValue = stock.price * quantity;

                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: ListTile(
                    title: Text(
                      stock.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('Qty: $quantity | Symbol: ${stock.symbol}'),
                    trailing: Text(
                      '₹${currentValue.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
