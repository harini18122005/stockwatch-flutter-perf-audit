import 'package:flutter/material.dart';
import '../data/fake_stocks.dart';

/// A reusable widget to display a single stock's information in a list.
/// Shows the name, symbol, price, and percentage change.
class StockTile extends StatelessWidget {
  final Stock stock;
  final VoidCallback onTap;

  const StockTile({
    super.key,
    required this.stock,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // ✅ FIX 4: Added const constructors to prevent unnecessary rebuilds
    // 💡 WHY IT WORKS: 
    // Small widgets like EdgeInsets, TextStyle, and SizedBox never change.
    // By adding 'const', Flutter 'remembers' them and never has to rebuild them 
    // from scratch, saving CPU cycles on every frame!

    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      
      // Stock Name and Symbol
      title: Text(
        stock.name,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      subtitle: Text(
        stock.symbol,
        style: TextStyle(
          color: Colors.grey[600],
          fontSize: 14,
        ),
      ),
      
      // Stock Price and Change Badge
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Current Price
          Text(
            '₹${stock.price.toStringAsFixed(2)}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 4),
          
          // Change Percentage Badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: stock.isUp ? Colors.green[100] : Colors.red[100],
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              '${stock.isUp ? '+' : ''}${stock.change.toStringAsFixed(2)}%',
              style: TextStyle(
                color: stock.isUp ? Colors.green[800] : Colors.red[800],
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
