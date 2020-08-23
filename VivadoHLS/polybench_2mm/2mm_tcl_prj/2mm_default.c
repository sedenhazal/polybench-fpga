/**
 * 2mm.c: This file is part of the PolyBench/C 3.2 test suite.
 *
 *
 * Contact: Louis-Noel Pouchet <pouchet@cse.ohio-state.edu>
 * Web address: http://polybench.sourceforge.net
 */
#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <math.h>

/* Include polybench common header. */
#define MINI_DATASET
#include "polybench.h"

/* Include benchmark-specific header. */
/* Default data type is double, default size is 4000. */
#include "2mm.h"



/*   hazalg */
void kernel2_2mm(int ni, int nj, int nk, int nl,
		DATA_TYPE alpha,
		DATA_TYPE beta,
		DATA_TYPE tmp[NI][NJ],
		DATA_TYPE A[NI][NK],
		DATA_TYPE B[NK][NJ],
		DATA_TYPE C[NL][NJ],
		DATA_TYPE D[NI][NL])
{
  int i, j, k;
   
  //directive1
  /* D := alpha*A*B*C + beta*D */
  for (i = 0; i < NI; i++)
    for (j = 0; j < NJ; j++)
      {
	tmp[i][j] = 0;
	for (k = 0; k < NK; ++k)
          //directive2
	  tmp[i][j] += alpha * A[i][k] * B[k][j];
      }
  for (i = 0; i < NI; i++)
    for (j = 0; j < NL; j++)
      {
	D[i][j] *= beta;
	for (k = 0; k < NJ; ++k)
          //directive3
	  D[i][j] += tmp[i][k] * C[k][j];
      }

}
/* hazalg */


