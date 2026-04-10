# 🗓️ Day 3 — Profile the Buggy App Using Flutter DevTools
### Format: RTC ROS | Total Prompts: 7

> **Day 3 Goal:** Open Flutter DevTools, profile all 4 bugs one by one, capture before screenshots, and record exact numbers (FPS, rebuild count, frame time). These numbers are your PROOF for the final report.

---
---

# 🔵 PROMPT 1 OF 7 — DevTools Setup & First Launch

---

## 🎭 ROLE
You are a **Flutter DevTools expert and performance profiling mentor**.
You guide beginner Flutter developers through setting up Flutter DevTools for the first time.
You explain every button, tab, and number in DevTools in very simple language — like explaining to someone who has never used a profiling tool before.

---

## 📋 TASK
Help me **set up and launch Flutter DevTools** correctly for profiling my StockWatch app.
I need to run my app in **profile mode** (not debug mode) and connect DevTools to it so I can start catching performance bugs.

---

## 🧩 CONTEXT
- I have a Flutter app called **StockWatch** with 4 intentional performance bugs added on Day 2
- I am on **VS Code** with Flutter plugin installed
- I have an **Android emulator** running
- I have never used Flutter DevTools for performance profiling before
- I need to capture screenshots of performance problems for my internship report

---

## 📏 RULES
1. Explain the difference between **debug mode** and **profile mode** in simple terms
2. Show the exact terminal command to run the app in profile mode
3. Show how to open DevTools from VS Code AND from the terminal (both ways)
4. Explain what each DevTools tab does in one line each
5. Tell me which tabs I will use today and which ones to ignore
6. Include screenshots descriptions of what I should see when DevTools opens correctly

---

## 📤 OUTPUT

### Output 1 — Why Profile Mode Matters
- Simple explanation: debug mode vs profile mode vs release mode
- Why profiling in debug mode gives wrong/fake numbers

### Output 2 — Commands to Run
```bash
# Exact commands to type in terminal
```
- Step by step: how to run app in profile mode
- How to open DevTools from terminal
- How to open DevTools from VS Code

### Output 3 — DevTools Tab Guide
A simple table:

| Tab | What it does | Use today? |
|---|---|---|
| Performance | Frame chart, FPS | ✅ Yes |
| Widget Inspector | Rebuild counter | ✅ Yes |
| Memory | RAM usage | ✅ Yes |
| CPU Profiler | Thread usage | ✅ Yes |
| Network | API calls | ❌ No |
| Logging | Console logs | ❌ No |

### Output 4 — Verify DevTools is Working
- Tell me exactly what I should see on screen to confirm DevTools is connected properly
- What the green/grey status indicators mean

---

## 🎨 STYLE
- Simple, step-by-step instructions
- Every terminal command in a code block
- No jargon without explanation
- Tone: patient, encouraging, like a senior dev sitting next to me

---
---

# 🔵 PROMPT 2 OF 7 — Profile Bug 1 (ListView loads all items)

---

## 🎭 ROLE
You are a **Flutter performance profiling expert**.
You specialize in identifying memory and rendering issues caused by unoptimized list widgets.
You guide beginners through reading Flutter DevTools flame charts and memory graphs.

---

## 📋 TASK
Guide me step by step to **profile Bug 1** in my StockWatch app.

**Bug 1:** `stock_list_screen.dart` uses `ListView` instead of `ListView.builder`, which loads all 100 stock tiles into memory at once — even tiles not visible on screen.

---

## 🧩 CONTEXT
- My app is already running in profile mode and DevTools is connected
- Bug 1 is in `stock_list_screen.dart` — the stock list loads all 100 items at once
- I need to capture: memory usage, frame build time, number of widgets built
- I will use these numbers in my final findings report

---

## 📏 RULES
1. Tell me exactly which DevTools tab to go to first
2. Give me the exact user action to trigger the bug (scroll the list fast, open the screen, etc.)
3. Tell me exactly what to look for on screen (red bars, high numbers, etc.)
4. Tell me how to take a screenshot of the proof inside DevTools
5. Give me a template to fill in my numbers:
   ```
   Bug 1 — Before Fix
   Widgets built on load : ___
   Memory usage          : ___ MB
   Frame build time      : ___ ms
   Dropped frames        : ___
   ```
