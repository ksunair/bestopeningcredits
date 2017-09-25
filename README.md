"# bestopeningcredits"

This Project is an attempt to learn Elm and Horizon.

This project will allow users to recommend best opening scores and
allow them to vote on it. This will show the user's favorites and also
public favorites.

###Setting up the environment
elm-package install elm-lang/html

To run, execute elm-reactor in the application root director as

elm-reactor

now open web browser and go to

localhost:80

This will show all the available files in the root directory, select Main.elm

##step 1:
added initData with model of
title: String
url: String
votes: Int
userCount: Int

replaced "Hello World" with initial data

in the main instead of printing initData as it is, we need to convert
it to string before printing it so I piped the data toString

text <| toString <| initData

##Step 2:
In this step we will display just one title and the video on the page
For this we are going to full application model with view, update and model

Define the model definition and inital data as
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

Since there is no update function we create a dummy one

type Msg
    = DoNothing


update : Msg -> Model -> Model
update msg model =
    initData

Finally move the view to view section
view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text initData.title ]
        , iframe [ width 420, height 315, src initData.url ] []
        ]

##Step 3:
Now that we were able to render one title and video, let's convert it to
handle multiple records or List


Now change the model to first define just one records
type alias Record =
    { title : String
    , url : String
    , votes : Int
    , userCount : Int
    }

and then define the model which is a List
type alias Model =
    List Record

create the initial data
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

Same way, we need to modify the view so that we can render just
one Record
displayLine : Record -> Html Msg
displayLine record =
    div []
        [ h1 [] [ text record.title ]
        , iframe [ width 420, height 315, src record.url ] []
        ]

now modify the main view rendering looping through list of records using
List.map
view : Model -> Html Msg
view model =
    div []
        (List.map displayLine model)
