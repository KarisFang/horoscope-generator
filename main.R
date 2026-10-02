# main.R
# ---------------------------------------------------------------------------
# Run this file to generate a random fortune + cosmic chart.
#   Rscript main.R
#   Rscript main.R Leo          # force a sign
#   Rscript main.R Leo career   # force a sign + category
# ---------------------------------------------------------------------------

source("data/templates.R")
source("R/generate_fortune.R")
source("R/cosmic_chart.R")

args <- commandArgs(trailingOnly = TRUE)
sign <- if (length(args) >= 1) args[[1]] else NULL
category <- if (length(args) >= 2) args[[2]] else NULL

save_fortune_reading(out_dir = "outputs", sign = sign, category = category)
