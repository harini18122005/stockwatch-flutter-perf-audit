# StockWatch — Flutter Performance Audit 🚀

A comprehensive performance sub-optimization and fixing project, built to demonstrate expertise in Flutter engineering and performance profiling.

## 📊 Project Scope
This project aims to bridge the gap between "working code" and "performant code." Using the **StockWatch** app as a testbed, we intentionally introduced, profiled, and fixed 4 major performance anti-patterns commonly found in real-world mobile applications.

### 🔍 What's Inside?
- **Intentional Bugs**: 4 documented performance issues (Memory leaks, UI blocking, Rebuild storms).
- **Profiling Proof**: Raw data captured via Flutter DevTools.
- **Measurable Fixes**: Code changes that restored the app to 60 FPS.
- **Final Report**: A professional PDF findings report summarizing the results.

---

## 📂 Repository Structure
```
stockwatch-flutter-perf-audit/
├── lib/                 # Optimized Flutter source code
├── docs/                # Audit documentation
│   ├── performance_report.pdf   # 📄 Final findings (PDF)
│   ├── performance_report.md    # Markdown version of the report
│   ├── profiling_notes.md       # Raw profiling numbers (Before/After)
│   └── screenshots/             # DevTools evidence captures
└── README.md
```

---

## 🛠️ Performance Fixes Applied

1.  **Lazy Loading (Bug 1)**: Replaced standard `ListView` with `ListView.builder` to optimize memory usage by 80%+.
2.  **Thread Optimization (Bug 2)**: Moved heavy computations out of the `build()` method and into `initState()` to eliminate UI thread blocking.
3.  **State Management (Bug 3)**: Eliminated a "rebuild storm" by removing `setState` from a high-frequency scroll listener.
4.  **Widget Caching (Bug 4)**: Applied `const` constructors to static UI elements to reduce unnecessary widget recreation cycles.

---

## 📈 View the Findings
The complete audit results, including before/after comparison tables and screenshot evidence, can be found in the official report:

👉 **[Download Performance Audit Report (PDF)](docs/performance_report.pdf)**

---

## 🚀 How to Run
1.  **Clone the repo**: `git clone https://github.com/harini18122005/stockwatch-flutter-perf-audit.git`
2.  **Install dependencies**: `flutter pub get`
3.  **Run in Profile Mode**: `flutter run --profile`
4.  **Connect DevTools**: Open the Performance and Memory tabs to verify the optimizations.

---

## 🎓 Key Learnings
This project provided deep experience with:
- Reading Flame Charts and Memory Graphs in **Flutter DevTools**.
- Understanding the Flutter rendering pipeline (Element vs RenderObject).
- Writing clean, production-ready Dart code following performance best practices.
- Documentation and technical reporting for engineering audits.

---

### 💼 Career Context
*Built by a Flutter Performance Engineering Intern candidate as part of the technical assessment for 5paisa Capital.*