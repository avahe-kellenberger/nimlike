import
  nico,
  api / [aabb, renderable, vector2d]

type Ground* = ref object of Renderable
  color: int

proc newGround*(color: int, x, y, width, height: int): Ground =
  ## color:
  ##  The index of the color in the ground palette.
  return Ground(
    color: color,
    location: newVector(x, y),
    size: newVector(width, height)
  )

method x*(this: Ground): float =
  # TODO: Why do I need to do this?
  # Since the base class with the most recent implementation is AABB,
  # shouldn't this.x() call AABB's x method?
  procCall AABB(this).x()

method y*(this: Ground): float =
  procCall AABB(this).y()

method width*(this: Ground): float =
  procCall AABB(this).width()

method height*(this: Ground): float =
  procCall AABB(this).height()

method render*(this: Ground) =
  setColor(this.color)
  boxfill(this.x, this.y, this.width, this.height)
