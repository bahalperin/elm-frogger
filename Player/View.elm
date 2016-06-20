module Player.View exposing (..)

import Player.Model exposing (Player)
import Player.Message exposing (Msg)
import Html exposing (Html)
import Html.Attributes exposing (src, height, width)
import Element exposing (image)
import Collage exposing (toForm, move)


view : Player -> Collage.Form
view player =
    let
        playerImageSrc = "../images/char-boy.png"
        playerImage = image 101 171 playerImageSrc
    in
        playerImage
            |> toForm
            |> move (player.x, player.y)
