This program and alogrithm is build by Elias Guan from Northwestern University. 
Under the help and direction of Dr. Reza Vafabakhsh. 

1. Problem we have to solve. 
GPCR tails, which are very important in functionals of GPCRs and many other aspects, are very important for GPCR function. 
The major two different aspects of the tail functions, are 
1) G-protein binding 
2) Phosphoralation and other modifications. 

We have obtained all GPCR tail sequence in Homo Spanies from the Uniprot database using data minning. 
Now we want to use bio-programming to make a thorough analysis of the tail sequence. 

2. Serine analysis. 

The first we want to know, is how many Serines as amino acid we have. The number of serine is very important. 
Since serine is the most easy residual for phosphorylation. If there are multiple serines in a row, it probablly means it is important for phosphorylation. 

Dr. Reza Vafabakhsh have developed codes for serine analysis, but we want to show multiple serines and see if they are consequential. 

I provide an alogrithm, which I call it Elias Operation, or Elias Shift, which helps resolve this problem. 

First, imagine we have a sequnece of judgement, if they are serines: 

0 0 1 0 1 1 0 1 1 1 0 0 1 1  ----------------------------------------------------------------- 1 

where, each 1 is a serine. 

We expect to output, for each two adjacent serines: 

0 0 0 0 1 1 0 0 0 0 0 0 1 1 

They way I address this is: 

First, make a shift of sequence 1, and add an extra 0 to each side of 1 and the shift, and we have: *(0) is added 0 

(0)0 0 1 0 1 1 0 1 1 1 0 0 1 1 
 0 0 1 0 1 1 0 1 1 1 0 0 1 1(0)

and multiply them, we get: 

(0) 0 0 0 0 1 0 0 1 1 0 0 1 0 (0) 

And which we know the first and the last element should always be 0, so we can simply elimiate them, and get: 

0 0 0 0 1 0 0 1 1 0 0 1        ----------------------------------------------------------------- 2 

Then we shift 2, and add (0): 

(0)0 0 0 0 1 0 0 1 1 0 0 1 
 0 0 0 0 1 0 0 1 1 0 0 1(0)

We add these two or just make and XOR, get 

0 0 0 0 1 1 0 1 0 1 0 1 1      ------------------------------------------------------------------- 3 

If we just make an OR, we get 

0 0 0 0 1 1 0 1 1 1 0 1 1      --------------------------------------------------------------------4 

We call the process from 1 - 3 a Elias operation. 

Then we make Elias operation on 3 , get the expeceted output. 

The process from 1 - 4 a Alternate Elias operation, where we just want to inspect any consequnetial data with any numbers. 



