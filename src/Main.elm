module Main exposing (Model, Msg(..), init, main, update, view)

import Browser exposing (Document)
import Csv exposing (Csv, parse)
import Html exposing (Html, h1, text, textarea)
import Html.Attributes exposing (cols, rows)
import Html.Events exposing (onInput)



---- MODEL ----


type alias Model =
    { data : Csv }


init : ( Model, Cmd Msg )
init =
    ( { data = parse "" }, Cmd.none )



---- UPDATE ----


type Msg
    = ChangeData String


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ChangeData newData ->
            ( { model | data = parse newData }, Cmd.none )



---- VIEW ----


viewBody : Model -> List (Html Msg)
viewBody model =
    [ h1 [] [ text "Data Visualizer" ]
    , textarea [ onInput ChangeData, rows 25, cols 150 ] []
    ]


view : Model -> Document Msg
view model =
    { title = "elm data visualizer"
    , body = viewBody model
    }



---- PROGRAM ----


main : Program () Model Msg
main =
    Browser.document
        { view = view
        , init = \_ -> init
        , update = update
        , subscriptions = always Sub.none
        }
