import nico

var spritesheetCount: int = 0

proc loadSpritesheet*(filename: string, sw, sh: int = 8): int =
  ## Loads the spritesheet with the given file name.
  ## Each sprite is of size sw, sh.
  ## The function returns the index of the spritesheet.
  loadSpritesheet(spritesheetCount, filename, sw, sh)
  result = spritesheetCount
  spritesheetCount.inc

