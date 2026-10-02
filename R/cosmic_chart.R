# R/cosmic_chart.R
# ---------------------------------------------------------------------------
# Renders a fortune's "energy levels" as a polar-coordinate bar chart --
# the closest ggplot2 gets to a genuine astrology-poster aesthetic.
# ---------------------------------------------------------------------------

library(ggplot2)

cosmic_palette <- c(
  "#8E7CC3", "#D08AC4", "#F2A65A", "#5FA8D3",
  "#6FCF97", "#EB5757", "#F2C94C", "#56CCF2"
)

#' Plot a radial "cosmic chart" from a fortune's energy levels
#'
#' @param fortune A list returned by generate_fortune()
#' @return A ggplot object
plot_cosmic_chart <- function(fortune) {
  energy <- fortune$energy
  df <- data.frame(
    category = factor(names(energy), levels = names(energy)),
    value = as.numeric(energy)
  )

  n <- nrow(df)
  palette <- rep(cosmic_palette, length.out = n)

  ggplot(df, aes(x = category, y = value, fill = category)) +
    geom_col(width = 1, color = "white", linewidth = 0.6, alpha = 0.9) +
    geom_hline(yintercept = seq(0, 10, by = 2.5), color = "white", linewidth = 0.3) +
    coord_polar(clip = "off") +
    scale_y_continuous(limits = c(0, 10)) +
    scale_fill_manual(values = palette) +
    labs(
      title = sprintf("%s's Cosmic Chart", fortune$sign),
      subtitle = format(Sys.Date(), "%B %d, %Y"),
      x = NULL, y = NULL
    ) +
    theme_minimal(base_size = 13) +
    theme(
      legend.position = "none",
      panel.grid = element_blank(),
      axis.text.y = element_blank(),
      axis.text.x = element_text(face = "bold", size = 11),
      plot.title = element_text(hjust = 0.5, face = "bold", size = 16),
      plot.subtitle = element_text(hjust = 0.5, color = "grey40"),
      plot.background = element_rect(fill = "#FAF8FF", color = NA)
    )
}

#' Generate a fortune, plot it, and save both text + chart
#'
#' @param out_dir Directory to save the chart into
#' @param ... Passed through to generate_fortune()
save_fortune_reading <- function(out_dir = "outputs", ...) {
  if (!dir.exists(out_dir)) dir.create(out_dir, recursive = TRUE)

  fortune <- generate_fortune(...)
  print_fortune(fortune)

  plot <- plot_cosmic_chart(fortune)
  filename <- file.path(
    out_dir,
    sprintf("cosmic_chart_%s_%s.png", tolower(fortune$sign), format(Sys.time(), "%H%M%S"))
  )
  ggsave(filename, plot, width = 6, height = 6, dpi = 150, bg = "white")
  cat(sprintf("Saved chart to: %s\n", filename))

  invisible(list(fortune = fortune, plot = plot, file = filename))
}
