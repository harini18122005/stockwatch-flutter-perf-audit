# 🗓️ Day 4 — Fix All Bugs + Final Report + Project Complete
### Format: RTC ROS | Total Prompts: 10

> **Day 4 Goal:** Fix all 4 performance bugs one by one, re-profile each fix to get "after" numbers, write the final PDF findings report, update GitHub, and prepare your interview answer. By end of today — project is 100% complete.

---
---

# 🔵 PROMPT 1 OF 10 — Fix Bug 1 (ListView → ListView.builder)

---

## 🎭 ROLE
You are an **expert Flutter performance engineer**.
You fix real-world Flutter performance issues with clean, production-ready code.
You explain every fix clearly — what changed, why it works, and what improvement to expect.

---

## 📋 TASK
Help me **fix Bug 1** in my StockWatch Flutter app.

**Bug 1 (current bad code):**
`stock_list_screen.dart` uses `ListView` which loads all 100 stock tiles into memory at once — even items not visible on screen.

**Fix to apply:**
Replace `ListView` with `ListView.builder` so Flutter only builds tiles that are currently visible on screen (lazy loading).

---

## 🧩 CONTEXT
- My app is called StockWatch — a fake stock portfolio tracker
- I am fixing this bug to compare before/after performance metrics
- After fixing, I will re-profile in Flutter DevTools to get "after" numbers
- I am a beginner Flutter developer — explain the fix clearly
- File to change: `lib/screens/stock_list_screen.dart`

---

## 📏 RULES
1. Show the **full updated file** — not just the changed lines
2. Mark the fix clearly with `// ✅ FIX 1: Using ListView.builder for lazy loading`
3. Remove the old bug comment `// 🐛 BUG 1:` and replace with the fix comment
4. Keep Bug 3 (setState scroll) still present — fix only Bug 1 today in this step
5. Add a comment explaining HOW `ListView.builder` works in simple English
6. Show a side-by-side comparison of bad vs good code in comments
7. After the code, explain the fix in 4 simple bullet points

---

## 📤 OUTPUT

### Output 1 — Before vs After (Code Comparison)
```dart
// 🐛 BEFORE (Bad)
ListView(
  children: stocks.map((s) => StockTile(stock: s)).toList(),
)

// ✅ AFTER (Fixed)
ListView.builder(
  itemCount: stocks.length,
  itemBuilder: (context, index) => StockTile(stock: stocks[index]),
)
```

### Output 2 — Full Updated `lib/screens/stock_list_screen.dart`
Complete file with Fix 1 applied, Bug 3 still present

### Output 3 — Simple Explanation (4 bullets)
Why this fix works, what changes in memory, what the user now experiences

### Output 4 — What to Expect in DevTools After This Fix
- Which numbers should go down
- Approximately how much improvement to expect

---

## 🎨 STYLE
- Full file in a dart code block
- Fix clearly marked with ✅ comment
- Explanation in simple English — no jargon
- Tone: clear and encouraging

---
---

# 🔵 PROMPT 2 OF 10 — Fix Bug 2 (Heavy computation out of build())

---

## 🎭 ROLE
You are an **expert Flutter UI performance engineer**.
You specialize in fixing UI thread blocking issues by moving expensive work out of the widget build cycle.

---

## 📋 TASK
Help me **fix Bug 2** in my StockWatch app.

**Bug 2 (current bad code):**
`stock_detail_screen.dart` has a loop of 1,000,000 iterations running inside the `build()` method — blocking the UI thread every single time the widget rebuilds.

**Fix to apply:**
Move the computation to `initState()` so it runs only once when the screen loads, not on every rebuild.

---

## 🧩 CONTEXT
- File to change: `lib/screens/stock_detail_screen.dart`
- The heavy loop was: `for (int i = 0; i < 1000000; i++) { total += i * 0.001; }`
- After the fix, tapping a stock should feel instant — no delay on screen open
- I will re-profile this in DevTools after fixing

---

## 📏 RULES
1. Show the **full updated file**
2. Move computation to `initState()` and store result in a variable
3. Mark fix with `// ✅ FIX 2: Moved heavy computation to initState()`
4. Explain what `initState()` is and when it runs — in 2 simple sentences
5. Show the bad version vs good version as a comment comparison
6. Explain why `build()` can be called many times but `initState()` runs only once

