import renderable

type RenderObject* = ref object of Renderable

method update*(this: RenderObject, deltaTime: float) {.base.} = discard
