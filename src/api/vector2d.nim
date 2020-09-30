type Vector* = object
  x, y: float

proc newVector*(x, y: float): Vector = Vector(x: x, y: y)
proc newVector*(x, y: int): Vector = newVector(x.float, y.float)

proc x*(this: Vector): float = this.x
proc y*(this: Vector): float = this.y