---

## 📤 OUTPUT

### Output 1 — Before vs After (Code Comparison)
Bad build() version vs good initState() version

### Output 2 — Full Updated `lib/screens/stock_detail_screen.dart`
Complete file with Fix 2 applied

### Output 3 — Simple Explanation (4 bullets)
What initState is, why build() is the wrong place, what the user now experiences

### Output 4 — What to Expect in DevTools After This Fix
Which flame chart bars disappear, how transition time improves

---

## 🎨 STYLE
- Full file in dart code block
- Fix clearly marked
- Simple analogy: "build() is like a chef cooking every time someone looks at the menu — initState() cooks once and keeps it ready"
- Tone: clear and educational

---
---

# 🔵 PROMPT 3 OF 10 — Fix Bug 3 (Remove setState from scroll listener)

---

## 🎭 ROLE
You are an **expert Flutter state management and rendering engineer**.
You specialize in eliminating unnecessary widget rebuilds caused by misused `setState` calls.

---

## 📋 TASK
Help me **fix Bug 3** in my StockWatch app.

**Bug 3 (current bad code):**
`stock_list_screen.dart` has a `ScrollController` that calls `setState(() {})` on every scroll event — forcing the entire screen to rebuild on every single frame while scrolling, even though nothing on screen actually changes.

**Fix to apply:**
Remove the unnecessary `setState` call from the scroll listener entirely. If scroll position is needed for UI (like a "scroll to top" button), use a more targeted approach that doesn't rebuild the whole screen.

---

## 🧩 CONTEXT
- File to change: `lib/screens/stock_list_screen.dart`
- This file also had Fix 1 applied in the previous step — keep that fix
- After this fix, scrolling the stock list should be buttery smooth at 60 FPS
- I will re-profile scrolling in DevTools after this fix

---

## 📏 RULES
1. Show the **full updated file** with both Fix 1 and Fix 3 applied
2. Remove the bad scroll listener entirely OR replace with a `ValueNotifier` pattern if scroll position is needed
3. Mark fix with `// ✅ FIX 3: Removed unnecessary setState from scroll listener`
4. Keep `ScrollController` if it's needed for scroll-to-top button — just remove the setState inside it
5. Explain what happens to FPS when setState is removed from scroll
6. After the code, show the before vs after rebuild count as a comment

---

## 📤 OUTPUT

### Output 1 — Before vs After (Code Comparison)
Bad scroll listener vs clean scroll listener

### Output 2 — Full Updated `lib/screens/stock_list_screen.dart`
Complete file with Fix 1 + Fix 3 both applied, cleanly commented

### Output 3 — Simple Explanation (4 bullets)
What setState does to the widget tree, why scroll is the worst place to call it, FPS impact

### Output 4 — What to Expect in DevTools After This Fix
Expected FPS improvement, expected drop in rebuild count per scroll session

---

## 🎨 STYLE
- Full file in dart code block
- Both fixes clearly labeled (✅ FIX 1 and ✅ FIX 3)
- Simple analogy for setState: "Calling setState on scroll is like refreshing your entire browser tab every time you move your mouse"
- Tone: clear and practical

---
---

# 🔵 PROMPT 4 OF 10 — Fix Bug 4 (Add const constructors back)

---

## 🎭 ROLE
You are an **expert Flutter widget optimization engineer**.
You specialize in const widget optimization and helping developers understand Flutter's element tree caching system.

---

## 📋 TASK
Help me **fix Bug 4** in my StockWatch app.

**Bug 4 (current bad code):**
All `const` constructors have been removed from `StockTile` widget in `stock_tile.dart`. Without `const`, Flutter cannot cache any part of the widget tree — so every sub-widget (icons, padding, text styles) is rebuilt from scratch on every frame.

**Fix to apply:**
Add `const` constructors back to all widgets inside `StockTile` that are static and never change — icons, padding, text styles, sized boxes, dividers.

---

## 🧩 CONTEXT
- File to change: `lib/widgets/stock_tile.dart`
- Also check `lib/screens/portfolio_screen.dart` for missing const widgets
- This is the most subtle fix — the user barely feels it but DevTools rebuild count drops significantly
- After fixing, I will compare total rebuild count in Widget Inspector

---

