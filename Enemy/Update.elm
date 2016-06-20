module Enemy.Update exposing (..)

import Enemy.Model exposing (Enemy)
import Enemy.Message exposing (Msg(..))

import Constants

setEnemyPosition : Enemy -> (Float, Float) -> Enemy
setEnemyPosition enemy (x, y) =
    { enemy |
        x = x
        , y = y
    }

tickEnemy : Float -> Msg
tickEnemy val =
    Tick val

update : Msg -> List Enemy -> List Enemy
update msg enemies =
    case msg of
        Tick dt ->
            List.map (\enemy ->
                if enemy.x > Constants.mapRight then
                    { enemy |
                        x = Constants.mapLeft - 50
                    }
                else
                    { enemy |
                        x = enemy.x + (enemy.vx * dt)
                    }
                ) enemies
        Initialize coordinates ->
            List.map (\(x, y) ->
                Enemy.Model.initialEnemy
                    <| (Constants.xStep * (toFloat <| floor x), Constants.yOffset + (Constants.yStep * (toFloat <| floor y))))
            coordinates
