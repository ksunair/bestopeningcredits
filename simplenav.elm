module Simplenav exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Navigation


type alias Model =
    { page : Page
    }


initstate : Model
initstate =
    { page = AllTimeBest
    }


initdata : Navigation.Location -> ( Model, Cmd Msg )
initdata nav =
    { initstate | page = AllTimeBest } ! [ Cmd.none ]


type Page
    = AllTimeBest
    | Login


header : Html Msg
header =
    div []
        [ h3 []
            [ a [ href "#alltimebest" ] [ text "All Time Best" ]
            , a [ href "#login" ] [ text "Login" ]
            ]
        ]


body : Model -> Html Msg
body model =
    case (model.page) of
        AllTimeBest ->
            alltimebesepage model

        Login ->
            loginpage model


view : Model -> Html Msg
view model =
    div []
        [ header
        , body model
        ]


type Msg
    = UrlChange Navigation.Location


findpage : String -> Page
findpage hash =
    case (hash) of
        "#alltimebest" ->
            AllTimeBest

        "#login" ->
            Login

        _ ->
            AllTimeBest


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        UrlChange location ->
            { model | page = (findpage location.hash) } ! [ Cmd.none ]


alltimebesepage : Model -> Html Msg
alltimebesepage model =
    h1 [] [ text "All Time Best" ]


loginpage : Model -> Html Msg
loginpage model =
    h1 [] [ text "Login Page" ]


main : Program Never Model Msg
main =
    Navigation.program UrlChange
        { init = initdata
        , update = update
        , view = view
        , subscriptions = (\_ -> Sub.none)
        }
