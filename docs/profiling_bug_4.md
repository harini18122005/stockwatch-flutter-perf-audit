# Profiling Bug 4: No const Constructors

This is the most subtle but important bug. We are going to see how `const` helps Flutter skip unnecessary work.

---

## 📸 Analogies
`const` is like a photo. Flutter takes a photo of the widget once and reuses it forever. Without `const`, Flutter has to redraw the entire scene pixel by pixel, even if nothing changed!

---

## 🚶 Step-by-Step Profiling

1.  **Navigate to Tab**: Go to the **Widget Inspector** tab.
2.  **Enable Tracking**: Click **"Track widget rebuilds"**.
3.  **Trigger the Bug**:
    *   On your emulator, go to the Markets list.
    *   Slowly scroll the list.
4.  **Observe the Numbers**:
    *   Look at the "Rebuild Stats" in the right-hand pane of the Widget Inspector.
    *   Notice the number of rebuilds for simple widgets like `Text`, `Padding`, and `SizedBox`.
    *   Even when the stock data hasn't changed, these numbers will keep climbing as you scroll or even when the screen is just "active" (due to Bug 3's setState loop).

---

## 🧐 What to Look For Carefully

*   **Rebuild Count**: In a healthy app, a `Text` widget inside a `StockTile` should only build **once** (when it enters the screen).
*   **The Problem**: Here, you'll see those numbers matching the number of frames rendered. This means Flutter is wasting energy doing the same thing over and over.
*   **Why it matters**: On a phone with a small battery, this bug will make the phone get hot and drain the battery faster.

---

## 📝 Numbers Recording Template
Fill this in for your report:

```text
Bug 4 — Before Fix
Total widget rebuilds (5 sec scroll) : [FILL IN]
StockTile rebuild count              : [FILL IN]
Expected rebuild count (with const)  : [FILL IN]
Difference                           : [FILL IN]
```

---

## 💡 Simple Explanation

*   **The Power of Const**: It's a promise to Flutter: "This widget will never, ever change."
*   **The Cost**: Without it, Flutter is "paranoid" and rebuilds everything just in case something changed.
*   **The Feel**: The user might not "see" the lag on a modern iPhone, but their battery will die 20% faster.
