module GameState.Subscriptions exposing (subscriptions)

import GameState.Model exposing (State)
import GameState.Message exposing (Msg(..))

import Keyboard

isSpaceKeyCode : Int -> Bool
isSpaceKeyCode code =
    code == 32

subscriptions : State -> Sub Msg
subscriptions model =
    Sub.batch
        [ Keyboard.ups (\code -> if isSpaceKeyCode code then Toggle else NoOp)
        ]
