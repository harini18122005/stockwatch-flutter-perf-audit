/// Model class for a Stock
class Stock {
  final String name;
  final String symbol;
  final double price;
  final double change;
  final bool isUp;

  const Stock({
    required this.name,
    required this.symbol,
    required this.price,
    required this.change,
    required this.isUp,
  });
}

/// Hardcoded list of fake Indian stocks for the app
final List<Stock> fakeStocks = [
  const Stock(name: "Reliance Industries", symbol: "RELIANCE", price: 2450.75, change: 1.23, isUp: true),
  const Stock(name: "Tata Consultancy Services", symbol: "TCS", price: 3210.40, change: -0.85, isUp: false),
  const Stock(name: "HDFC Bank", symbol: "HDFCBANK", price: 1650.20, change: 0.45, isUp: true),
  const Stock(name: "Infosys", symbol: "INFY", price: 1420.15, change: -1.10, isUp: false),
  const Stock(name: "ICICI Bank", symbol: "ICICIBANK", price: 940.60, change: 2.15, isUp: true),
  const Stock(name: "Hindustan Unilever", symbol: "HINDUNILVR", price: 2580.00, change: -0.30, isUp: false),
  const Stock(name: "State Bank of India", symbol: "SBIN", price: 580.45, change: 1.50, isUp: true),
  const Stock(name: "Bharti Airtel", symbol: "BHARTIARTL", price: 870.30, change: 0.10, isUp: true),
  const Stock(name: "Bajaj Finance", symbol: "BAJFINANCE", price: 7100.00, change: -2.45, isUp: false),
  const Stock(name: "Larsen & Toubro", symbol: "LT", price: 2350.90, change: 0.80, isUp: true),
  const Stock(name: "ITC Limited", symbol: "ITC", price: 440.15, change: 0.25, isUp: true),
  const Stock(name: "Kotak Mahindra Bank", symbol: "KOTAKBANK", price: 1850.50, change: -0.60, isUp: false),
  const Stock(name: "Adani Enterprises", symbol: "ADANIENT", price: 2420.00, change: 3.20, isUp: true),
  const Stock(name: "Axis Bank", symbol: "AXISBANK", price: 970.40, change: -0.15, isUp: false),
  const Stock(name: "Maruti Suzuki", symbol: "MARUTI", price: 9600.75, change: 1.05, isUp: true),
  const Stock(name: "Sun Pharmaceutical", symbol: "SUNPHARMA", price: 1050.20, change: 0.55, isUp: true),
  const Stock(name: "Titan Company", symbol: "TITAN", price: 3020.40, change: -1.40, isUp: false),
  const Stock(name: "Asian Paints", symbol: "ASIANPAINT", price: 3180.00, change: -0.90, isUp: false),
  const Stock(name: "Tata Steel", symbol: "TATASTEEL", price: 115.60, change: 0.70, isUp: true),
  const Stock(name: "Mahindra & Mahindra", symbol: "M&M", price: 1450.30, change: 1.20, isUp: true),
  const Stock(name: "Wipro", symbol: "WIPRO", price: 390.45, change: -0.45, isUp: false),
  const Stock(name: "NTPC Limited", symbol: "NTPC", price: 190.20, change: 0.15, isUp: true),
  const Stock(name: "Power Grid Corp", symbol: "POWERGRID", price: 250.75, change: -0.20, isUp: false),
  const Stock(name: "UltraTech Cement", symbol: "ULTRACEMCO", price: 8200.00, change: 0.35, isUp: true),
  const Stock(name: "Bajaj Finserv", symbol: "BAJAJFINSV", price: 1540.60, change: -1.15, isUp: false),
];
