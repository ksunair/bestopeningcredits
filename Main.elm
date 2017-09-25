module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


type alias Model =
    List Record


type alias Record =
    { title : String
    , url : String
    , votes : Int
    , userCount : Int
    }


initData : Model
initData =
    [ { title = "Game of Thrones"
      , url = "https://www.youtube.com/embed/s7L2PVdrb_8"
      , votes = 10
      , userCount = 1
      }
    , { title = "True Detective Season 2"
      , url = "https://www.youtube.com/embed/GJJfe1k9CeE"
      , votes = 10
      , userCount = 1
      }
    ]


type Msg
    = DoNothing


update : Msg -> Model -> Model
update msg model =
    initData


displayLine : Record -> Html Msg
displayLine record =
    div []
        [ h1 [] [ text record.title ]
        , iframe [ width 420, height 315, src record.url ] []
        ]


view : Model -> Html Msg
view model =
    div []
        (List.map displayLine model)


main =
    beginnerProgram { model = initData, view = view, update = update }
