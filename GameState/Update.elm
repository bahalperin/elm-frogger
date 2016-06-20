module GameState.Update exposing (..)

import GameState.Model exposing (State(..))
import GameState.Message exposing (..)

isPaused : State -> Bool
isPaused state =
    case state of
        Paused ->
            True
        _ ->
            False

update : Msg -> State -> State
update msg state =
    case msg of
        Toggle ->
            if state == Play then
                Paused
            else
                Play
        NoOp ->
            state
