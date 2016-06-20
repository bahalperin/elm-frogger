module Subscriptions exposing (..)

import Model exposing (Model)
import Message exposing (Msg(..))

import Player.Subscriptions
import Enemy.Subscriptions
import GameState.Subscriptions

subscriptions : Model -> Sub Msg
subscriptions model =
    let
        playerSubscriptions =
            Sub.map (\a -> PlayerMsg a) (Player.Subscriptions.subscriptions model.player)
        enemySubscriptions =
            List.map (Sub.map (\a -> EnemyMsg a)) (List.map Enemy.Subscriptions.subscriptions model.enemies)
        gameStateSubscriptions =
            Sub.map (\a -> GameStateMsg a) (GameState.Subscriptions.subscriptions model.state)
        allSubscriptions =
            playerSubscriptions :: gameStateSubscriptions :: enemySubscriptions
    in
    Sub.batch
        allSubscriptions
