import renderable

type RenderObject* = object of Renderable
type RenderObjectRef* = ref RenderObject

method update*(this: RenderObject, deltaTime: float) {.base.} = discard
