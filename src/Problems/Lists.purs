module Problems.Lists where

import Data.Array (last)
import Data.Maybe (Maybe)

-- Problem 1
-- Find the last element of a list  
myLast :: forall a. Array a -> Maybe a
myLast = last
