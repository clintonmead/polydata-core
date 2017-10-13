{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE FlexibleInstances #-}

module Data.Poly.IsPoly (
  GetPolyConstraint,
  IsPoly
) where

import GHC.Exts (Constraint)
import Data.Poly

{-|
Gets the type of the constraint in a 'Poly'
-}
type family GetPolyConstraint a :: * -> Constraint where
  GetPolyConstraint (Poly c) = c

{-
Constraint that asserts @t@ is a @Poly u@ for some @u@.
-}
class (a ~ Poly (GetPolyConstraint a)) => IsPoly a
instance (a ~ Poly (GetPolyConstraint a)) => IsPoly a
