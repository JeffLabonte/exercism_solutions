module Acronym (abbreviate) where

import qualified Data.Char as C


validator :: String -> String -> String
validator current_xs new_xs
  | null current_xs                                                                      = new_xs
  | C.isSpace (head current_xs) && current_xs !! 1 == '-' && C.isSpace (current_xs !! 2) = validator (drop 3 current_xs) ((C.toUpper (current_xs !! 3)):new_xs)
  | C.isSpace (head current_xs) || head current_xs == '-'                                = validator (drop 2 current_xs) ((C.toUpper(current_xs !! 1)):new_xs)
  | C.isUpper (head current_xs) && C.isLower (current_xs !! 1)                           = validator (drop 1 current_xs) ((C.toUpper(head current_xs)):new_xs)
  | C.isUpper (head current_xs) && all C.isUpper (words (current_xs) !! 0)               = validator (drop (length ((words current_xs) !! 0)) current_xs) new_xs
  | C.isLower (head current_xs) && C.isLetter(head current_xs)                           = validator (drop 1 current_xs) new_xs
  | head current_xs == ','                                                               = validator (drop 1 current_xs) new_xs
  | head current_xs == '\''                                                              = validator (drop 1 current_xs) new_xs
  | C.isSpace (head current_xs) || head current_xs == '_'                                = validator (drop 2 current_xs) ((C.toUpper(current_xs !! 1)):new_xs)
  -- | head current_xs == '_'                                                               = validator (drop 1 current_xs) ((C.toUpper(current_xs !! 1)):new_xs)
  | otherwise                                                                            = new_xs


abbreviate :: String -> String
abbreviate xs = reverse (validator (drop 1 xs) ((head xs):""))
