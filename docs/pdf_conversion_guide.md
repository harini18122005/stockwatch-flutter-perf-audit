# How to Convert Your Report to PDF

To share your performance audit with your interviewers or attach it to your GitHub repository, you should convert `docs/performance_report.md` into a professional-looking PDF.

Here are 3 ways to do it, ordered from easiest to highest quality.

---

## 🟢 Method 1: VS Code Extension (Easiest)
1.  Open VS Code.
2.  Go to the **Extensions** view (Ctrl+Shift+X).
3.  Search for and install **"Markdown PDF"** (by yyzhang).
4.  Open `docs/performance_report.md`.
5.  Press `F1` (or Ctrl+Shift+P) and type `Markdown PDF: Export (pdf)`.
6.  A PDF will be generated in the same folder.

---

## 🔵 Method 2: Pandoc (Highest Quality)
If you want total control over fonts and page numbers, use Pandoc (requires installation).

1.  **Install Pandoc**: [Download here](https://pandoc.org/installing.html).
2.  **Install MiKTeX** (for PDF support): [Download here](https://miktex.org/download).
3.  Run this command in your terminal:
    ```bash
    pandoc docs/performance_report.md -o docs/performance_report.pdf --variable geometry:margin=1in --variable mainfont="Arial" --toc
    ```
- **Pro**: Automatically creates a Table of Contents and adds page numbers.

---

## 🟡 Method 3: Online Tools (No Install)
If you don't want to install anything:
1.  Go to [md2pdf.eu](https://md2pdf.eu/) or [CloudConvert](https://cloudconvert.com/md-to-pdf).
2.  Upload your `performance_report.md`.
3.  Download the result.

---

## ✅ PDF Quality Checklist
Before submitting, open your PDF and check:
- [ ] **Formatting**: Are all the tables properly aligned?
- [ ] **Links**: Do the GitHub and screenshot links work?
- [ ] **Images**: Are the screenshots from `docs/screenshots/` showing up clearly?
- [ ] **Page Breaks**: Are there any headings at the very bottom of a page without content?
- [ ] **Clarity**: Is the font size easy to read for an interviewer?

---

> [!TIP]
> Once your PDF is ready, name it `StockWatch_Performance_Audit.pdf` and place it in the `docs/` folder. This makes it very easy for interviewers to find!
