module Model exposing (..)

import Player.Model exposing (Player)
import Enemy.Model exposing (Enemy)
import GameState.Model exposing (State(..))
import Map.Model exposing (Map)

type alias Model =
    { player : Player
    , enemies: List Enemy
    , state: State
    , map: Map
    }

initialModel : Model
initialModel =
    { player = Player.Model.initialPlayer
    , enemies = []
    , state = Play
    , map = Map.Model.gameMap
    }