6. Explain WHY these numbers are bad in simple terms

---

## 📤 OUTPUT

### Output 1 — Step by Step Profiling Instructions for Bug 1
Numbered steps — exactly what to click, where to look, what to record

### Output 2 — What Bad Looks Like
Description of what the flame chart / memory graph looks like when this bug is present
(Example: "You will see a tall spike at the start — that is Flutter building all 100 tiles at once")

### Output 3 — Numbers Recording Template
Fill-in template for Bug 1 before-fix numbers

### Output 4 — Simple Explanation
3 bullet points: why this bug happens, what it costs, what the user feels

---

## 🎨 STYLE
- Step by step numbered instructions
- Use arrow notation for navigation: `DevTools → Memory tab → Record`
- Explain every number in plain English
- Tone: clear, calm, educational

---
---

# 🔵 PROMPT 3 OF 7 — Profile Bug 2 (Heavy computation in build())

---

## 🎭 ROLE
You are a **Flutter CPU performance expert**.
You specialize in identifying UI thread blocking issues using Flutter DevTools CPU Profiler and Performance tabs.
You explain flame charts to beginners in the simplest possible way.

---

## 📋 TASK
Guide me step by step to **profile Bug 2** in my StockWatch app.

**Bug 2:** `stock_detail_screen.dart` has a loop of 1,000,000 iterations running inside the `build()` method. This blocks the UI thread every time the screen rebuilds, causing jank and slow screen transitions.

---

## 🧩 CONTEXT
- DevTools is already open and connected
- Bug 2 is in `stock_detail_screen.dart`
- Trigger: tap any stock in the list → detail screen opens slowly
- I need to capture: frame build time, UI thread time, CPU usage spike
- These numbers go into my internship findings report

---

## 📏 RULES
1. Tell me to use the **Performance tab** AND the **CPU Profiler tab** for this bug
2. Explain how to start and stop a recording in DevTools
3. Tell me the exact action to trigger the bug (tap the stock, go back, tap again)
4. Explain what a **flame chart** is in 2 simple sentences before showing how to read it
5. Tell me what "UI thread" and "Raster thread" mean in simple words
6. Give me the numbers template to fill in

---

## 📤 OUTPUT

### Output 1 — What is a Flame Chart (Simple Explanation)
2–3 sentences max, beginner friendly

### Output 2 — Step by Step Profiling for Bug 2
Exact numbered steps — record → trigger → stop → read

### Output 3 — Reading the Flame Chart
- What the tall orange/red bars mean
- Where to find the "heavy computation" loop in the chart
- How to identify which function is eating the most time

### Output 4 — Numbers Recording Template
```
Bug 2 — Before Fix
Screen transition time : ___ ms
UI thread frame time   : ___ ms
Jank frames            : ___
CPU spike              : ___%
```

### Output 5 — Simple Explanation
3 bullets: why build() is the wrong place for heavy work, what it costs, what the user feels

---

## 🎨 STYLE
- Use simple analogies (example: "the flame chart is like a receipt showing which function spent the most time")
- Every step numbered
- Navigation shown as: `DevTools → CPU Profiler → Record`
- Tone: patient mentor explaining to a first-timer

---
---

# 🔵 PROMPT 4 OF 7 — Profile Bug 3 (setState on every scroll)

---

## 🎭 ROLE
You are a **Flutter widget rebuild optimization expert**.
You specialize in identifying unnecessary `setState` calls and widget rebuild storms using Flutter DevTools Widget Inspector and Performance tab.

---

## 📋 TASK
Guide me step by step to **profile Bug 3** in my StockWatch app.

**Bug 3:** `stock_list_screen.dart` calls `setState(() {})` on every scroll event via a `ScrollController`. This triggers a full-screen rebuild on every single frame while scrolling — even though nothing on the screen has actually changed.

---

## 🧩 CONTEXT
- DevTools is connected
- Bug 3 is in `stock_list_screen.dart` — scroll the stock list to trigger it
- I need to capture: rebuild count, FPS while scrolling, dropped frames
- The Widget Inspector has a "rebuild count" feature I need to use today

---

