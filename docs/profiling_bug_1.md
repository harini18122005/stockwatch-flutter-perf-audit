# Profiling Bug 1: ListView vs ListView.builder

Now that you're connected to DevTools, let's catch our first performance bug!

## 🕵️ The Mission
We need to prove that using a standard `ListView` instead of `ListView.builder` is hurting our app. Remember, `ListView` loads all 100 items at once, while `builder` only loads what's on screen.

## 🚶 Step-by-Step Profiling

1.  **Navigate to Tab**: In DevTools, go to the **Memory** tab.
2.  **Start Recording**: Click the **"Record"** button (or the circle icon) to start tracking memory.
3.  **Trigger the Bug**:
    *   On your emulator, go to the **Markets** screen.
    *   Scroll from the top to the very bottom as fast as you can.
4.  **Observe the Spike**: Look at the memory graph. You'll see a sudden jump (spike) in the blue line (RSS Memory) as soon as the screen loads.
5.  **Check Rebuild Counts**:
    *   Switch to the **Widget Inspector** tab.
    *   Enable **"Track widget rebuilds"**.
    *   Notice that the rebuild count for `StockTile` immediately jumps to **100** before you even start scrolling!

---

## 📸 What "Bad" Looks Like

*   **Memory Tab**: Instead of a smooth, flat line, you see a massive mountain-like spike when you enter the Markets screen.
*   **Widget Inspector**: You'll see a number `100` next to the `StockTile` widget in the statistics pane. In a clean app, this number should only be `10-12` (the number of tiles actually visible on your screen).

---

## 📝 Numbers Recording Template
Fill this in for your report:

```text
Bug 1 — Before Fix
Widgets built on load : [FILL IN] (Expected: 100)
Initial Memory Step  : [FILL IN] MB
Frame build time     : [FILL IN] ms
Dropped frames       : [FILL IN]
```

---

## 💡 Simple Explanation

*   **Why it happens**: `ListView` is like a greedy waiter who brings 100 plates of food even if you only ordered 5.
*   **The Cost**: It wastes RAM (memory) and CPU time building widgets that the user can't even see yet.
*   **The Feel**: On an older phone, the app would freeze for a second before showing the list.
