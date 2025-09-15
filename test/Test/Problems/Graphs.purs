module Test.Problems.Graphs where

import Prelude

import Test.Unit (TestSuite, suite, test)
import Test.Unit.Assert as Assert

tests :: TestSuite
tests = suite "Problems.Graphs" do
  test "dummy test" do
    Assert.equal true true