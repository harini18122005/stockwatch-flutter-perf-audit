# StockWatch — Performance Profiling Notes (Before Fix)

This document contains the performance data and evidence collected during the profiling session on Day 3. These findings represent the "Before" state of the application.

---

## 📊 Summary Comparison Table

| Bug # | Type | Key Metric (Before) | Observation |
|---|---|---|---|
| 1 | ListView (List) | [FILL IN] MB RAM | Loads 100 tiles immediately |
| 2 | Heavy build() (CPU) | [FILL IN] ms UI Thread | Heavy loop blocks navigation |
| 3 | setState (Rebuilds) | [FILL IN] FPS | Scrolling triggers rebuild storm |
| 4 | No const (RAM/CPU) | [FILL IN] Rebuilds | Missing optimizations at scale |

---

## 🐛 Bug 1 — ListView Issue
*   **The Problem**: Using standard `ListView` instead of `ListView.builder`.
*   **Proof (Numbers)**:
    *   Total widgets built on load: [FILL IN] (Goal: 100)
    *   Memory RSS at launch: [FILL IN] MB
*   **Screenshot**: `screenshots/bug1_memory_spike.png`
*   **Observation**: [WRITE YOUR NOTES HERE]

---

## 🐛 Bug 2 — Heavy build() Issue
*   **The Problem**: 1,000,000 iteration loop inside `StockDetailScreen.build`.
*   **Proof (Numbers)**:
    *   UI Thread blocking time: [FILL IN] ms
    *   Total frame time: [FILL IN] ms
*   **Screenshot**: `screenshots/bug2_flamechart_cpu.png`
*   **Observation**: [WRITE YOUR NOTES HERE]

---

## 🐛 Bug 3 — setState Issue
*   **The Problem**: Full-screen `setState` on every pixel scrolled.
*   **Proof (Numbers)**:
    *   Average FPS while scrolling: [FILL IN]
    *   Dropped frames in 5s: [FILL IN]
*   **Screenshot**: `screenshots/bug3_fps_drop.png`
*   **Observation**: [WRITE YOUR NOTES HERE]

---

## 🐛 Bug 4 — No const Issue
*   **The Problem**: Rebuilding static widgets due to missing `const`.
*   **Proof (Numbers)**:
    *   Total rebuilds in 5s scroll: [FILL IN]
    *   StockTile specific rebuilds: [FILL IN]
*   **Screenshot**: `screenshots/bug4_rebuild_count.png`
*   **Observation**: [WRITE YOUR NOTES HERE]

---

## 🧠 Overall Observations
[WRITE YOUR GENERAL SUMMARY OF THE PROFILING EXPERIENCE HERE]
