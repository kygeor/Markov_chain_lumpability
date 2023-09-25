
#We consider a 10-dimensional transition matrix
K <-rbind(c(0.11, 0.08, 0.07 ,0.02, 0.18, 0.07, 0.10, 0.15, 0.09,  0.13),c(0.17, 0.04, 0.02, 0.15, 0.21, 0.07, 0.01, 0.08, 0.12,  0.13),c(0.13 ,0.09, 0.07, 0.02, 0.15, 0.13, 0.07 ,0.25 ,0.01,  0.08),
          c(0.04, 0.08, 0.16, 0.06, 0.05, 0.13, 0.15, 0.08, 0.15,  0.11),c(0.14, 0.00, 0.00, 0.24 ,0.19 ,0.02, 0.03, 0.05, 0.16,  0.17),c(0.19, 0.11, 0.03, 0.13, 0.16, 0.02, 0.05, 0.03, 0.19,  0.09),
          c(0.11, 0.13, 0.11, 0.13, 0.10, 0.10, 0.16, 0.04, 0.06,  0.06),c(0.08, 0.01, 0.13, 0.05, 0.13, 0.18, 0.06, 0.19, 0.01 , 0.16),c(0.06 ,0.20, 0.03, 0.08, 0.05, 0.13, 0.12, 0.08, 0.02,  0.23),
          c(0.10, 0.06, 0.05, 0.10, 0.07, 0.13, 0.05, 0.09, 0.15,  0.20))
K

#Define partition and row conditions that the lumpable matrix should satisfy
Q1<-c(1,4,6,9,11)
C<-rep(1,10)
B<-rep(1,10)

#Perform MP inverse method to solve the problem of approximate lumpabability
K_lumpable <- lumpability_2(10,Q1,C,B,K)
K_lumpable

#If necessary perform alternating projection method to correct the lumpable result
K_lump_final <- itproj(K,100,Q1,C,B)


#Define matrices V,U
V1<-cbind(c(1,1,1,0,0,0,0,0,0,0),c(0,0,0,1,1,0,0,0,0,0),c(0,0,0,0,0,1,1,1,0,0),c(0,0,0,0,0,0,0,0,1,1))
U1 <- rbind(c(1/3,1/3,1/3,0,0,0,0,0,0,0),c(0,0,0,1/2,1/2,0,0,0,0,0),c(0,0,0,0,0,1/3,1/3,1/3,0,0),c(0,0,0,0,0,0,0,0,1/2,1/2))
V1
U1

#Check that lumpability condition holds
V1%*%U1%*%K_lumpable%*%V1
K_lumpable%*%V1

#Calculate the transition matrix of the lumped Mc
K_lumped <- U1%*%K_lumpable%*%V1
K_lumped

#Checj that the lumped transition matrix is stochastic
sum(K_lumped[1,])
sum(K_lumped[2,])
sum(K_lumped[3,])
sum(K_lumped[4,])


###############################################################################

#IFRS 9 partitioning

K2<-rbind(K[1:9,],c(0,0,0,0,0,0,0,0,0,1))
K2

Q2<-c(1,6,10,11)
K2_lumpable <- lumpability_2(10,Q2,C,B,K2)
K2_lumpable

K2_lump_final <- itproj(K2,100,Q2,C,B)
K2_lump_final <- round(K2_lump_final,5)
K2_lump_final

V2<-cbind(c(1,1,1,1,1,0,0,0,0,0),c(0,0,0,0,0,1,1,1,1,0),c(0,0,0,0,0,0,0,0,0,1))
U2 <- rbind(c(1/5,1/5,1/5,1/5,1/5,0,0,0,0,0),c(0,0,0,0,0,1/4,1/4,1/4,1/4,0),c(0,0,0,0,0,0,0,0,0,1))

V2%*%U2%*%K2_lump_final%*%V2
K2_lump_final%*%V2


K2_lumped <- U2%*%K2_lump_final%*%V2
K2_lumped







P1 <- rbind(c(0.6,0.2,0.1,0.05,0.05),c(0.2,0.4,0.2,0.1,0.1),c(0.15,0.1,0.3,0.3,0.05),c(0,0,0,1,0),c(0,0,0,0,1))




V<-cbind(c(1,0,0,0,0),c(0,1,1,0,0),c(0,0,0,1,1))
U<-rbind(c(1,0,0,0,0),c(0,1/2,1/2,0,0),c(0,0,0,1/2,1/2))

