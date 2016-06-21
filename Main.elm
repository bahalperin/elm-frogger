module Main exposing (..)

import Html exposing (Html, div, text)
import Html.App

import Model exposing (Model)
import Message exposing (Msg(..))
import Update
import Subscriptions
import View
import Commands


-- MODEL

init : ( Model, Cmd Msg )
init =
    ( Model.initialModel , Commands.initialCommands )



-- VIEW


view : Model -> Html Msg
view =
    View.view

-- UPDATE

update : Msg -> Model -> ( Model, Cmd Msg )
update =
    Update.update


-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions =
    Subscriptions.subscriptions


-- MAIN


main : Program Never
main =
    Html.App.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
