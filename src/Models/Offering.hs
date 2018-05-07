module Models.Offering where

import Data.Time

type Amount    = Double
type OfferedAt = Day
data Offering  = Amount | OfferedAt
