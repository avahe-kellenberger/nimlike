import aabb

type Renderable* = ref object of AABB

method render*(this: Renderable) {.base.} = discard

