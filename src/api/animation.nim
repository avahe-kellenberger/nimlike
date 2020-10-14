type
  AnimationFrame* = ref object
    index: int
    hflip, vflip: bool

  Animation* = ref object
    frameDuration: float
    frames: seq[AnimationFrame]
    duration: float

template index*(this: AnimationFrame): int = this.index
template hflip*(this: AnimationFrame): bool = this.hflip
template vflip*(this: AnimationFrame): bool = this.vflip

proc newAnimationFrame*(index: int, hflip, vflip: bool = false): AnimationFrame =
  AnimationFrame(index: index, hflip: hflip, vflip: vflip)

template duration*(this: Animation): float = this.duration

proc newAnimation*(
  frameDuration: float,
  frames: openArray[AnimationFrame]
): Animation =
  ## Creates a new Animation.
  ## frameDuration: The length of each frame in seconds.
  ## frames: The animation frames to play, in order.
  return Animation(
    frameDuration: frameDuration,
    frames: @frames,
    duration: frameDuration * frames.len.float
  )

proc newAnimation*(
  frameDuration: float,
  frameIndices: openArray[int]
): Animation =
  ## Creates a new Animation.
  ## frameDuration: The length of each frame in seconds.
  ## frameIndices: The indices of the animation frames to play, in order.
  var frames: seq[AnimationFrame]
  for i in frameIndices:
    frames.add(newAnimationFrame(i))

  return Animation(
    frameDuration: frameDuration,
    frames: @frames,
    duration: frameDuration * frames.len.float
  )

proc getCurrentFrame*(this: Animation, elapsed: float): AnimationFrame =
  ## Gets the frame index based on the time elapsed
  ## since the animation first started.
  var currentTime: float
  for i in this.frames.low..this.frames.high:
    currentTime += this.frameDuration
    if currentTime >= elapsed:
      return this.frames[i]

  raise newException(
    Exception,
    "failed to get AnimationFrame at elapsed time " & $elapsed
  )