## 📏 RULES
1. Show me how to enable **"Track widget rebuilds"** in Widget Inspector
2. Tell me to scroll the list fast for 5 seconds to trigger the bug
3. Show me where the rebuild count number appears in DevTools
4. Tell me to check the **Performance tab** simultaneously for dropped frames
5. Explain what "60 FPS" means and why dropping below it feels bad to the user
6. Give me the numbers template

---

## 📤 OUTPUT

### Output 1 — Enable Widget Rebuild Tracking
Step by step: how to turn on rebuild tracking in Widget Inspector

### Output 2 — Step by Step Profiling for Bug 3
Exact steps: scroll → observe → record numbers

### Output 3 — What Bad Looks Like
- What you see in Widget Inspector when setState is called too often
- What the FPS graph looks like during heavy scrolling with this bug

### Output 4 — Numbers Recording Template
```
Bug 3 — Before Fix
Rebuilds per scroll session : ___
Average FPS while scrolling : ___
Dropped frames (5 sec)      : ___
Frame build time (avg)      : ___ ms
```

### Output 5 — Simple Explanation
3 bullets: what setState does, why calling it every frame is wrong, what the user feels

---

## 🎨 STYLE
- Use a simple analogy for setState (example: "calling setState every scroll is like repainting your entire house every time you open a window")
- Step by step numbered
- Tone: clear and friendly

---
---

# 🔵 PROMPT 5 OF 7 — Profile Bug 4 (No const constructors)

---

## 🎭 ROLE
You are a **Flutter widget tree optimization expert**.
You specialize in const widget optimization and helping developers understand how Flutter's rendering pipeline works.

---

## 📋 TASK
Guide me step by step to **profile Bug 4** in my StockWatch app.

**Bug 4:** All `const` constructors have been removed from `StockTile` widget. This means Flutter cannot cache any part of the widget — it rebuilds every single sub-widget from scratch on every frame, even widgets that never change (like icons, static text, containers).

---

## 🧩 CONTEXT
- DevTools is connected
- Bug 4 is in `stock_tile.dart` — affects all 100 tiles in the list
- This bug is subtle — the app doesn't feel very different but DevTools shows many extra rebuilds
- I need to use Widget Inspector to see the rebuild count difference

---

## 📏 RULES
1. Explain what `const` does in Flutter in 2 simple sentences before the steps
2. Show how Widget Inspector rebuild count looks different with vs without `const`
3. Tell me to scroll the list and observe total rebuild count
4. Explain why this bug matters even if the user can't feel it
5. Give me the numbers template
6. This is the most subtle bug — tell me what to look for carefully

---

## 📤 OUTPUT

### Output 1 — What const Does (Simple Explanation)
2 sentences max — explain like I am 16 years old

### Output 2 — Step by Step Profiling for Bug 4
Exact steps to measure rebuild count with no const

### Output 3 — What to Look For
- Which number in Widget Inspector shows the problem
- How to compare "expected rebuilds" vs "actual rebuilds"

### Output 4 — Numbers Recording Template
```
Bug 4 — Before Fix
Total widget rebuilds (5 sec scroll) : ___
StockTile rebuild count              : ___
Expected rebuild count (with const)  : ___
Difference                           : ___
```

### Output 5 — Simple Explanation
3 bullets: what const saves, what happens without it, why it matters at scale

---

## 🎨 STYLE
- Use the analogy: "const is like a photo — Flutter takes a photo of the widget once and reuses it instead of redrawing it every time"
- Step by step numbered
- Tone: encouraging — this is the hardest bug to see, reassure the student

---
---

# 🔵 PROMPT 6 OF 7 — Capture All Screenshots & Organize Evidence

---

## 🎭 ROLE
You are a **technical documentation expert** who helps engineers organize profiling evidence into a clean, structured format ready for a findings report.

---

## 📋 TASK
Help me **organize all the profiling data I collected** from Bugs 1–4 into a single structured evidence file. I will use this as the input for my final PDF report tomorrow (Day 4).

---

## 🧩 CONTEXT
- I have profiled all 4 bugs using Flutter DevTools
- I have numbers filled into each bug's template
- I have screenshots saved on my computer
- I need to organize everything into one clean markdown file called `profiling_notes.md`
- This file will be in my `docs/` folder in the GitHub repo

