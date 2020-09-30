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

method render*(this: Ground) =
  setColor(this.color)
  boxfill(this.x, this.y, this.width, this.height)
