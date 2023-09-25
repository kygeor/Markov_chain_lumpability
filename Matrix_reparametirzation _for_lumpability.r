

reparameterization <- function(M)
  
{
  n <- nrow(M)  #also equal to ncol(M)
  repar <- matrix(NaN, nrow=n^2 , ncol = 1)
  
  for (s in 1:n)
    
    {
      for (h in 1:n)
      {
      
        repar[(s-1)*n+h,1] <- M[s,h] 
        
      }
    }
  
  repar
  
}



matrixrepar <- function(m)
{
  
  n <- sqrt(length(m))
  matrixM <- matrix(NaN, nrow=n, ncol=n)
  
  for (entries in 1:n^2)
  {
    matrixM[(entries-(entries%%n+n*(entries%%n==0)))/n +1,entries%%n+n*(entries%%n==0)] <- m[entries]
  }
  
  matrixM
}

