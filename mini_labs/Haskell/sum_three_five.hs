-- This program computes the sum of all natural numbers less than one thousand
-- that are multiples of 3 or 5.
main :: IO ()

main = do
    let b = [ x | x <- [0..1000] , x < 1000, x `mod` 3 == 0 || x `mod` 5 == 0 ]
    print(sum b)
