module Test.Main where

import Prelude

import Effect (Effect)
import Test.Unit.Main (runTest)
import Test.Problems.Lists as Lists
import Test.Problems.Arithmetic as Arithmetic
import Test.Problems.Logic as Logic
import Test.Problems.BinaryTrees as BinaryTrees
import Test.Problems.MultiwayTrees as MultiwayTrees
import Test.Problems.Graphs as Graphs
import Test.Problems.Misc as Misc

main :: Effect Unit
main = runTest do
  Lists.tests
  Arithmetic.tests
  Logic.tests
  BinaryTrees.tests
  MultiwayTrees.tests
  Graphs.tests
  Misc.tests

