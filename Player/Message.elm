module Player.Message exposing
    ( Msg(..)
    , Direction(..)
    )

type Direction =
    Left
    | Right
    | Up
    | Down
    | None

type Msg =
    Move Direction
    | NoOp
