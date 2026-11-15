# Rolo: a personal contacts app

Rolo is a private web app for the people you meet. For each person you can keep how you met, what they do and fun facts, plus a timeline of every conversation and a list of the news they want to hear from you. Your data lives in your own free Supabase database, and the app is hosted for free on GitHub Pages. It doesn't depend on Claude.

## One-time setup (about 15 minutes)

### 1. Create the database (Supabase)
1. Go to **supabase.com**, sign up, and click **New project**. Choose any name, set a database password (save it somewhere), and pick the region closest to you.
2. When the project is ready, open **SQL Editor → New query**. Paste in all of `setup.sql`, then click **Run**. You should see "Success. No rows returned."
3. Open **Authentication → Sign In / Providers → Email** and turn **off** "Confirm email". This is optional, but it lets you sign in right away without a confirmation link. Since you'll be the only user, that's fine.
4. Open **Project Settings → API** (on newer dashboards this may be **Data API** and **API Keys**). Copy the **Project URL** and the **anon / publishable** key. Do **not** use the `service_role` / secret key.

### 2. Put the app online (GitHub Pages)
1. On github.com, signed in to your own account, click **New repository**. Name it something like `rolo` and make it **Public**. Free GitHub Pages needs a public repo. Your data isn't in the repo, only the app code.
2. Click **uploading an existing file** and drag in all the files from this folder: `index.html`, `manifest.webmanifest`, the three `.png` icons, `setup.sql`, and `README.md`. Then click **Commit changes**.
3. Open **Settings → Pages**. Under "Build and deployment", set Source to **Deploy from a branch**, Branch to **main**, and folder to **/ (root)**, then **Save**.
4. After a minute or two, the site will be live at `https://YOUR-USERNAME.github.io/rolo/`.

### 3. Install it on your iPhone
1. Open that link in **Safari**, tap **Share → Add to Home Screen**, then open Rolo from the new icon.
2. Paste in your Project URL and key, then tap **Connect**.
3. Tap **Create your account** with your email and a password. On your laptop or any other device, open the same link and sign in with the same account.

## Using it
- **+** adds a person. Use the mic on your keyboard to dictate. For someone you met in the past, set "When you met" to an old date (2023-04-10, 2023-04 or 2023 all work).
- **On someone's page**, the timeline holds every catch-up as a dated entry, so nothing gets overwritten. You can date entries in the past.
- **"Keep them in the loop about"** is where you record news they'd want to hear, like your paper, a new job, or a game.
- **The "In the loop" tab**: when something happens, type it (e.g. "paper") to see everyone waiting on that news, text them, and mark them updated.
- **Search** looks through everything: names, companies, schools, sports, how you met, and every note.
- **To iPhone** saves the person as a regular iPhone contact (.vcf).
- **More → Import** brings in many people at once. Tap **Copy the prompt**, paste it plus your messy notes into any AI chat, and paste the JSON it returns back into Rolo.
- **More → Download a backup** saves everything, photos included, as one file. Import that file to restore it.

## Good to know
- **Free Supabase projects pause after about a week with no activity.** Your data is kept. If the app says it can't reach your database, log in to supabase.com and click **Restore project**. Using Rolo regularly keeps the project awake.
- The free tier holds roughly 500 MB, which is far more than tens of thousands of people need. Photos are shrunk to about 30 KB each before upload.
- Download a backup now and then anyway. It's one tap.
