import nico, nico/backends/common
import ground

var 
  buttonDown = false
  groundPalette: Palette

let groundTexture: Ground = newGround(0, 10, 10, 32, 32)

proc gameInit() =
  loadFont(0, "font.png")
  groundPalette = loadPaletteFromGPL("palettes/ground.gpl")
  setPalette(groundPalette)

proc gameUpdate(dt: float32) =
  buttonDown = key(K_a)

proc gameDraw() =
  cls()
  groundTexture.render()
  setColor(if buttonDown: 7 else: 3)
  printc("hello world", screenWidth div 2, screenHeight div 2)

nico.init("myOrg", "myApp")
nico.createWindow("myApp", 128, 128, 4, false)
nico.run(gameInit, gameUpdate, gameDraw)