## 📏 RULES
1. Show the **full updated `stock_tile.dart`** with all possible `const` keywords added back
2. Mark with `// ✅ FIX 4: Added const constructors to prevent unnecessary rebuilds`
3. Show a clear comment explaining which widgets CAN be const (static) vs which CANNOT (dynamic — uses stock data)
4. Also show the updated `portfolio_screen.dart` with const fixes
5. Rule of thumb: any widget that doesn't use a variable = can be const
6. After code, list exactly which widgets got const added and why

---

## 📤 OUTPUT

### Output 1 — const Rules (Simple Guide)
```dart
// ✅ CAN be const — never changes
const Icon(Icons.arrow_upward, color: Colors.green)
const SizedBox(height: 8)
const EdgeInsets.all(16)

// ❌ CANNOT be const — uses variable data
Text(stock.name)      // changes per stock
Text('₹${stock.price}') // changes per stock
```

### Output 2 — Full Updated `lib/widgets/stock_tile.dart`
Every possible const keyword added, clearly commented

### Output 3 — Full Updated `lib/screens/portfolio_screen.dart`
const fixes applied here too

### Output 4 — Simple Explanation (4 bullets)
What const saves Flutter from doing, rebuild count impact, why it matters at scale

### Output 5 — What to Expect in DevTools After This Fix
Expected rebuild count reduction in Widget Inspector

---

## 🎨 STYLE
- Full files in dart code blocks
- const additions highlighted with inline comments
- Analogy: "const is like a saved photo — Flutter takes it once and never redraws it"
- Tone: precise and educational

---
---

# 🔵 PROMPT 5 OF 10 — Re-Profile All 4 Fixes (Get After Numbers)

---

## 🎭 ROLE
You are a **Flutter DevTools profiling expert**.
You guide engineers through post-fix profiling to validate that performance improvements are real and measurable.

---

## 📋 TASK
Guide me to **re-profile all 4 fixed bugs** in Flutter DevTools to capture my "after" numbers.
These after numbers + the Day 3 before numbers = my complete before vs after proof for the report.

---

## 🧩 CONTEXT
- All 4 bugs are now fixed
- App is clean and running well
- I need to run the same profiling steps from Day 3 — but now capture the improved numbers
- I will put both before and after numbers into my final report
- Device: Android emulator, VS Code

---

## 📏 RULES
1. Tell me to run the app in **profile mode** again (same as Day 3)
2. For each bug, give me the exact same action to trigger as Day 3 — so the comparison is fair
3. Tell me to fill in the "after" column in my profiling notes
4. Tell me what a "good" number looks like for each metric
5. Tell me what to do if the numbers didn't improve (troubleshooting tips)
6. Give me the complete before vs after comparison table to fill in

---

## 📤 OUTPUT

### Output 1 — Re-Profiling Commands
```bash
flutter run --profile
```
Step by step setup same as Day 3

### Output 2 — Re-Profile Each Bug (4 steps)
For each bug: exact action to trigger + which DevTools tab + what to record

### Output 3 — Complete Before vs After Table Template

| Metric | Bug | Before | After | Improvement |
|---|---|---|---|---|
| Memory on load | Bug 1 | ___ MB | ___ MB | ___ % |
| Screen open time | Bug 2 | ___ ms | ___ ms | ___ ms faster |
| FPS while scrolling | Bug 3 | ___ fps | ___ fps | +___ fps |
| Rebuild count | Bug 4 | ___ | ___ | -___ rebuilds |

### Output 4 — Troubleshooting: What if Numbers Didn't Improve?
3 common reasons why numbers might not change + how to fix each

### Output 5 — How to Know Your Fix Worked
Exact visual signs in DevTools that confirm each bug is fixed

---

## 🎨 STYLE
- Step by step numbered instructions
- Use → arrows for DevTools navigation
- Comparison table clearly formatted
- Tone: methodical and precise — like a QA engineer

---
---

# 🔵 PROMPT 6 OF 10 — Write the Findings Report (Markdown Draft)

---

## 🎭 ROLE
You are a **technical report writing expert** who helps junior engineers write clear, professional performance findings documents.
You write reports that impress senior engineers and interviewers — not overly formal, but structured and evidence-based.

---

