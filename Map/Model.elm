module Map.Model exposing (..)

import Map.Tile.Model exposing (Tile, TileType(..))

import Constants

type alias Map =
    List (List Tile)

gameMap : Map
gameMap =
    List.map (\b -> (List.map (\a -> { tileType = Grass, x = Constants.xStep * a, y = Constants.yStep * b}) [-3..3])) (List.reverse [-2..2])
