import Control.Monad.Memo

memoFibo :: (Eq n, Num n, Ord n) => n -> Memo n n n 
memoFibo 0 = return 0
memoFibo 1 = return 1
memoFibo n = do 
	f1 <- memo memoFibo (n-1)
	f2 <- memo memoFibo (n-2)
	return (f1 + f2)


-- coefBinom 0 m = return 0
-- coefBinom n 0 = return 1
-- coefBinom n m = do
	-- f1 <- for2 memo coefBinom (n-1) (m-1)
	-- f2 <- for2 memo coefBinom (n-1) m
	-- return (f1+f2)


-- Ackerman function classic definition
-- ack :: (Eq n, Num n) => n -> n -> n
-- ack 0 n = n+1
-- ack m 0 = ack (m-1) 1
-- ack m n = ack (m-1) (ack m (n-1))

-- Ackerman function memoized definition
-- ackm 0 n = return (n+1)
-- ackm m 0 = for2 memo ackm (m-1) 1
-- ackm m n = do
  -- n1 <- for2 memo ackm m (n-1)
  -- for2 memo ackm (m-1) n1

-- evalAckm :: (Num n, Ord n) => n -> n -> n
-- evalAckm n m = startEvalMemo $ ackm n m



