module Map.Tile.Model exposing (..)

type TileType =
    Grass
    | Water

type alias Tile =
    { tileType: TileType
    , x : Float
    , y : Float
    }
