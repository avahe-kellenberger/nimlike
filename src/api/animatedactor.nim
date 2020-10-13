import nico
import tables, math
import actor, animation

export actor, animation

type AnimatedActor* = ref object of Actor
  animations: Table[string, Animation]
  currentAnimation: Animation
  currentAnimationTime: float

proc newAnimatedActor*(): AnimatedActor =
  AnimatedActor()

method addAnimation*(this: AnimatedActor, name: string, animation: Animation) {.base.} =
  this.animations[name] = animation

method resetAnimation*(this: AnimatedActor) {.base.} =
  this.currentAnimationTime = 0f

method setAnimation*(this: AnimatedActor, name: string) {.base.} =
  this.currentAnimation = this.animations[name]
  this.resetAnimation()

method updateCurrentAnimation(this: AnimatedActor, deltaTime: float) {.base.} =
  ## Updates the animation based on elapsed time.
  ## This is automatically invoked by update()
  this.currentAnimationTime =
    (this.currentAnimationTime + deltaTime) mod this.currentAnimation.duration

method renderCurrentAnimation(this: AnimatedActor) {.base.} =
  ## Renders the current animation frame.
  ## This is automatically invoked by render()
  setSpritesheet(this.currentAnimation.spritesheet)
  let frame = this.currentAnimation.getCurrentFrame(this.currentAnimationTime)
  spr(frame.index, 0, 0, hflip = frame.hflip, vflip = frame.vflip)

method update*(this: AnimatedActor, deltaTime: float) =
  this.updateCurrentAnimation(deltaTime)

method render*(this: AnimatedActor) =
  this.renderCurrentAnimation()

