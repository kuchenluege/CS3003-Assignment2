module Main where

import Assignment2

unit_test :: Eq a => a -> a -> [Char]
unit_test expected actual | expected == actual = "Pass"
                          | otherwise = "Fail"

main :: IO ()
main = do
  putStrLn $ unit_test [1,2,3,4,5,6,7,8,9,10] $ mergesort (<) [10, 1, 9, 2, 8, 3, 7, 4, 6, 5]
  putStrLn $ unit_test [10,9,8,7,6,5,4,3,2,1] $ mergesort (>) [10, 1, 9, 2, 8, 3, 7, 4, 6, 5]
  putStrLn $ unit_test [] $ mergesort ((>)::Integer->Integer->Bool) []
  putStrLn $ unit_test (Match 1) $ findFirst ((==) 1) [10, 1, 9, 2, 8, 3, 7, 4, 6, 5]
  putStrLn $ unit_test (NoMatch) $ findFirst ((==) 11) [10, 1, 9, 2, 8, 3, 7, 4, 6, 5]
  putStrLn $ unit_test True $ palindrome "a"
  putStrLn $ unit_test True $ palindrome "aa"
  putStrLn $ unit_test False $ palindrome "ab"
  putStrLn $ unit_test True $ palindrome "aba"
  putStrLn $ unit_test True $ palindrome "abba"
  putStrLn $ unit_test False $ palindrome "abcd"
  putStrLn $ unit_test True $ palindrome "amanaplanacanalpanama"
  putStrLn $ unit_test [ (Span 2 'a'), (Span 3 'd') ] $ runLengthEncode "aaddd"
  putStrLn $ unit_test [ ] $ runLengthEncode ""

