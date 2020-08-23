/**
 * 2mm.c: this file is part of the polybench/c 3.2 test suite.
 *
 *
 * contact: louis-noel pouchet <pouchet@cse.ohio-state.edu>
 * web address: http://polybench.sourceforge.net
 */
#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <math.h>

/* include polybench common header. */
#define mini_dataset
#include "polybench.h"

/* include benchmark-specific header. */
/* default data type is double, default size is 4000. */
#include "2mm.h"



/*   hazalg */
void kernel2_2mm(int ni, int nj, int nk, int nl,
		data_type alpha,
		data_type beta,
		data_type tmp[ni][nj],
		data_type a[ni][nk],
		data_type b[nk][nj],
		data_type c[nl][nj],
		data_type d[ni][nl])
{
  int i, j, k;
   
  //directive1
#pragma HLS unroll
  /* d := alpha*a*b*c + beta*d */
  for (i = 0; i < ni; i++)
    for (j = 0; j < nj; j++)
      {
	tmp[i][j] = 0;
	for (k = 0; k < nk; ++k)
          //directive2
#pragma HLS unroll
	  tmp[i][j] += alpha * a[i][k] * b[k][j];
      }
  for (i = 0; i < ni; i++)
    for (j = 0; j < nl; j++)
      {
	d[i][j] *= beta;
	for (k = 0; k < nj; ++k)
          //directive3
#pragma HLS unroll
	  d[i][j] += tmp[i][k] * c[k][j];
      }

}
/* hazalg */


