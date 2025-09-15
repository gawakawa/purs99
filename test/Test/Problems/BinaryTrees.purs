module Test.Problems.BinaryTrees where

import Prelude

import Test.Unit (TestSuite, suite, test)
import Test.Unit.Assert as Assert

tests :: TestSuite
tests = suite "Problems.BinaryTrees" do
  test "dummy test" do
    Assert.equal true true