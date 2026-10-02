# data/templates.R
# ---------------------------------------------------------------------------
# All the raw ingredients for a fortune: word banks + sentence templates.
# Add your own entries anywhere below -- more variety = more fun.
# Templates use glue::glue() syntax, e.g. "{sign} should avoid {noun} today."
# ---------------------------------------------------------------------------

zodiac_signs <- c(
  "Aries", "Taurus", "Gemini", "Cancer", "Leo", "Virgo",
  "Libra", "Scorpio", "Sagittarius", "Capricorn", "Aquarius", "Pisces"
)

cosmic_nouns <- c(
  "a rogue houseplant", "the third moon of Jupiter", "a suspicious pigeon",
  "an unopened email", "a vending machine", "your childhood bicycle",
  "a wifi router", "the last slice of pizza", "a fortune cookie",
  "a parking ticket", "a rubber duck", "an old mixtape",
  "a haunted stapler", "your neighbor's cat", "a discount candle"
)

advice_phrases <- c(
  "trust your gut, then double-check with a spreadsheet",
  "say yes to the weird invitation",
  "avoid making big decisions before coffee",
  "let go of a grudge you forgot you were holding",
  "wear something slightly uncomfortable for good luck",
  "text the friend you've been putting off",
  "take the scenic route, even if it's slower",
  "back away slowly from group chats today",
  "buy the thing you've been overthinking for weeks",
  "practice saying 'no' in the mirror",
  "let a stranger's playlist guide your afternoon",
  "reorganize one drawer and call it self-improvement"
)

lucky_colors <- c(
  "teal", "burnt orange", "static-cling grey", "electric lavender",
  "the color of an overripe banana", "deep swamp green",
  "highlighter yellow", "midnight blue", "rusty pink"
)

times_of_day <- c(
  "right after lunch", "during your commute", "at 3:14pm exactly",
  "the moment you least expect it", "somewhere around dusk",
  "before your second cup of coffee", "in the last five minutes of the day"
)

# Templates grouped by category. Each is a glue() string that can reference:
# {sign} {noun} {advice} {color} {number} {time}
templates <- list(
  love = c(
    "{sign}, romance is hiding behind {noun}. Look closer {time}.",
    "Someone born under {sign} will think about {noun} and smile for no reason.",
    "Your heart and {noun} are more connected than you think this week.",
    "A crush becomes clearer once you {advice}."
  ),
  career = c(
    "{sign}, your next big break arrives disguised as {noun}.",
    "Professionally, the stars say: {advice}.",
    "A meeting will be saved by someone who remembers {noun}.",
    "Your ambition and {noun} are aligned {time} -- act accordingly."
  ),
  health = c(
    "{sign}, your energy levels depend entirely on {noun} today.",
    "The cosmos recommend you {advice} for your wellbeing.",
    "Rest is coming, disguised as {noun}.",
    "Drink some water and think fondly of {noun}."
  ),
  luck = c(
    "{sign}, your lucky number is {number} and your lucky color is {color}.",
    "Fortune favors those who {advice} {time}.",
    "Keep an eye out for {noun} -- it's luckier than it looks.",
    "The universe owes you one small, {color} miracle."
  ),
  chaos = c(
    "{sign}, nothing will make sense today, and that's the point.",
    "{noun} enters your life {time}. Do not resist.",
    "Chaos favors the bold: {advice}.",
    "Somewhere, {noun} is plotting something on your behalf."
  )
)
