module Main exposing (main)

import Browser
import Html exposing (Html)
import Svg exposing (Svg, svg)
import Svg.Attributes as SA


main =
    Browser.sandbox
        { init = init
        , update = update
        , view = view
        }



-- Model


type alias Model =
    Block


type alias Block =
    { x : Int, y : Int, name : String }


init : Model
init =
    { x = 5, y = 5, name = "Baba" }



-- Update


type Msg
    = Up
    | Down
    | Left
    | Right


update : Msg -> Model -> Model
update msg model =
    model
        |> (case msg of
                Up ->
                    move 0 -1

                Down ->
                    move 0 1

                Left ->
                    move -1 0

                Right ->
                    move 1 0
           )


move : Int -> Int -> Model -> Model
move dx dy model =
    { model | x = model.x + dx, y = model.y + dy }



-- View


view : Model -> Html Msg
view model =
    svg
        [ SA.viewBox "0 0 400 200"
        , SA.width "400"
        , SA.height "200"
        ]
        (List.singleton (showBlock model))


showBlock : Model -> Svg msg
showBlock model =
    Svg.rect
        [ SA.width "20"
        , SA.height "20"
        , SA.x (String.fromInt <| model.x * 20)
        , SA.y (String.fromInt <| model.y * 20)
        ]
        [ Svg.text model.name ]
