import vector2d

type AABB* = ref object of RootObj
  location*: Vector
  size*: Vector

proc x*(this: AABB): float = this.location.x
proc y*(this: AABB): float = this.location.y

proc width*(this: AABB): float = this.size.x
proc height*(this: AABB): float = this.size.y

