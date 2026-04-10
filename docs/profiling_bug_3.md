# Profiling Bug 3: setState() on every scroll

This is a classic performance killer. We are going to see how frequent `setState` calls can drop your app's FPS (Frames Per Second).

---

## 🏃 Analogies
Calling `setState` on every scroll is like repainting your entire house every time you open a window. It's too much work for something so small!

---

## 🚶 Step-by-Step Profiling

1.  **Navigate to Tab**: Go to the **Widget Inspector** tab first.
2.  **Enable Tracking**: Click **"Track widget rebuilds"** (it might look like a circular graph icon).
3.  **Navigate to Tab**: Now go to the **Performance** tab.
4.  **Trigger the Bug**:
    *   On your emulator, go to the Markets list.
    *   Start scrolling up and down as fast as you can for 5-10 seconds.
5.  **Observe the FPS Graph**: Look at the top graph in the Performance tab.
    *   Notice the green line dropping.
    *   Notice the "Jank" bars (Red/Orange) appearing frequently while you scroll.

---

## 🧐 What "Bad" Looks Like

*   **Widget Inspector**: While you scroll, you'll see the rebuild count for `StockListScreen` and `StockTile` increasing like a crazy stopwatch (thousands of rebuilds in a few seconds).
*   **Performance Tab**: You'll see "60 FPS" drop down to "30 FPS" or even lower. Each of those red bars means a frame was "lost," making the app look like it's lagging.

---

## 📝 Numbers Recording Template
Fill this in for your report:

```text
Bug 3 — Before Fix
Rebuilds per scroll session : [FILL IN]
Average FPS while scrolling : [FILL IN]
Dropped frames (5 sec)      : [FILL IN]
Frame build time (avg)      : [FILL IN] ms
```

---

## 💡 Simple Explanation

*   **What setState does**: It tells Flutter "Trash the old UI and draw it again from scratch."
*   **The Cost**: Doing this 60 times a second (on every pixel scrolled) creates a "rebuild storm" that the CPU can't keep up with.
*   **The Feel**: The user sees the list "jumping" or "stuttering" instead of sliding smoothly.
