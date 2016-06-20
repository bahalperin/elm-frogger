module Enemy.Model exposing (..)

type alias Enemy =
    { x : Float
    , y : Float
    , vx : Float
    , vy : Float
    }

enemyWidth : Float
enemyWidth =
    90

enemyLeft : Enemy -> Float
enemyLeft {x} =
    x - (enemyWidth / 2)

enemyRight : Enemy -> Float
enemyRight {x} =
    x + (enemyWidth / 2)

initialEnemy : (Float, Float) -> Enemy
initialEnemy (x, y) =
    { x = x
    , y = y
    , vx = 0.1
    , vy = 0
    }
