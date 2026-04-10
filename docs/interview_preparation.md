# Interview Preparation: StockWatch Performance Audit

This guide prepares you for your technical interview at 5paisa Capital. Be ready to explain your work using the **STAR** method (Situation, Task, Action, Result).

---

## 🔝 60-Second Project Summary
> "I built a project called **StockWatch** where I performed a deep-dive performance audit. I intentionally introduced 4 major performance anti-patterns—like UI thread blocking and memory spikes—to see how they impact a real mobile app. I then used Flutter DevTools to profile the impact, captured evidence, and applied industry-standard fixes. For example, by switching to `ListView.builder`, I reduced the app's idle memory footprint by significantly as only visible widgets were built. I documented the entire process in a professional PDF report which is available in my GitHub repository."

---

## ❓ Common Interview Questions & Model Answers

### Q1: What is "Jank" in Flutter and how did you identify it?
**Model Answer**: "Jank happens when the UI thread takes longer than 16ms to produce a frame, causing the FPS to drop below 60. In my project, I identified jank using the **Performance Tab** in DevTools. I looked for 'red bars' in the flame chart, which indicated frames that missed their deadline. Specifically, in Bug 2, a heavy loop in the build method was causing consistent 100ms+ frames."

### Q2: What's the difference between `ListView` and `ListView.builder`?
**Model Answer**: "`ListView` builds all its children at once, regardless of visibility. This is fine for 5 items, but for my 100-item stock list, it caused a memory spike. `ListView.builder` uses a 'lazy loading' approach, building only the items that are visible or near-visible. This keeps memory usage low and constant."

### Q3: Why should you avoid heavy computation in the `build()` method?
**Model Answer**: "The `build()` method is called frequently (e.g., on every animation frame or state change). If it contains expensive logic, it blocks the UI thread from completing the frame on time. In my audit, I fixed this by moving a 1-million iteration loop into `initState()`, ensuring it runs only once per screen."

### Q4: When is `setState()` dangerous for performance?
**Model Answer**: "`setState()` tells Flutter to rebuild the entire widget and its subtree. In my project, I had a scroll listener calling `setState()` on every pixel movement. This created a 'rebuild storm'—rebuilding the whole list 60 times a second even when nothing changed visually. I fixed this by removing the unnecessary call entirely."

### Q5: What do `const` constructors actually do?
**Model Answer**: "They allow Flutter to perform **Element caching**. When a widget is marked `const`, Flutter knows it can never change. Instead of destroying and recreating the widget during a rebuild, Flutter just reuses the existing instance from memory. This saves CPU time and reduces the garbage collector's workload."

---

## 🧠 Technical Concepts to Know
- **The Three Trees**: Widget → Element → RenderObject.
- **UI vs Raster Thread**: UI thread does the 'math' (Dart), Raster thread does the 'drawing' (Skia/Impeller).
- **Profile Mode**: Why we use it (AOT compilation, no debug overhead) to get real numbers.

---

## 🗣️ What to Say When You Don't Know
"That's a great question. I haven't encountered that specific scenario in this project, but based on my understanding of the Flutter rendering pipeline, I would approach it by... [explain your logical thought process]. I would also use DevTools to verify my assumption."

---

## 🙋 Questions for the Interviewer
1.  "How does the team at 5paisa handle performance monitoring for production apps? Do you use automated profiling tools?"
2.  "What are the most common performance challenges your team faces with high-frequency data updates like stock tickers?"

---

> [!IMPORTANT]
> **Pro Tip**: Keep VS Code and DevTools open during the interview. If they ask a deep question, offer to **share your screen** and show them the Flame Chart from your audit. This shows extreme confidence in your tools!