## 📋 TASK
Help me write the **complete performance findings report** for my StockWatch Flutter app.
This report will be saved as `docs/performance_report.md` and also converted to PDF.

---

## 🧩 CONTEXT
- I profiled 4 bugs before and after fixing them
- I have screenshots saved in `docs/screenshots/`
- I have before and after numbers from Flutter DevTools
- This report is for my Flutter performance engineering internship at 5paisa Capital
- The report should be professional enough to show in an interview

---

## 📏 RULES
1. Write the **complete `docs/performance_report.md`** file — ready to copy-paste
2. Structure: Cover → Summary → Bug 1 report → Bug 2 → Bug 3 → Bug 4 → Conclusion
3. Each bug section must have: Issue, Root Cause, Fix Applied, Before Metric, After Metric, Screenshot reference
4. Use a standard 4-line finding format for each bug:
   ```
   Issue    : [what was wrong]
   Cause    : [why it happened]
   Fix      : [what was changed]
   Result   : [before → after improvement]
   ```
5. Write in professional but simple English — no overly complex words
6. Use placeholder text `[YOUR NUMBER HERE]` for all metrics (I will fill in my real numbers)
7. Include a "Tools Used" section and a "Key Learnings" section at the end

---

## 📤 OUTPUT

### Output 1 — Complete `docs/performance_report.md`

Full markdown file with this structure:
```
# StockWatch — Flutter Performance Audit Report

## Project Overview
## Tools Used
## Summary of Findings (table of all 4 bugs)
## Bug 1 — ListView Performance Issue
## Bug 2 — Build Method Computation Issue
## Bug 3 — Unnecessary setState Issue
## Bug 4 — Missing const Constructors
## Overall Before vs After Comparison
## Key Learnings
## Conclusion
```

### Output 2 — Summary Table (filled structure)
| Bug | Issue | Fix | Improvement |
|---|---|---|---|

### Output 3 — Key Learnings Section
5 short, genuine learnings a performance engineering intern would actually write

---

## 🎨 STYLE
- Professional markdown — clean headings, tables, code snippets for fixes
- Placeholder text in `[SQUARE BRACKETS]` for all numbers
- Screenshot references like: `![Bug 1 Memory Spike](screenshots/bug1_memory_spike.png)`
- Tone: confident junior engineer who did real work
- Length: detailed but not bloated — 2–3 sentences per section description

---
---

# 🔵 PROMPT 7 OF 10 — Convert Report to PDF

---

## 🎭 ROLE
You are a **technical documentation expert** who helps developers convert markdown reports into clean, professional PDFs.

---

## 📋 TASK
Help me **convert my `docs/performance_report.md` into a PDF** that I can attach to my GitHub repo and show in the interview.

---

## 🧩 CONTEXT
- I have the markdown report ready at `docs/performance_report.md`
- I am on Windows/Mac with VS Code
- I want a clean PDF — not a messy auto-converted one
- The PDF goes in `docs/performance_report.pdf`
- I will also add a link to it in my README

---

## 📏 RULES
1. Give me **3 ways** to convert markdown to PDF — ordered from easiest to best quality
2. For each method, give exact steps
3. Tell me which method gives the most professional-looking output
4. Tell me how to add page numbers and a title to the PDF if possible
5. Tell me how to verify the PDF looks good before submitting

---

## 📤 OUTPUT

### Output 1 — Method 1: VS Code Extension (Easiest)
Step by step using "Markdown PDF" VS Code extension

### Output 2 — Method 2: Pandoc (Best Quality)
```bash
# Install and convert command
pandoc docs/performance_report.md -o docs/performance_report.pdf
```
Step by step with exact commands

### Output 3 — Method 3: GitHub Pages / Online Tool (No install)
Using tools like md2pdf.eu or similar

### Output 4 — PDF Quality Checklist
Things to check before finalizing:
```
[ ] All tables display correctly
[ ] Screenshots are visible
[ ] Headings are properly formatted
[ ] Page numbers present
[ ] Font is readable
```

---

## 🎨 STYLE
- Step by step numbered
- Commands in code blocks
- Tone: practical and direct

---
---

# 🔵 PROMPT 8 OF 10 — Final GitHub Push & Repo Polish

---

## 🎭 ROLE
You are a **senior software engineer and GitHub expert**.
You help junior developers publish clean, professional GitHub repositories that make a strong impression on recruiters and interviewers.

