import Control.Monad.Memo

memoized_fib :: Int -> Integer
memoized_fib = (map fib [0..] !!) where 
	  fib 0 = 0
	  fib 1 = 1
	  fib n = memoized_fib (n-1) + memoized_fib (n-2)

fibm :: (MonadMemo Integer Integer m) => Integer -> m Integer
fibm 0 = return 0
fibm 1 = return 1
fibm n = do
	f1 <- memo fibm (n-1)
	f2 <- memo fibm (n-2)
	return (f1+f2)

coefBiSlow :: Int -> Int -> Integer
coefBiSlow n 0 = 1
coefBiSlow 0 k = 0
coefBiSlow n k = coefBiSlow (n-1) (k-1) + coefBiSlow (n-1) (k)

memoized_coefBi :: Int -> Int -> Integer
memoized_coefBi = (map coefBi [0..] !!) where
	coefBi n 0 = 1
	coefBi 0 k = 0
	coefBi n k = memoized_coefBi (n-1) (k-1) + memoized_coefBi (n-1) (k)

--coefBim n 0 = return 1
--coefBim 0 k = return 0
--coefBim n k = do
--	f1 <-  memo coefBim (n-1) (k-1)
--	f2 <-  memo coefBim (n-1) (k)
--	return (f1+f2)

	