---

## 📏 RULES
1. Create a clean markdown template for `docs/profiling_notes.md`
2. One section per bug — with fields for: numbers, screenshot filename, observation notes
3. Include a "Summary Comparison Table" at the top showing all 4 bugs side by side
4. Include a section for "My Observations" — free text where I write what I noticed
5. Leave placeholder text like `[FILL IN YOUR NUMBER HERE]` so I can complete it
6. File must be beginner-friendly — clear headings, no technical jargon

---

## 📤 OUTPUT

### Output 1 — Complete `docs/profiling_notes.md` template

With this structure:
```
# StockWatch — Performance Profiling Notes (Before Fix)
## Summary Table (all 4 bugs)
## Bug 1 — ListView Issue
## Bug 2 — Heavy build() Issue
## Bug 3 — setState Issue
## Bug 4 — No const Issue
## Overall Observations
```

### Output 2 — Screenshot Naming Convention
Tell me exactly what to name each screenshot file so it's organized:
```
screenshots/
├── bug1_memory_spike.png
├── bug2_flamechart_cpu.png
├── bug3_fps_drop.png
├── bug4_rebuild_count.png
```

### Output 3 — Day 3 Git Commit Message
The exact commit message to use when pushing today's work:
```bash
git add .
git commit -m "..."
git push
```

---

## 🎨 STYLE
- Clean markdown with emoji section headers
- All placeholder text in `[SQUARE BRACKETS]`
- Tone: organized, professional, like a senior engineer reviewing your notes

---
---

# 🔵 PROMPT 7 OF 7 — Day 3 Review & Day 4 Preparation

---

## 🎭 ROLE
You are a **Flutter performance engineering mentor** doing an end-of-day review with a student.
You check that the student has completed everything correctly and help them prepare for the next day.

---

## 📋 TASK
Review my Day 3 work and help me prepare for **Day 4 — Fixing all bugs and measuring improvements**.

---

## 🧩 CONTEXT
- I have completed profiling all 4 bugs
- I have filled in `docs/profiling_notes.md` with my numbers and screenshots
- Tomorrow I will fix all 4 bugs and re-profile to get "after" numbers
- I am building this for a Flutter performance engineering internship

---

## 📏 RULES
1. Give me a **Day 3 Checklist** to verify everything is done
2. Give me a **preview of Day 4** — what exactly I will do tomorrow
3. Tell me the 4 fixes I will apply tomorrow (one per bug) — just names, no code yet
4. Tell me what "before vs after" comparison will look like
5. Give me one tip to make Day 4 go faster

---

## 📤 OUTPUT

### Output 1 — ✅ Day 3 Complete Checklist
```
[ ] App ran in profile mode without crashing
[ ] DevTools connected successfully
[ ] Bug 1 profiled — numbers recorded
[ ] Bug 2 profiled — numbers recorded
[ ] Bug 3 profiled — numbers recorded
[ ] Bug 4 profiled — numbers recorded
[ ] 4 screenshots saved with correct names
[ ] profiling_notes.md filled in and saved
[ ] Changes committed to GitHub
```

### Output 2 — 👀 Day 4 Preview
What happens tomorrow — fixing bugs + re-profiling for "after" numbers

### Output 3 — The 4 Fixes (Names Only)
| Bug | Fix Name |
|---|---|
| Bug 1 | Switch back to ListView.builder |
| Bug 2 | Move computation outside build() |
| Bug 3 | Remove setState from scroll listener |
| Bug 4 | Add const constructors back |

### Output 4 — One Power Tip for Day 4
A single most important tip to make tomorrow's profiling faster and more accurate

---

## 🎨 STYLE
- Checklist format for Output 1
- Encouraging, motivating tone — student is almost done!
- Keep it short and energizing — Day 3 was heavy work, end on a high note

---

# 🏁 Day 3 Complete — You Did the Hard Part!

> By end of Day 3 you have:
> - ✅ Profiled 4 real bugs using industry-standard tools
> - ✅ Captured proof with screenshots and numbers
> - ✅ Written structured profiling notes
> - ✅ Done what actual performance engineers do at companies like 5paisa

> Tomorrow: Fix everything. Measure the improvement. See the numbers go green. 🚀