---

## 📋 TASK
Help me **finalize and publish my StockWatch GitHub repo** so it looks professional and complete.
I want the repo to look like the work of a serious intern — not a messy beginner project.

---

## 🧩 CONTEXT
- Repo name: `stockwatch-flutter-perf-audit`
- I have: Flutter code, profiling notes, PDF report, screenshots
- I need to: update README, organize folders, write final commit, check everything
- This repo will be shown during my 5paisa Capital internship interview
- I am a beginner — guide me through every git command

---

## 📏 RULES
1. Give me the **final folder structure** the repo should have
2. Give me the **exact git commands** to commit and push everything
3. Tell me how to update README.md to link to the PDF report
4. Tell me how to add a proper `.gitignore` for Flutter
5. Give me the final commit message (professional, not "final changes lol")
6. Tell me how to add a GitHub repo description and topics (flutter, performance, devtools)
7. Check: what files should NOT be pushed to GitHub (build folder, etc.)

---

## 📤 OUTPUT

### Output 1 — Final Repo Folder Structure
```
stockwatch-flutter-perf-audit/
├── lib/
│   ├── main.dart
│   ├── data/
│   ├── screens/
│   └── widgets/
├── docs/
│   ├── performance_report.md
│   ├── performance_report.pdf
│   ├── profiling_notes.md
│   └── screenshots/
│       ├── bug1_memory_spike.png
│       ├── bug2_flamechart_cpu.png
│       ├── bug3_fps_drop.png
│       └── bug4_rebuild_count.png
├── .gitignore
├── pubspec.yaml
└── README.md
```

### Output 2 — Flutter .gitignore Content
Complete `.gitignore` for Flutter projects

### Output 3 — Final Git Commands
```bash
git add .
git commit -m "..."
git push origin main
```
With professional commit message

### Output 4 — README Update
The exact lines to add to README linking to the PDF report and screenshots

### Output 5 — GitHub Repo Settings
- Description to add
- Topics/tags to add: `flutter`, `performance`, `devtools`, `mobile`, `internship`
- How to add them in GitHub UI

---

## 🎨 STYLE
- All commands in code blocks
- Folder structure as a tree
- Tone: professional, like a senior reviewing your PR before merge

---
---

# 🔵 PROMPT 9 OF 10 — Interview Preparation (Technical Questions)

---

## 🎭 ROLE
You are a **technical interview coach** specializing in mobile performance engineering internship interviews.
You know exactly what interviewers at fintech companies like 5paisa Capital ask candidates about Flutter performance.
You help candidates answer confidently using the STAR method (Situation → Task → Action → Result).

---

## 📋 TASK
Prepare me for the **Round 2 Technical Interview** for the Flutter Performance Engineer Intern role at 5paisa Capital by:
1. Giving me the most likely interview questions about this project
2. Giving me strong, confident answers based on what I built
3. Coaching me on how to explain my DevTools profiling work

---

## 🧩 CONTEXT
- I built StockWatch — a Flutter app with 4 intentional performance bugs that I profiled and fixed
- I used: Flutter DevTools, Performance tab, CPU Profiler, Widget Inspector
- I have a PDF findings report and a GitHub repo
- I am a beginner — this is my first real performance engineering project
- Interview is online, technical, 30–45 minutes

---

## 📏 RULES
1. Give me **8 likely interview questions** — mix of conceptual and project-based
2. For each question, give a **strong model answer** based specifically on my StockWatch project
3. Use the STAR format for project questions (Situation, Task, Action, Result)
4. For conceptual questions, give a simple clear definition + one example from my project
5. Tell me what to say when I don't know an answer
6. Give me 2 questions I should ask the interviewer at the end

---

## 📤 OUTPUT

### Output 1 — 8 Likely Interview Questions with Model Answers

**Q1: Tell me about your project.**
**Q2: What is jank in Flutter and how did you identify it?**
**Q3: What is the difference between ListView and ListView.builder?**
**Q4: Why should you avoid heavy computation in the build() method?**
**Q5: What is Flutter DevTools and which tabs did you use?**
**Q6: What is setState and when should you NOT use it?**
**Q7: What are const constructors and why do they improve performance?**
**Q8: What was your biggest learning from this project?**

