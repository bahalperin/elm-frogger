module Map.Tile.View exposing (..)

import Map.Tile.Model exposing (Tile, TileType(..))
import Element exposing (image)
import Collage exposing (toForm, move)


view : Tile -> Collage.Form
view tile =
    let
        tileImageSrc = case tile.tileType of
            Grass ->
                "../images/grass-block.png"
            Water ->
                "../images/water-block.png"
        tileImage = image 101 171 tileImageSrc
    in
        tileImage
            |> toForm
            |> move (tile.x, tile.y)
