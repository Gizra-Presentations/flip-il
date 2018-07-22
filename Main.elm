module Main exposing (main)

import Html exposing (Html, button, div, pre, program, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)


type alias Model =
    { name : String
    , kids : Int
    , age : Int
    , counter : Int
    }


initialModel : Model
initialModel =
    { name = "Amitai"
    , kids = 3
    , age = 40
    , counter = 0
    }


init : ( Model, Cmd Msg )
init =
    ( initialModel
    , Cmd.none
    )


type Msg
    = DecrementCounter
    | IncrementCounter


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        DecrementCounter ->
            ( { model | counter = model.counter - 1 }
            , Cmd.none
            )

        IncrementCounter ->
            ( { model | counter = model.counter + 1 }
            , Cmd.none
            )


view : Model -> Html Msg
view model =
    div [ class "center" ]
        [ div [] [ text <| "Name: " ++ model.name ]
        , div [] [ text <| "Age: " ++ toString model.age ]
        , div [] [ text <| "Kids num: " ++ toString model.kids ]
        , button [ onClick DecrementCounter ] [ text "-" ]
        , button [ onClick IncrementCounter ] [ text "+" ]
        , pre [] [ text <| toString model.counter ]
        ]


main : Program Never Model Msg
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }
