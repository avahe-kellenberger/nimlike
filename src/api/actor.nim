import renderobject

type Actor* = ref object of RenderObject

# TODO: Actors are behavior-driven.
method update*(this: Actor, deltaTime: float) = discard
method render*(this: Actor) = discard

