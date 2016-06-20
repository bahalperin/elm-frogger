module Update exposing (..)

import Model exposing (Model)
import Message exposing (Msg(..))

import Player.Update
import Enemy.Update
import GameState.Update

import Enemy.Commands

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
        if not (GameState.Update.isPaused model.state) then
            case msg of
                PlayerMsg subMsg ->
                    ( { model | player = Player.Update.update subMsg model.player }, Cmd.none)
                EnemyMsg subMsg ->
                    ( { model | enemies = Enemy.Update.update subMsg model.enemies }, Cmd.none)
                GameStateMsg subMsg ->
                    ( { model | state = GameState.Update.update subMsg model.state }, Cmd.none)
        else
            case msg of
                GameStateMsg subMsg ->
                    ( { model | state = GameState.Update.update subMsg model.state }, Cmd.none )
                _ ->
                    ( model, Cmd.none )
