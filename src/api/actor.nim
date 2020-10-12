import renderobject

type Actor* = ref object of RenderObject

# TODO: Actors are behavior-driven.
method update*(this: Actor, deltaTime: float) {.locks: 0.} = discard
method render*(this: Actor) {.locks: 0.} = discard

