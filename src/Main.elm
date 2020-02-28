module Main exposing (main)

import Block exposing (Block)
import Browser
import Html exposing (Html, button, div)
import Html.Events as E
import Model exposing (Model)
import Svg exposing (Svg, svg)
import Svg.Attributes as SA


main =
    Browser.sandbox
        { init = Model.init
        , update = update
        , view = view
        }



-- Update


type Msg
    = Up
    | Down
    | Left
    | Right


update : Msg -> Model -> Model
update msg model =
    let
        ( x, y ) =
            case msg of
                Up ->
                    ( 0, -1 )

                Down ->
                    ( 0, 1 )

                Left ->
                    ( -1, 0 )

                Right ->
                    ( 1, 0 )
    in
    maybeToList (Maybe.map (Block.move x y) (Block.takeBaba model)) ++ Block.dropBaba model


maybeToList : Maybe a -> List a
maybeToList m =
    case m of
        Just x ->
            [ x ]

        Nothing ->
            []



-- View


view : Model -> Html Msg
view model =
    div []
        [ button [ E.onClick Up ] [ Html.text "UP" ]
        , button [ E.onClick Down ] [ Html.text "DOWN" ]
        , button [ E.onClick Left ] [ Html.text "LEFT" ]
        , button [ E.onClick Right ] [ Html.text "RIGHT" ]
        , svg
            [ SA.viewBox "0 0 400 200"
            , SA.width "400"
            , SA.height "200"
            ]
            (showBlocks model)
        ]


showBlocks : Model -> List (Svg msg)
showBlocks =
    List.map showBlock


showBlock : Block -> Svg msg
showBlock block =
    Svg.text_
        [ SA.width "20"
        , SA.height "20"
        , SA.x (String.fromInt <| block.x * 20)
        , SA.y (String.fromInt <| block.y * 20)
        ]
        [ Svg.text block.name ]
