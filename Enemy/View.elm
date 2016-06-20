module Enemy.View exposing (..)

import Enemy.Model exposing (Enemy)
import Element exposing (image)
import Collage exposing (toForm, move)


view : Enemy -> Collage.Form
view enemy =
    let
        enemyImageSrc = "../images/enemy-bug.png"
        enemyImage = image 101 171 enemyImageSrc
    in
        enemyImage
            |> toForm
            |> move (enemy.x, enemy.y)
