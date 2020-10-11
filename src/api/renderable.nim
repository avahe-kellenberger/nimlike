import
  aabb,
  vector2d

export
  aabb,
  vector2d

type
  Renderable* = object of AABB
  RenderableRef* = ref Renderable

method render*(this: Renderable) {.base.} = discard

