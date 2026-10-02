# 🔮 Procedural Cosmic Fortune Generator

A silly little R project that generates a random horoscope-style fortune
from mix-and-match templates, then plots your "cosmic energy" for the day
as a radial chart with `ggplot2` + `coord_polar()`.

```
========================================
  Leo | LUCK
----------------------------------------
Leo, your lucky number is 42 and your
lucky color is electric lavender.
========================================
```

...plus a matching radial chart of your Love / Career / Health / Luck /
Chaos / Charisma levels for the day.

## Install

You'll need R (>= 4.0) and two packages:

```r
install.packages(c("ggplot2", "glue"))
```

## Usage

From the project root:

```bash
Rscript main.R                # random sign, random category
Rscript main.R Leo            # force a sign
Rscript main.R Leo career     # force a sign + category
```

Or interactively in R / RStudio:

```r
source("data/templates.R")
source("R/generate_fortune.R")
source("R/cosmic_chart.R")

fortune <- generate_fortune(sign = "Scorpio")
print_fortune(fortune)
plot_cosmic_chart(fortune)
```

Each run saves a `.png` chart to `outputs/`.

## How it works

- **`data/templates.R`** — word banks (nouns, advice, colors, times) and
  sentence templates per category (love / career / health / luck / chaos),
  filled in with `glue::glue()`.
- **`R/generate_fortune.R`** — picks a sign, category, and template, fills
  it in, and generates random 1–10 "energy levels" across six axes.
- **`R/cosmic_chart.R`** — plots those energy levels as a polar bar chart
  styled like a little astrology poster, and saves it to `outputs/`.

## Make it your own

The fun part is editing `data/templates.R`:

- Add new phrases to any word bank (`cosmic_nouns`, `advice_phrases`, etc.)
- Add a new category by adding a new named entry to the `templates` list
- Add new placeholders by adding new `sample(...)` args inside
  `generate_fortune()` in `R/generate_fortune.R`, then reference them in
  your templates as `{your_placeholder}`

## License

MIT — see [LICENSE](LICENSE).