### Output 2 — What to Say When You Don't Know
A confident, honest script for when you're asked something you don't know

### Output 3 — 2 Questions to Ask the Interviewer
Smart questions that show you are interested in performance engineering

### Output 4 — 60-Second Project Summary (Memorize This)
A single polished paragraph to say when they ask "Tell me about your project" — use exact numbers from your DevTools profiling

---

## 🎨 STYLE
- Each Q&A clearly separated
- Model answers in quotes or a box — ready to read and memorize
- STAR format clearly labeled for project questions
- Tone: confident, humble, genuine — not over-rehearsed

---
---

# 🔵 PROMPT 10 OF 10 — Final Project Completion Review

---

## 🎭 ROLE
You are a **senior Flutter performance engineer and mentor** doing the final review of a student's internship project.
You check that everything is complete, professional, and interview-ready.
You give honest feedback and a final score.

---

## 📋 TASK
Do a **complete final review** of my StockWatch project and confirm it is 100% ready for the 5paisa Capital internship interview.

---

## 🧩 CONTEXT
- I completed the project over 4 days
- Day 1: Built clean Flutter app
- Day 2: Added 4 performance bugs
- Day 3: Profiled bugs with Flutter DevTools
- Day 4: Fixed all bugs, re-profiled, wrote report, published GitHub repo
- I have: working app, profiling notes, PDF report, clean GitHub repo, interview answers ready

---

## 📏 RULES
1. Give me the **complete 4-day project checklist** — every deliverable from all 4 days
2. Rate my project readiness out of 10 — and what would make it a 10/10
3. Tell me the 3 most impressive things about this project from an interviewer's perspective
4. Tell me if there is anything I should add or improve before the interview
5. Give me a final motivational summary — what I actually learned and achieved

---

## 📤 OUTPUT

### Output 1 — Complete 4-Day Checklist
```
DAY 1 ✅
[ ] Flutter app created with 3 screens
[ ] Fake stock data with 20+ stocks
[ ] ListView.builder, navigation, bottom nav working
[ ] Code pushed to GitHub

DAY 2 ✅
[ ] Bug 1 added — ListView loads all items
[ ] Bug 2 added — Heavy loop in build()
[ ] Bug 3 added — setState on every scroll
[ ] Bug 4 added — No const constructors
[ ] All bugs marked with 🐛 comments
[ ] App still runs after bugs

DAY 3 ✅
[ ] App profiled in profile mode
[ ] Bug 1 profiled — numbers recorded
[ ] Bug 2 profiled — flame chart captured
[ ] Bug 3 profiled — FPS drop recorded
[ ] Bug 4 profiled — rebuild count recorded
[ ] 4 screenshots saved
[ ] profiling_notes.md filled in

DAY 4 ✅
[ ] Bug 1 fixed — ListView.builder restored
[ ] Bug 2 fixed — computation moved to initState
[ ] Bug 3 fixed — setState removed from scroll
[ ] Bug 4 fixed — const constructors added back
[ ] All 4 bugs re-profiled for after numbers
[ ] performance_report.md written
[ ] performance_report.pdf generated
[ ] GitHub repo published and clean
[ ] README links to PDF report
[ ] Interview answers prepared
```

### Output 2 — Project Readiness Score
X / 10 with specific feedback on what makes it strong

### Output 3 — Top 3 Impressive Things
From an interviewer's perspective — what stands out

### Output 4 — Final Motivational Summary
What the student actually learned and achieved in 4 days — genuine and specific

---

## 🎨 STYLE
- Checklist format with emoji
- Honest, direct score with reasoning
- Final summary should feel genuine and earned — not generic
- Tone: proud mentor sending a student into their interview with full confidence

---

# 🏆 PROJECT COMPLETE — StockWatch Flutter Performance Audit

> In 4 days you went from zero to:
> - ✅ A real Flutter app with 3 screens
> - ✅ 4 real performance bugs — profiled with industry tools
> - ✅ 4 fixes with measurable before/after proof
> - ✅ A professional findings report (PDF)
> - ✅ A clean GitHub repo an interviewer can open right now
> - ✅ Confident answers to technical interview questions
>
> You didn't just build a project.
> You did exactly what performance engineers do at companies like 5paisa every day. 🚀