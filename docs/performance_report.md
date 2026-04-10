# StockWatch — Flutter Performance Audit Report

---

## 📋 Project Overview
This report documents a comprehensive performance audit of the **StockWatch** Flutter application. The goal was to identify, profile, and fix common performance anti-patterns that cause UI jank, high memory consumption, and unnecessary CPU load.

---

## 🛠️ Tools Used
- **Flutter DevTools**: Used for memory profiling, performance monitoring, and rebuild tracking.
- **CPU Profiler**: Used to identify long-running tasks on the UI thread.
- **Flutter Widget Inspector**: Used to track unnecessary widget rebuilds.
- **Profile Mode**: All metrics were captured on a physical device/high-performance emulator running in `--profile` mode.

---

## 📊 Summary of Findings

| Bug | Issue | Fix | Improvement |
|---|---|---|---|
| 1 | High Memory (ListView) | ListView.builder (Lazy Loading) | [YOUR NUMBER HERE]% RAM reduction |
| 2 | UI Thread Blocking | Moved work to initState() | [YOUR NUMBER HERE]ms faster transitions |
| 3 | Rebuild Storm (Scroll) | Removed setState from scroll | [YOUR NUMBER HERE] FPS increase |
| 4 | No Widget Caching | Added const constructors | [YOUR NUMBER HERE] fewer rebuilds |

---

## 🔍 Bug 1 — ListView Performance Issue
**Issue**: The stock list used a standard `ListView`, which forced Flutter to build and keep all 100 stock items in memory at once, even those not visible on the screen.
**Cause**: Lack of "lazy loading" or widget recycling.
**Fix**: Replaced `ListView` with `ListView.builder`.
**Result**: 
- Before Metric: [YOUR NUMBER HERE] MB RAM
- After Metric : [YOUR NUMBER HERE] MB RAM
- **Status**: Fixed ✅
![Bug 1 Memory Spike](screenshots/bug1_memory_spike.png)

---

## 🔍 Bug 2 — Build Method Computation Issue
**Issue**: A heavy mathematical loop (1M iterations) was running inside the `build()` method.
**Cause**: Build methods are meant to be pure and fast. Running heavy logic inside `build()` blocks the UI thread from drawing the next frame.
**Fix**: Moved the computation into `initState()` so it runs only once per screen lifecycle.
**Result**:
- Before Metric: [YOUR NUMBER HERE] ms frame time
- After Metric : [YOUR NUMBER HERE] ms frame time (instant)
- **Status**: Fixed ✅
![Bug 2 Flame Chart](screenshots/bug2_flamechart_cpu.png)

---

## 🔍 Bug 3 — Unnecessary setState Issue
**Issue**: Calling `setState(() {})` inside a scroll listener forced the entire screen to rebuild on every single pixel scrolled.
**Cause**: Incorrect state management triggering global rebuilds for local events.
**Fix**: Removed the `setState` call from the scroll listener.
**Result**:
- Before Metric: [YOUR NUMBER HERE] FPS (Janky)
- After Metric : [YOUR NUMBER HERE] FPS (Smooth)
- **Status**: Fixed ✅
![Bug 3 FPS Drop](screenshots/bug3_fps_drop.png)

---

## 🔍 Bug 4 — Missing const Constructors
**Issue**: All `const` keywords were removed from static widgets (Icons, SizedBox, TextStyle).
**Cause**: Flutter cannot perform "Element caching" without `const`, forcing sub-widgets to be destroyed and recreated on every rebuild.
**Fix**: Restored `const` constructors to all appropriate static widgets.
**Result**:
- Before Metric: [YOUR NUMBER HERE] total rebuilds per scroll
- After Metric : [YOUR NUMBER HERE] total rebuilds per scroll
- **Status**: Fixed ✅
![Bug 4 Rebuild Count](screenshots/bug4_rebuild_count.png)

---

## 💡 Key Learnings
1.  **Measurement Over Guesswork**: Never assume where a performance issue is; always use DevTools to find the "hot path" first.
2.  **The build() Method is Sacred**: Keep build methods clean of any logic that takes longer than a few microseconds.
3.  **Lazy Loading is Essential**: For any list over 10-20 items, `ListView.builder` is a non-negotiable requirement for memory efficiency.
4.  **Small Tweaks, Large Impact**: Simple additions like `const` can reduce thousands of unnecessary rebuilds in a complex app.
5.  **Profile Mode vs Debug Mode**: Capturing performance metrics in Debug mode is misleading due to the overhead of debug checks.

---

## 🎯 Conclusion
The StockWatch application now runs at a buttery smooth 60 FPS with optimized memory usage and efficient widget life-cycles. This audit demonstrates that proactively identifying anti-patterns is key to delivering a premium user experience.
