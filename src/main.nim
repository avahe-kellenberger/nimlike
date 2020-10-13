import nico

import player as plyr

var player: Player

proc gameInit() =
  loadFont(0, "font.png")
  let palette = loadPaletteFromGPL("palettes/log.gpl")
  setPalette(palette)
  player = newPlayer()

proc gameUpdate(dt: float32) =
  player.update(dt)

proc gameDraw() =
  cls()
  player.render()

nico.init("myOrg", "myApp")
nico.createWindow("myApp", 128, 128, 4, false)
nico.run(gameInit, gameUpdate, gameDraw)
