# Profiling Bug 2: Heavy Computation in build()

It's time to find out why opening the stock details feels so slow. We are going to use the **Performance** and **CPU Profiler** tabs to see the UI thread being blocked.

---

## 🔥 What is a Flame Chart?
Imagine a receipt from a supermarket. It shows every item you bought and how much it cost. A **Flame Chart** is a receipt for your app's time. It shows every function called and who "spent" the most milliseconds.

*   **Tall bars**: Functions that were called.
*   **Wide bars**: Functions that took a long time to finish.

---

## 🚶 Step-by-Step Profiling

1.  **Navigate to Tab**: Go to the **Performance** tab in DevTools.
2.  **Start Recording**: Click the **"Record"** button.
3.  **Trigger the Bug**:
    *   On your emulator, go to the Markets list.
    *   Tap on any stock (e.g., "Reliance Industries").
    *   Wait for the detail screen to open.
    *   Go back and repeat this 2-3 times.
4.  **Stop Recording**: Click **"Stop"**.
5.  **Analyze the Chart**: Look at the **Timeline Events** pane.

---

## 🧐 Reading the Flame Chart

*   **The UI Thread**: This is the "brain" of your app. If it's busy with a loop, it can't draw the screen.
*   **The Red Bars**: You will see tall, wide red/orange bars in the UI thread section.
*   **Find the Culprit**: Click on one of those wide bars. In the details pane below, look for the function named `StockDetailScreen.build`. You'll see it taking much longer than a few milliseconds.
*   **CPU Profiler**: If you switch to the **CPU Profiler** tab, you'll see a massive percentage of time spent on "double addition" or "multiplication" inside that build function.

---

## 📝 Numbers Recording Template
Fill this in for your report:

```text
Bug 2 — Before Fix
Screen transition time : [FILL IN] ms
UI thread frame time   : [FILL IN] ms
Jank frames (red)      : [FILL IN]
CPU usage during load  : [FILL IN]%
```

---

## 💡 Simple Explanation

*   **The Rule**: The `build()` method should only be for building widgets, not for math or logic.
*   **The Cost**: While the app is doing that 1,000,000 iteration loop, it literally cannot respond to the user's touch.
*   **The Feel**: The user experience feels "sticky" or unresponsive, like walking through mud.
