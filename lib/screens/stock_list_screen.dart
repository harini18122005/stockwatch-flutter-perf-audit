import 'package:flutter/material.dart';
import '../data/fake_stocks.dart';
import '../widgets/stock_tile.dart';
import 'stock_detail_screen.dart';

/// Screen 1: Shows a scrollable list of all stocks.
/// Includes a basic search bar to filter stocks by name.
class StockListScreen extends StatefulWidget {
  const StockListScreen({super.key});

  @override
  State<StockListScreen> createState() => _StockListScreenState();
}

class _StockListScreenState extends State<StockListScreen> {
  // Local list to hold filtered stocks
  List<Stock> filteredStocks = [];
  final TextEditingController searchController = TextEditingController();

  // 🐛 BUG 3: Calling setState on every scroll event
  // ✅ CLEAN VERSION WAS: Normal scroll behavior (no ScrollController needed for setState)
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // Initially show all stocks
    filteredStocks = fakeStocks;

    // 🐛 BUG 3 Listener: Triggers a rebuild on every single pixel scrolled
    _scrollController.addListener(() {
      setState(() {
        // This empty setState forces the whole widget tree to rebuild 
        // 60-120 times per second during scrolling!
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    searchController.dispose();
    super.dispose();
  }

  /// Filters the stock list based on the user's search query.
  void filterStocks(String query) {
    setState(() {
      filteredStocks = fakeStocks
          .where((stock) =>
              stock.name.toLowerCase().contains(query.toLowerCase()) ||
              stock.symbol.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Markets'),
        backgroundColor: Colors.blue[800],
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: searchController,
              onChanged: filterStocks,
              decoration: InputDecoration(
                hintText: 'Search stocks...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.grey[100],
              ),
            ),
          ),
          // Stock List
          Expanded(
            // 🐛 BUG 1: Using ListView instead of ListView.builder
            // ✅ CLEAN VERSION WAS: ListView.builder (efficiently loads only visible items)
            child: ListView(
              controller: _scrollController,
              children: filteredStocks.map((stock) {
                return StockTile(
                  stock: stock,
                  onTap: () {
                    // Navigate to Detail Screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StockDetailScreen(stock: stock),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
