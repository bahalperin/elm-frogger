module Commands exposing (..)

import Message exposing (Msg(..))

import Enemy.Commands

initialCommands : Cmd Msg
initialCommands =
    Cmd.batch
        [ Cmd.map EnemyMsg Enemy.Commands.initializeEnemies
        ]
