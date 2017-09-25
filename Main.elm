module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


type alias Model =
    { title : String
    , url : String
    , votes : Int
    , userCount : Int
    }


initData : Model
initData =
    { title = "Game of Thrones"
    , url = "https://www.youtube.com/embed/s7L2PVdrb_8"
    , votes = 10
    , userCount = 1
    }


type Msg
    = DoNothing


update : Msg -> Model -> Model
update msg model =
    initData


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text initData.title ]
        , iframe [ width 420, height 315, src initData.url ] []
        ]


main =
    beginnerProgram { model = initData, view = view, update = update }
