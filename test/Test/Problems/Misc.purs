module Test.Problems.Misc where

import Prelude

import Test.Unit (TestSuite, suite, test)
import Test.Unit.Assert as Assert

tests :: TestSuite
tests = suite "Problems.Misc" do
  test "dummy test" do
    Assert.equal true true