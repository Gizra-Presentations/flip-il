module Main where

import ElmTest exposing (..)
import Graphics.Element exposing (Element)

import PersonTest exposing (all)

allTests : Test
allTests =
  suite "All tests"
    [ PersonTest.all
    ]

main : Element
main =
  elementRunner allTests
