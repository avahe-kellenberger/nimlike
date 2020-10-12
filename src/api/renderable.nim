import
  aabb,
  vector2d

export
  aabb,
  vector2d

type Renderable* = ref object of AABB

method render*(this: Renderable) {.base.} = discard

