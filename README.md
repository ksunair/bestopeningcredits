"# bestopeningcredits"

This Project is an attempt to learn Elm and Horizon.

This project will allow users to recommend best opening scores and
allow them to vote on it. This will show the user's favorites and also
public favorites.

Setting up the environment
elm-package install elm-lang/html

To run, execute elm-reactor in the application root director as

elm-reactor

now open web browser and go to

localhost:80

This will show all the available files in the root directory, select Main.elm

step 1:
added initData with model of
title: String
url: String
votes: Int
userCount: Int

replaced "Hello World" with initial data

in the main instead of printing initData as it is, we need to convert
it to string before printing it so I piped the data toString

text <| toString <| initData
