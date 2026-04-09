# 📈 StockWatch

## 🚀 Flutter Performance Audit

A Flutter app built to simulate a stock portfolio tracker, then profiled and optimized with Flutter DevTools.

This project focuses on performance engineering: finding jank, removing unnecessary rebuilds, and proving improvements with real before/after metrics. ⚡📱

> 🎓 Built as part of a performance engineering internship project at 5paisa Capital Limited.

---

## 🎯 Project Goal

Build a Flutter app with intentional performance problems, then clean it up with measurable results.

- 🔍 Profile the app using Flutter DevTools
- 🧠 Identify root causes of jank, slow rendering, and wasted rebuilds
- 🛠️ Apply targeted fixes and validate the impact
- 📝 Document everything in a structured report

---

## 📱 App Screens

| Screen | What You See | Emoji Vibe |
|---|---|---|
| 📋 Stock List | Scrollable list of 100 fake stocks with price | 📉➡️📈 |
| 📊 Stock Detail | Tap any stock to view a fake price chart | 💹✨ |
| 💼 Portfolio | Summary of total holdings and value | 🧾💰 |

> All data is hardcoded and fake. No real API calls or financial data are used. 🧪

---

## 🐛 Performance Issues Introduced Before Fixes

| # | Issue | Where | Impact |
|---|---|---|---|
| 1 | `ListView` loads all 100 items at once | 📋 Stock List | High memory use and slow scrolling |
| 2 | `setState` rebuilds the entire screen | 📋 Stock List | Unnecessary widget rebuilds |
| 3 | Heavy computation happens inside `build()` | 📊 Stock Detail | Blocks the UI thread |
| 4 | No `const` constructors used | All screens | Extra rebuilds on every frame |

---

## ✅ Fixes Applied After Optimization

| # | Fix | Result |
|---|---|---|
| 1 | Replaced `ListView` with `ListView.builder` | Only visible items are built 🪄 |
| 2 | Used `ValueNotifier` and targeted updates | Minimal widget rebuilds 🎯 |
| 3 | Moved computation outside `build()` | Smooth frame rendering 🧊 |
| 4 | Added `const` constructors everywhere | Reduced rebuild count ✅ |

---

## 📊 Before vs After Metrics

| Metric | Before | After |
|---|---|---|
| Scroll FPS | ~35 fps | ~60 fps 🚀 |
| Jank frames | 12+ per scroll | 0–1 per scroll ✨ |
| Widget rebuilds per scroll | 100+ | ~10 🎯 |
| Startup time | ~1.8s | ~1.1s ⚡ |

> Metrics were captured using Flutter DevTools → Performance tab → Frame chart. 📈

---

## 🛠️ Tools Used

- 🐦 Flutter — UI framework
- 🔥 Flutter DevTools — Performance profiling, flame chart, widget inspector
- 🎯 Dart — Programming language

---

## 🚀 Getting Started

### 📦 Prerequisites

- Flutter SDK 3.x or above
- Android Studio or VS Code with the Flutter plugin
- A connected device or emulator

### ▶️ Run the App

```bash
git clone https://github.com/your-username/stockwatch-flutter-perf-audit.git
cd stockwatch-flutter-perf-audit
flutter pub get
flutter run
```

### 🔬 Open Flutter DevTools

```bash
flutter run --profile
# In a new terminal:
flutter devtools
```

---

## 📁 Project Structure

```text
lib/
├── main.dart
├── screens/
│   ├── stock_list_screen.dart
│   ├── stock_detail_screen.dart
│   └── portfolio_screen.dart
├── widgets/
│   └── stock_tile.dart
└── data/
    └── fake_stocks.dart
docs/
└── performance_report.pdf   # Before/after findings report
```

---

## 📝 License

This project is for educational and internship purposes only. 📚