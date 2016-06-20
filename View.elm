module View exposing (..)

import Model exposing (Model)
import Message exposing (Msg)
import Html exposing (Html, div, text)
import Html.Attributes exposing (style)
import Collage exposing (collage, rect)
import Element exposing (toHtml)

import Constants

import Player.View
import Enemy.View
import Map.View

view : Model -> Html Msg
view model =
    let
        playerView = Player.View.view model.player
        enemyViews = Collage.group (List.map Enemy.View.view model.enemies)
        mapView = Map.View.view model.map
    in
    div
        [ style
            [ ("display", "flex")
            , ("justify-content", "center")
            ]
        ]
        [
          collage (round (2 * Constants.mapRight)) (round (2 * Constants.mapTop))
          [mapView, enemyViews, playerView]
          |> toHtml
        ]
