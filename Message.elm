module Message exposing (Msg(..))

import Player.Message
import Enemy.Message
import GameState.Message

type Msg =
    PlayerMsg Player.Message.Msg
    | EnemyMsg Enemy.Message.Msg
    | GameStateMsg GameState.Message.Msg
