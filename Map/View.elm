module Map.View exposing (..)

import Map.Model exposing (Map)
import Map.Tile.View
import Collage exposing (Form)

view : Map -> Form
view map =
    Collage.group (List.map Map.Tile.View.view (List.concat map))
