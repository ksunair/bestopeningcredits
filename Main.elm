module Main exposing (..)

import Html exposing (..)


initData =
    [ { title = "Game of Thrones"
      , url = "https://www.youtube.com/watch?v=s7L2PVdrb_8"
      , votes = 10
      , userCount = 1
      }
    ]


main =
    text <| toString <| initData
