module Player.Model exposing (..)

import Constants

type alias Player =
    { x : Float
    , y : Float
    }

playerWidth : Float
playerWidth =
    60

playerLeft : Player -> Float
playerLeft {x} =
    x - (playerWidth / 2)

playerRight : Player -> Float
playerRight {x} =
    x + (playerWidth / 2)

initialPlayer : Player
initialPlayer =
    { x = 0
    , y = Constants.yOffset - (2 * Constants.yStep)
    }
