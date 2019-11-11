-- Make a GET request to load a book called "Public Opinion"
--
-- Read how it works:
--   https://guide.elm-lang.org/effects/http.html
--


module MyChart exposing (Model(..), Msg(..), init, main, subscriptions, update, view)

import Browser
import Color
import Html exposing (Html, div, h1, pre, text)
import Html.Attributes exposing (class)
import Http
import LineChart
import LineChart.Dots as Dots



-- MAIN


main =
    Browser.element
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        }



-- MODEL


type Model
    = Failure
    | Loading
    | Success String


init : () -> ( Model, Cmd Msg )
init _ =
    ( Loading
    , Http.get
        { url = "https://elm-lang.org/assets/public-opinion.txt"
        , expect = Http.expectString GotText
        }
    )



-- UPDATE


type Msg
    = GotText (Result Http.Error String)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        GotText result ->
            case result of
                Ok fullText ->
                    ( Success fullText, Cmd.none )

                Err _ ->
                    ( Failure, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- VIEW


chart : Html.Html msg
chart =
    LineChart.view .age
        .height
        [ LineChart.line Color.red Dots.diamond "Level" alice
        , LineChart.line Color.blue Dots.circle "Temp1" bobby
        , LineChart.line Color.green Dots.plus "Temp2" chuck
        ]


view : Model -> Html Msg
view model =
    div []
        [ h1 []
            [ text "Graph test" ]
        , case model of
            Failure ->
                text ""

            Loading ->
                text "Loading..."

            Success fullText ->
                pre [] [ text fullText ]
        , div [ class "container" ]
            [ chart ]
        ]


type alias Info =
    { age : Float
    , weight : Float
    , height : Float
    , income : Float
    }


alice : List Info
alice =
    [ Info 10 34 1.34 0
    , Info 16 42 1.62 3000
    , Info 25 75 1.73 25000
    , Info 43 83 1.75 40000
    ]


bobby : List Info
bobby =
    [ Info 10 38 1.32 0
    , Info 17 69 1.75 2000
    , Info 25 75 1.87 32000
    , Info 43 77 1.87 52000
    ]


chuck : List Info
chuck =
    [ Info 10 42 1.35 0
    , Info 15 72 1.72 1800
    , Info 25 89 1.83 85000
    , Info 43 95 1.84 120000
    ]
