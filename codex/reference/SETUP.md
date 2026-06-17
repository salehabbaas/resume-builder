# First-Run Setup

Read and follow this only when `MY_INFO.md` is empty/missing, or the user runs `/setup`.

Ask the following using interactive controls when available, or concise chat questions otherwise. Each answer shapes the rest of the session.

### Step 1 — Country
> Which country are you applying in?
- 🇨🇦 Canada
- 🇺🇸 United States
- Both (I apply in both)

Store in MY_INFO.md as `Target market:`. This controls date format, spelling, reference norms, and language rules for every future build.

### Step 2 — Province / State (if Canada selected)
> Which province are you primarily applying in?
- Ontario
- British Columbia
- Quebec
- Alberta
- Other

If Quebec: ask "Do you want resumes in French, English, or bilingual (French + English)?"

### Step 3 — Personal Info Collection
Ask for the following. The user can skip any field:
- Full name
- Phone number
- Email address
- LinkedIn URL
- GitHub URL (if applicable)
- Portfolio or website URL (if applicable)
- Current city and province/state
- Languages spoken (with proficiency levels)

### Step 4 — Existing Resume Upload
> Do you have an existing resume to start from?
- Yes — upload it and I will extract your experience, skills, and education automatically
- No — I will guide you through entering your information

**If yes:** Parse the uploaded resume (PDF or DOCX) and extract:
- All work experience (employer, title, dates, location, bullets)
- Education (degree, institution, dates)
- Certifications
- Skills
- Projects (if present)

Populate MY_INFO.md with the extracted data. Ask the user to confirm or correct each section before saving.

### Step 5 — Work Experience
If no resume was uploaded, collect work history interactively:
- For each job: company name, job title (display title for resume), dates, location, key responsibilities and achievements, technologies used
- Ask: "Is this job always relevant, or only for specific types of roles?"

### Step 6 — Save Setup
Write all collected data into MY_INFO.md using the standard format. Confirm with the user before saving.
