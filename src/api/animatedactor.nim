import nico
import tables, math
import actor, animation

export actor, animation

type AnimatedActor* = ref object of Actor
    animations: Table[string, Animation]
    currentAnimation: Animation
    currentAnimationTime: float

proc newAnimatedActor*(): AnimatedActor = AnimatedActor()

proc addAnimation*(this: var AnimatedActor, name: string, animation: Animation) =
  this.animations[name] = animation

proc setAnimation*(this: AnimatedActor, name: string) =
  this.currentAnimation = this.animations[name]
  this.currentAnimationTime = 0f

proc updateCurrentAnimation(this: AnimatedActor, deltaTime: float) =
  ## Updates the animation based on elapsed time.
  ## This is automatically invoked by update()
  this.currentAnimationTime =
    (this.currentAnimationTime + deltaTime) mod this.currentAnimation.duration

proc renderCurrentAnimation(this: AnimatedActor) =
  ## Renders the current animation frame.
  ## This is automatically invoked by render()
  let frame = this.currentAnimation.getCurrentFrame(this.currentAnimationTime)
  spr(frame, 0, 0)

method update*(this: AnimatedActor, deltaTime: float) =
  this.updateCurrentAnimation(deltaTime)

method render*(this: AnimatedActor) =
  this.renderCurrentAnimation()

