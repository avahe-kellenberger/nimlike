type Vector* = object
  x*, y*: float

proc newVector*(x, y: float): Vector = Vector(x: x, y: y)

proc x*(this: Vector): float = this.x
proc y*(this: Vector): float = this.y
