module Model exposing (..)

import Block exposing (Block)



-- Model


type alias Model =
    List Block


init : Model
init =
    [ { x = 5, y = 5, name = "WALL" }
    , { x = 5, y = 6, name = "WALL" }
    , { x = 7, y = 6, name = "BABA" }
    ]
