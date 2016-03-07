module Person where

import Effects exposing (Effects)
import Html exposing (button, div, pre, text, Html)
import Html.Events exposing (onClick)

-- MODEL

type Kids = Kids Int

type alias Model =
  { age  : Int
  , kids : Kids
  , name : String
  }

initialModel : Model
initialModel =
  { age  = 38
  , kids = Kids 3
  , name = "Amitai"
  }


init : (Model, Effects Action)
init =
  ( initialModel
  , Effects.none
  )


-- UPDATE

type Action = Decrement | Increment

update : Action -> Model -> (Model, Effects Action)
update action model =
  case action of
    Decrement ->
      let
        (Kids val) = model.kids
        kids' = if val < 1 then Kids 0 else Kids (val - 1)
      in
        ( { model | kids = kids' }
        , Effects.none
        )

    Increment ->
      let
        (Kids val) = model.kids
        kids' = if val > 4 then Kids 5 else Kids (val + 1)
      in
        ( { model | kids = kids' }
        , Effects.none
        )

-- VIEW

view : Signal.Address Action -> Model -> Html
view address model =
  div []
    [ viewName model.name
    , viewAge  model.age
    , viewKids model.kids
    , button [ onClick address Decrement ] [ text "-" ]
    , button [ onClick address Increment ] [ text "+" ]
    , pre [] [ text (toString model) ]
    ]

viewName : String -> Html
viewName name =
  div [] [ text <| "Name: " ++ name ]

viewAge : Int -> Html
viewAge age =
  div [] [ text <| "Age: " ++ (toString age) ]

viewKids : Kids -> Html
viewKids kids =
  let
    (Kids val) = kids
  in
  div [] [ text <| "Kids num: " ++ (toString val) ]
