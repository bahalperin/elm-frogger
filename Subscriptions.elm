module Subscriptions exposing (..)

import Model exposing (Model)
import Message exposing (Msg(..))

import Player.Subscriptions
import Enemy.Subscriptions
import GameState.Subscriptions

import Player.Model exposing (Player, playerLeft, playerRight)
import Enemy.Model exposing (Enemy, enemyLeft, enemyRight)

import AnimationFrame

detectCollision : Player -> List Enemy -> Bool
detectCollision player enemies =
    List.any (
        \enemy ->
            player.y == enemy.y
            && (
                playerLeft player < enemyRight enemy && playerLeft player > enemyLeft enemy
                || playerRight player > enemyLeft enemy && playerRight player < enemyRight enemy
            )
    ) enemies

subscriptions : Model -> Sub Msg
subscriptions model =
    let
        playerSubscriptions =
            Sub.map (\a -> PlayerMsg a) (Player.Subscriptions.subscriptions model.player)
        enemySubscriptions =
            List.map (Sub.map (\a -> EnemyMsg a)) (List.map Enemy.Subscriptions.subscriptions model.enemies)
        gameStateSubscriptions =
            Sub.map (\a -> GameStateMsg a) (GameState.Subscriptions.subscriptions model.state)

        gameSubscriptions =
            Sub.map (\_ -> if detectCollision model.player model.enemies then Collision else NoOp) (AnimationFrame.diffs (\_ -> ()))

        allSubscriptions =
            playerSubscriptions :: gameStateSubscriptions :: gameSubscriptions :: enemySubscriptions
    in
    Sub.batch
        allSubscriptions
