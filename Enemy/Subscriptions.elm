module Enemy.Subscriptions exposing (..)

import Enemy.Model exposing (Enemy)
import Enemy.Message exposing (Msg(..))

import AnimationFrame

subscriptions : Enemy -> Sub Msg
subscriptions model =
    Sub.batch
        [ AnimationFrame.diffs Tick
        ]
