import nico
import animatedactor

var buttonDown = false

let foo: AnimatedActor = AnimatedActor()
foo.update(0.1)

proc gameInit() =
  loadFont(0, "font.png")

proc gameUpdate(dt: float32) =
  buttonDown = key(K_a)

proc gameDraw() =
  cls()
  setColor(if buttonDown: 7 else: 3)
  printc("hello world", screenWidth div 2, screenHeight div 2)

nico.init("myOrg", "myApp")
nico.createWindow("myApp", 128, 128, 4, false)
nico.run(gameInit, gameUpdate, gameDraw)
