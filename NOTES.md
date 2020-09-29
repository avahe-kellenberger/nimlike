We need entities that have a velocity (per second).

For entities that will never move,
we should not have a velocity member
because it is wasted space.

Most entities require sprites,
but some
(such as floor tiles)
only require draw calls.
We need a good solution for this,
so we can iterate over all entities
and invoke render().

sfx activated on events

AABB = object
  location, size: Vector

Renderable = ref object of AABB:
  proc render

RenderObject = Renderable:
  proc update(deltaTime: float)

Tile = Renderable
# This is a ground tile
  
Actor = RenderObject:

AnimatedActor = ref object of Actor:
  proc animate(deltaTime: float)
    ## Updates the animation state
  proc renderCurrentAnimation

BreakableTile = Actor

