module Player.Update exposing (..)

import Player.Model exposing (Player)
import Player.Message exposing (Msg(..), Direction(..))

import Enemy.Model exposing (Enemy)

import Constants

type alias Context =
    { player : Player
    , enemies : List Enemy
    }

getDirectionFromKeyCode : Int -> Msg
getDirectionFromKeyCode code =
    case code of
        37 ->
            Move Left
        38 ->
            Move Up
        39 ->
            Move Right
        40 ->
            Move Down
        _ ->
            Move None

playerEndPoint : (Float, Float)
playerEndPoint =
    (0, 196)

update : Msg -> Player -> Player
update msg player =
    case msg of
        Move direction ->
            let
                nextPlayer = case direction of
                    Left ->
                        if player.x > -300 then
                            { player |  x = player.x - Constants.xStep }
                        else
                            player
                    Up ->
                        if player.y < 190 then
                            { player |  y = player.y + Constants.yStep }
                        else
                            player
                    Right ->
                        if player.x < 300 then
                            { player |  x = player.x + Constants.xStep }
                        else
                            player
                    Down ->
                        if player.y > -130 then
                            { player |  y = player.y - Constants.yStep }
                        else
                            player
                    None ->
                        player

                (x, y) = playerEndPoint
            in
                if
                    nextPlayer.x == x
                    && nextPlayer.y == y
                then
                    Player.Model.initialPlayer
                else
                    nextPlayer
        NoOp ->
            player
