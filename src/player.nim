import api / [animatedactor, animation, spritesheetloader]

export animatedactor, animation

const spritesheet = "character.png"

var spritesheetIndex: int = -1
let animIdle = newAnimation(0.2, [5, 11, 17], true)
let animWalkDown = newAnimation(0.2, [0, 1, 2, 3])
let animWalkUp = newAnimation(0.2, [6, 7, 8, 9])
let animWalkRight = newAnimation(0.2, [12, 13, 14, 15])
let animWalkLeft = newAnimation(0.2, [18, 19, 20, 21])
let animSleep = newAnimation(0.2, [4, 10, 16, 22])

type 
  Anim = enum
    Idle
    WalkDown
    WalkUp
    WalkRight
    WalkLeft
    Sleep

  Player* = ref object of AnimatedActor

converter animToString(animation: Anim): string = $animation

proc newPlayer*(): Player =
  if spritesheetIndex < 0:
    spritesheetIndex = loadSpritesheet(spritesheet, 32, 32)

  result = Player(spritesheet: spritesheetIndex)
  result.addAnimation(Idle, animIdle)
  result.addAnimation(WalkDown, animWalkDown)
  result.addAnimation(WalkUp, animWalkup)
  result.addAnimation(WalkRight, animWalkRight)
  result.addAnimation(WalkLeft, animWalkLeft)
  result.addAnimation(Sleep, animSleep)

  result.setAnimation(Sleep)

