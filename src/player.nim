import api / [animatedactor, animation, spritesheetloader]

export animatedactor, animation

var spritesheetIndex: int = -1 
let idleAnim = newAnimation(spritesheetIndex, 0.2, [5, 11, 17])

type 
  Anim = enum
    Idle = "character.png"

  Player* = ref object of AnimatedActor

converter animToString(animation: Anim): string = $animation

proc newPlayer*(): Player =
  if spritesheetIndex < 0:
   spritesheetIndex = loadSpritesheet("character.png", 32, 32)

  result = Player()
  result.addAnimation(Idle, idleAnim)

