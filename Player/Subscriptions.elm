module Player.Subscriptions exposing (..)

import Player.Model exposing (Player)
import Player.Message exposing (Msg(..))
import Player.Update

import Keyboard
import AnimationFrame

subscriptions : Player -> Sub Msg
subscriptions model =
    Sub.batch
        [ Keyboard.ups Player.Update.getDirectionFromKeyCode
        ]
