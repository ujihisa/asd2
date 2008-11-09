import System
main = do cs <- getArgs
          print . primes . read $ head cs

primes :: Int -> [Int]
primes 0 = []
primes 1 = []
primes n = 2 : [ x | x <- [3..n], all (\y -> x `rem` y /= 0) [2..x-1] ]
