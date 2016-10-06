module Main exposing (..)

import Html exposing (..)
import Html.App exposing (beginnerProgram)
import Html.Attributes exposing (title, class, type', attribute)
import Html.Keyed
import Platform.Cmd exposing (Cmd)


main : Program Never
main =
    beginnerProgram { model = init, view = root, update = update }


type alias Model =
    String


type Msg
    = Blah


init : Model
init =
    "dummy model"


update : Msg -> Model -> Model
update action model =
    case action of
        Blah ->
            model


root : Model -> Html Msg
root model =
    Html.Keyed.node "div"
        [ class "horizontal-section-container" ]
        [ ( "test"
          , div []
                [ h4 [] [ text "Multi-select" ]
                , div [ class "horizontal-section" ]
                    [ paperListBox [ attribute "multi" "" ]
                        [ paperItem [] [ text "Bold" ]
                        , paperItem [] [ text "Italic" ]
                        , paperItem [] [ text "Underline" ]
                        , paperItem [] [ text "Strikethrough" ]
                        ]
                    ]
                ]
          )
        ]


paperListBox : List (Attribute a) -> List (Html a) -> Html a
paperListBox =
    Html.node "paper-listbox"


paperItem : List (Attribute a) -> List (Html a) -> Html a
paperItem =
    Html.node "paper-item"
