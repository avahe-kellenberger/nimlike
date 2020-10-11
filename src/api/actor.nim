import renderobject

type 
  Actor* = object of RenderObject
  ActorRef* = ref Actor

# TODO: Actors are behavior-driven.
