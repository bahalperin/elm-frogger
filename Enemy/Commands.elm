module Enemy.Commands exposing (..)

import Enemy.Message exposing (Msg(..))

import Random

initializeEnemies : Cmd Msg
initializeEnemies =
    Random.generate Initialize (Random.list 3 <| Random.pair (Random.float -3 3) (Random.float -1 2))
