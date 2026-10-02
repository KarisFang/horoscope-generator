# R/generate_fortune.R
# ---------------------------------------------------------------------------
# Turns the word banks in data/templates.R into a fortune, plus a matching
# set of "cosmic energy" levels that get handed off to the plotting code.
# ---------------------------------------------------------------------------

library(glue)

#' Generate a single procedural fortune
#'
#' @param sign Optional zodiac sign to force (e.g. "Leo"). Random if NULL.
#' @param category Optional category to force ("love", "career", "health",
#'   "luck", "chaos"). Random if NULL.
#' @param seed Optional integer seed, for reproducible fortunes.
#' @return A list with sign, category, text, and energy (named numeric vector)
generate_fortune <- function(sign = NULL, category = NULL, seed = NULL) {
  if (!is.null(seed)) set.seed(seed)

  if (is.null(sign)) sign <- sample(zodiac_signs, 1)
  if (is.null(category)) category <- sample(names(templates), 1)

  template <- sample(templates[[category]], 1)

  text <- glue::glue(
    template,
    sign   = sign,
    noun   = sample(cosmic_nouns, 1),
    advice = sample(advice_phrases, 1),
    color  = sample(lucky_colors, 1),
    number = sample(1:99, 1),
    time   = sample(times_of_day, 1)
  )

  list(
    sign     = sign,
    category = category,
    text     = as.character(text),
    energy   = generate_energy_levels()
  )
}

#' Generate random "cosmic energy" levels used for the radial chart
#'
#' @return A named numeric vector, values 1-10
generate_energy_levels <- function() {
  axes <- c("Love", "Career", "Health", "Luck", "Chaos", "Charisma")
  values <- sample(1:10, length(axes), replace = TRUE)
  names(values) <- axes
  values
}

#' Pretty-print a fortune to the console
#'
#' @param fortune A list returned by generate_fortune()
print_fortune <- function(fortune) {
  cat("\n")
  cat("========================================\n")
  cat(sprintf("  %s | %s\n", fortune$sign, toupper(fortune$category)))
  cat("----------------------------------------\n")
  cat(strwrap(fortune$text, width = 40), sep = "\n")
  cat("========================================\n\n")
  invisible(fortune)
}
