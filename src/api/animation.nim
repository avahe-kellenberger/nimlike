import math

type Animation* = object
  spritesheet: int
  frameDuration: float
  frameIndices: seq[int]
  duration: float

proc newAnimation*(
  spritesheet: int,
  frameDuration: float,
  frameIndices: varargs[int]
): Animation =
  ## Creates a new Animation.
  ## spritesheet: The index of the loaded spritesheet.
  ## frameDuration: The length of each frame in seconds.
  ## frameIndices: The index of each frame in the spritesheet.
  return Animation(
    spritesheet: spritesheet,
    frameDuration: frameDuration,
    frameIndices: @frameIndices,
    duration: frameDuration * frameIndices.len.float
  )

proc getCurrentFrame*(this: Animation, elapsed: float): int =
  ## Gets the frame index based on the time elapsed
  ## since the animation first started.
  let delta = elapsed mod this.duration
  var currentTime: float
  while currentTime < delta:
    currentTime += this.frameDuration
    result += 1

