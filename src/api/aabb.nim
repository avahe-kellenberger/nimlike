import vector2d
export vector2d

type AABB* = ref object of RootObj
  location*: Vector
  size*: Vector

method x*(this: AABB): float {.base.} = this.location.x
method y*(this: AABB): float {.base.} = this.location.y

method width*(this: AABB): float {.base.} = this.size.x
method height*(this: AABB): float {.base.} = this.size.y

