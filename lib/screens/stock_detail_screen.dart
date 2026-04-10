import 'package:flutter/material.dart';
import '../data/fake_stocks.dart';

/// Screen 2: Shows details for a single selected stock.
/// Receives a [Stock] object via the constructor.
class StockDetailScreen extends StatelessWidget {
  final Stock stock;

  const StockDetailScreen({super.key, required this.stock});

  @override
  Widget build(BuildContext context) {
    // 🐛 BUG 2: Heavy computation inside build() method
    // ✅ CLEAN VERSION WAS: No heavy computation in build()
    // Simulate heavy work — runs on every rebuild
    double total = 0;
    for (int i = 0; i < 1000000; i++) {
      total += i * 0.001;
    }
    // We print it just to ensure the compiler doesn't optimize it away
    debugPrint('Computation result: $total');

    // Generate a simple fake price history (10 items)
    final List<double> priceHistory = List.generate(
      10,
      (index) => stock.price - (index * 5.25),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(stock.symbol),
        backgroundColor: Colors.blue[800],
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Stock Header
              Text(
                stock.name,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              
              // Price and Badge Row
              Row(
                children: [
                  Text(
                    '₹${stock.price.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: stock.isUp ? Colors.green[100] : Colors.red[100],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      '${stock.isUp ? '+' : ''}${stock.change.toStringAsFixed(2)}%',
                      style: TextStyle(
                        color: stock.isUp ? Colors.green[800] : Colors.red[800],
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              const Divider(height: 40),

              // Fake Price History Section
              const Text(
                'Price History (Last 10 days)',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              
              // Simple non-scrollable list for history
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: priceHistory.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue[50],
                        child: Text('${index + 1}d'),
                      ),
                      title: Text('Price at Day ${index + 1}'),
                      trailing: Text(
                        '₹${priceHistory[index].toStringAsFixed(2)}',
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
