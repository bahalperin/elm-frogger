module Enemy.Message exposing (Msg(..))

type Msg =
    Tick Float
    | Initialize (List (Float, Float))
