module Test.Problems.Lists where

import Prelude

import Data.Maybe (Maybe(..))
import Problems.Lists (myLast)
import Test.Unit (TestSuite, suite, test)
import Test.Unit.Assert as Assert

tests :: TestSuite
tests = suite "Problems.Lists" do
  suite "myLast" do
    test "should return last element of integer array" do
      Assert.equal (Just 4) (myLast [1, 2, 3, 4])
    
    test "should return last element of character array" do
      Assert.equal (Just 'z') (myLast ['x', 'y', 'z'])