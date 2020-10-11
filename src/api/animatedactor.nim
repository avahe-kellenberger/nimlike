import actor

type
  AnimatedActorRef* = ref Actor
  AnimatedActor* = object of Actor
  # TODO: Implement sprites
  # See https://github.com/ftsf/nico/blob/master/API.md#sprites

method updateAnimation*(this: AnimatedActor, deltaTime: float) {.base.} = discard
  ## Updates the animation based on elapsed time.
  ## This is automatically invoked by update()

method renderCurrentAnimation*(this: AnimatedActor) {.base.} = discard
  ## Renders the current animation frame.
  ## This is automatically invoked by render()

method update*(this: AnimatedActor, deltaTime: float) =
  this.updateAnimation(deltaTime)

method render*(this: AnimatedActor) =
  this.renderCurrentAnimation()

