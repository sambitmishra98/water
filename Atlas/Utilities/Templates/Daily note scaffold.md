---
type: template
up:
---

Scaffold for the daily note `Timeline/Timeline/YYYY-MM-DD.md` used by the
morning-descent / session / evening-reflect triad. Copy everything below the
divider into a fresh daily note, filling `created` and `one-liner`. The
dataviewjs block tables the day's timestamped capture notes (it renders in
Obsidian with Dataview; elsewhere it is inert text and harmless).

Conventions the triad skills follow: the user's own words stand plain in the
body with `^phase-YYMMDD` block ids; ALL LLM-written content goes inside a
`>[!LLM]+ ### LLM` collapsible callout with `####` subheadings; phases are
separated by a `- - -` divider; no em or en dashes; no hard line-wrapping.

---

```
---
created: YYYY-MM-DDTHH:mm
one-liner:
---
```

```dataviewjs
const isoDate = x => {
  if (!x) return null;
  if (typeof x === "string") return x.slice(0, 10);
  if (x.toISODate) return x.toISODate();
  if (x.ts) return window.moment(x.ts).format("YYYY-MM-DD");
  if (x.c) {
    const y = x.c.year;
    const m = String(x.c.month).padStart(2, "0");
    const d = String(x.c.day).padStart(2, "0");
    return `${y}-${m}-${d}`;
  }
  return null;
};

const timeHHMM = x => {
  if (!x) return "";
  if (typeof x === "string") return x.slice(11, 16);
  if (x.toFormat) return x.toFormat("HH:mm");
  if (x.ts) return window.moment(x.ts).format("HH:mm");
  if (x.c) {
    const h = String(x.c.hour ?? 0).padStart(2, "0");
    const m = String(x.c.minute ?? 0).padStart(2, "0");
    return `${h}:${m}`;
  }
  return "";
};

const today =
  isoDate(dv.current().created) ??
  dv.current().file.name;

const pages = dv.pages('"Timeline/Timeline"')
  .where(p => p["created-date"] != null)
  .where(p => isoDate(p["created-date"]) === today)
  .where(p => p.file.path !== dv.current().file.path)
  .sort(p => timeHHMM(p.created), 'asc');

const rows = [];

for (const p of pages) {
  const raw = await dv.io.load(p.file.path) ?? "";
  const body = raw
    .replace(/^---\r?\n[\s\S]*?\r?\n---\r?\n*/, "")
    .trim();
  rows.push([
    p["location-physical"] ?? "",
    timeHHMM(p.created),
    p.physical ?? "",
    p.mental ?? "",
    p.emotional ?? "",
    p["one-liner"] ?? "",
    body.length > 0 ? "Yes" : "No",
    p.file.link
  ]);
}

dv.table(
  ["location", "time", "phy", "men", "emo", "one-liner", "body", "link"],
  rows
);
```

```
## Morning descent
<user's reflection, plain, one paragraph per line> ^reflection-YYMMDD

>[!LLM]+ ### LLM
> #### Direction
> ...
> #### This season
> ...
> #### Where the work actually stands
> ...
> #### Held open
> ...

- - -

### Session

- Me: <the user's ask>
- C: <one or two plain sentences answering it>

>[!LLM]+ ### LLM
> #### ...

- - -

## Evening reflect
<user's closing words, plain> ^evening-YYMMDD

>[!LLM]+ ### LLM
> #### What the day was
> ...
> #### Carried
> ...
> #### Banked
> ...
> #### Released
> ...
```
