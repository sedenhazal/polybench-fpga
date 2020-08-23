// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================

#include <systemc>
#include <iostream>
#include <cstdlib>
#include <cstddef>
#include <stdint.h>
#include "SysCFileHandler.h"
#include "ap_int.h"
#include "ap_fixed.h"
#include <complex>
#include <stdbool.h>
#include "autopilot_cbe.h"
#include "hls_stream.h"
#include "hls_half.h"
#include "hls_signal_handler.h"

using namespace std;
using namespace sc_core;
using namespace sc_dt;


// [dump_struct_tree [build_nameSpaceTree] dumpedStructList] ---------->


// [dump_enumeration [get_enumeration_list]] ---------->


// wrapc file define: "alpha"
#define AUTOTB_TVIN_alpha  "../tv/cdatafile/c.kernel2_2mm.autotvin_alpha.dat"
// wrapc file define: "beta"
#define AUTOTB_TVIN_beta  "../tv/cdatafile/c.kernel2_2mm.autotvin_beta.dat"
// wrapc file define: "tmp"
#define AUTOTB_TVIN_tmp  "../tv/cdatafile/c.kernel2_2mm.autotvin_tmp.dat"
#define AUTOTB_TVOUT_tmp  "../tv/cdatafile/c.kernel2_2mm.autotvout_tmp.dat"
// wrapc file define: "A"
#define AUTOTB_TVIN_A  "../tv/cdatafile/c.kernel2_2mm.autotvin_A.dat"
// wrapc file define: "B"
#define AUTOTB_TVIN_B  "../tv/cdatafile/c.kernel2_2mm.autotvin_B.dat"
// wrapc file define: "C"
#define AUTOTB_TVIN_C  "../tv/cdatafile/c.kernel2_2mm.autotvin_C.dat"
// wrapc file define: "D"
#define AUTOTB_TVIN_D  "../tv/cdatafile/c.kernel2_2mm.autotvin_D.dat"
#define AUTOTB_TVOUT_D  "../tv/cdatafile/c.kernel2_2mm.autotvout_D.dat"

#define INTER_TCL  "../tv/cdatafile/ref.tcl"

// tvout file define: "tmp"
#define AUTOTB_TVOUT_PC_tmp  "../tv/rtldatafile/rtl.kernel2_2mm.autotvout_tmp.dat"
// tvout file define: "D"
#define AUTOTB_TVOUT_PC_D  "../tv/rtldatafile/rtl.kernel2_2mm.autotvout_D.dat"

class INTER_TCL_FILE {
	public:
		INTER_TCL_FILE(const char* name) {
			mName = name;
			alpha_depth = 0;
			beta_depth = 0;
			tmp_depth = 0;
			A_depth = 0;
			B_depth = 0;
			C_depth = 0;
			D_depth = 0;
			trans_num =0;
		}

		~INTER_TCL_FILE() {
			mFile.open(mName);
			if (!mFile.good()) {
				cout << "Failed to open file ref.tcl" << endl;
				exit (1);
			}
			string total_list = get_depth_list();
			mFile << "set depth_list {\n";
			mFile << total_list;
			mFile << "}\n";
			mFile << "set trans_num "<<trans_num<<endl;
			mFile.close();
		}

		string get_depth_list () {
			stringstream total_list;
			total_list << "{alpha " << alpha_depth << "}\n";
			total_list << "{beta " << beta_depth << "}\n";
			total_list << "{tmp " << tmp_depth << "}\n";
			total_list << "{A " << A_depth << "}\n";
			total_list << "{B " << B_depth << "}\n";
			total_list << "{C " << C_depth << "}\n";
			total_list << "{D " << D_depth << "}\n";
			return total_list.str();
		}

		void set_num (int num , int* class_num) {
			(*class_num) = (*class_num) > num ? (*class_num) : num;
		}
	public:
		int alpha_depth;
		int beta_depth;
		int tmp_depth;
		int A_depth;
		int B_depth;
		int C_depth;
		int D_depth;
		int trans_num;

	private:
		ofstream mFile;
		const char* mName;
};

extern "C" void kernel2_2mm (
int ni,
int nj,
int nk,
int nl,
double alpha,
double beta,
double tmp[32][32],
double A[32][32],
double B[32][32],
double C[32][32],
double D[32][32]);

extern "C" void AESL_WRAP_kernel2_2mm (
int ni,
int nj,
int nk,
int nl,
double alpha,
double beta,
double tmp[32][32],
double A[32][32],
double B[32][32],
double C[32][32],
double D[32][32])
{
	refine_signal_handler();
	fstream wrapc_switch_file_token;
	wrapc_switch_file_token.open(".hls_cosim_wrapc_switch.log");
	int AESL_i;
	if (wrapc_switch_file_token.good())
	{
		CodeState = ENTER_WRAPC_PC;
		static unsigned AESL_transaction_pc = 0;
		string AESL_token;
		string AESL_num;
		static AESL_FILE_HANDLER aesl_fh;


		// output port post check: "tmp"
		aesl_fh.read(AUTOTB_TVOUT_PC_tmp, AESL_token); // [[transaction]]
		if (AESL_token != "[[transaction]]")
		{
			exit(1);
		}
		aesl_fh.read(AUTOTB_TVOUT_PC_tmp, AESL_num); // transaction number

		if (atoi(AESL_num.c_str()) == AESL_transaction_pc)
		{
			aesl_fh.read(AUTOTB_TVOUT_PC_tmp, AESL_token); // data

			sc_bv<64> *tmp_pc_buffer = new sc_bv<64>[1024];
			int i = 0;

			while (AESL_token != "[[/transaction]]")
			{
				bool no_x = false;
				bool err = false;

				// search and replace 'X' with "0" from the 1st char of token
				while (!no_x)
				{
					size_t x_found = AESL_token.find('X');
					if (x_found != string::npos)
					{
						if (!err)
						{
							cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'X' on port 'tmp', possible cause: There are uninitialized variables in the C design." << endl;
							err = true;
						}
						AESL_token.replace(x_found, 1, "0");
					}
					else
					{
						no_x = true;
					}
				}

				no_x = false;

				// search and replace 'x' with "0" from the 3rd char of token
				while (!no_x)
				{
					size_t x_found = AESL_token.find('x', 2);

					if (x_found != string::npos)
					{
						if (!err)
						{
							cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'X' on port 'tmp', possible cause: There are uninitialized variables in the C design." << endl;
							err = true;
						}
						AESL_token.replace(x_found, 1, "0");
					}
					else
					{
						no_x = true;
					}
				}

				// push token into output port buffer
				if (AESL_token != "")
				{
					tmp_pc_buffer[i] = AESL_token.c_str();
					i++;
				}

				aesl_fh.read(AUTOTB_TVOUT_PC_tmp, AESL_token); // data or [[/transaction]]

				if (AESL_token == "[[[/runtime]]]" || aesl_fh.eof(AUTOTB_TVOUT_PC_tmp))
				{
					exit(1);
				}
			}

			// ***********************************
			if (i > 0)
			{
				// RTL Name: tmp
				{
					// bitslice(63, 0)
					// {
						// celement: tmp(63, 0)
						// {
							sc_lv<64>* tmp_lv0_0_31_1_lv1_0_31_1 = new sc_lv<64>[1024];
						// }
					// }

					// bitslice(63, 0)
					{
						int hls_map_index = 0;
						// celement: tmp(63, 0)
						{
							// carray: (0) => (31) @ (1)
							for (int i_0 = 0; i_0 <= 31; i_0 += 1)
							{
								// carray: (0) => (31) @ (1)
								for (int i_1 = 0; i_1 <= 31; i_1 += 1)
								{
									if (&(tmp[0][0]) != NULL) // check the null address if the c port is array or others
									{
										tmp_lv0_0_31_1_lv1_0_31_1[hls_map_index].range(63, 0) = sc_bv<64>(tmp_pc_buffer[hls_map_index].range(63, 0));
										hls_map_index++;
									}
								}
							}
						}
					}

					// bitslice(63, 0)
					{
						int hls_map_index = 0;
						// celement: tmp(63, 0)
						{
							// carray: (0) => (31) @ (1)
							for (int i_0 = 0; i_0 <= 31; i_0 += 1)
							{
								// carray: (0) => (31) @ (1)
								for (int i_1 = 0; i_1 <= 31; i_1 += 1)
								{
									// sub                    : i_0 i_1
									// ori_name               : tmp[i_0][i_1]
									// sub_1st_elem           : 0 0
									// ori_name_1st_elem      : tmp[0][0]
									// output_left_conversion : *(long long*)&tmp[i_0][i_1]
									// output_type_conversion : (tmp_lv0_0_31_1_lv1_0_31_1[hls_map_index]).to_uint64()
									if (&(tmp[0][0]) != NULL) // check the null address if the c port is array or others
									{
										*(long long*)&tmp[i_0][i_1] = (tmp_lv0_0_31_1_lv1_0_31_1[hls_map_index]).to_uint64();
										hls_map_index++;
									}
								}
							}
						}
					}
				}
			}

			// release memory allocation
			delete [] tmp_pc_buffer;
		}

		// output port post check: "D"
		aesl_fh.read(AUTOTB_TVOUT_PC_D, AESL_token); // [[transaction]]
		if (AESL_token != "[[transaction]]")
		{
			exit(1);
		}
		aesl_fh.read(AUTOTB_TVOUT_PC_D, AESL_num); // transaction number

		if (atoi(AESL_num.c_str()) == AESL_transaction_pc)
		{
			aesl_fh.read(AUTOTB_TVOUT_PC_D, AESL_token); // data

			sc_bv<64> *D_pc_buffer = new sc_bv<64>[1024];
			int i = 0;

			while (AESL_token != "[[/transaction]]")
			{
				bool no_x = false;
				bool err = false;

				// search and replace 'X' with "0" from the 1st char of token
				while (!no_x)
				{
					size_t x_found = AESL_token.find('X');
					if (x_found != string::npos)
					{
						if (!err)
						{
							cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'X' on port 'D', possible cause: There are uninitialized variables in the C design." << endl;
							err = true;
						}
						AESL_token.replace(x_found, 1, "0");
					}
					else
					{
						no_x = true;
					}
				}

				no_x = false;

				// search and replace 'x' with "0" from the 3rd char of token
				while (!no_x)
				{
					size_t x_found = AESL_token.find('x', 2);

					if (x_found != string::npos)
					{
						if (!err)
						{
							cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'X' on port 'D', possible cause: There are uninitialized variables in the C design." << endl;
							err = true;
						}
						AESL_token.replace(x_found, 1, "0");
					}
					else
					{
						no_x = true;
					}
				}

				// push token into output port buffer
				if (AESL_token != "")
				{
					D_pc_buffer[i] = AESL_token.c_str();
					i++;
				}

				aesl_fh.read(AUTOTB_TVOUT_PC_D, AESL_token); // data or [[/transaction]]

				if (AESL_token == "[[[/runtime]]]" || aesl_fh.eof(AUTOTB_TVOUT_PC_D))
				{
					exit(1);
				}
			}

			// ***********************************
			if (i > 0)
			{
				// RTL Name: D
				{
					// bitslice(63, 0)
					// {
						// celement: D(63, 0)
						// {
							sc_lv<64>* D_lv0_0_31_1_lv1_0_31_1 = new sc_lv<64>[1024];
						// }
					// }

					// bitslice(63, 0)
					{
						int hls_map_index = 0;
						// celement: D(63, 0)
						{
							// carray: (0) => (31) @ (1)
							for (int i_0 = 0; i_0 <= 31; i_0 += 1)
							{
								// carray: (0) => (31) @ (1)
								for (int i_1 = 0; i_1 <= 31; i_1 += 1)
								{
									if (&(D[0][0]) != NULL) // check the null address if the c port is array or others
									{
										D_lv0_0_31_1_lv1_0_31_1[hls_map_index].range(63, 0) = sc_bv<64>(D_pc_buffer[hls_map_index].range(63, 0));
										hls_map_index++;
									}
								}
							}
						}
					}

					// bitslice(63, 0)
					{
						int hls_map_index = 0;
						// celement: D(63, 0)
						{
							// carray: (0) => (31) @ (1)
							for (int i_0 = 0; i_0 <= 31; i_0 += 1)
							{
								// carray: (0) => (31) @ (1)
								for (int i_1 = 0; i_1 <= 31; i_1 += 1)
								{
									// sub                    : i_0 i_1
									// ori_name               : D[i_0][i_1]
									// sub_1st_elem           : 0 0
									// ori_name_1st_elem      : D[0][0]
									// output_left_conversion : *(long long*)&D[i_0][i_1]
									// output_type_conversion : (D_lv0_0_31_1_lv1_0_31_1[hls_map_index]).to_uint64()
									if (&(D[0][0]) != NULL) // check the null address if the c port is array or others
									{
										*(long long*)&D[i_0][i_1] = (D_lv0_0_31_1_lv1_0_31_1[hls_map_index]).to_uint64();
										hls_map_index++;
									}
								}
							}
						}
					}
				}
			}

			// release memory allocation
			delete [] D_pc_buffer;
		}

		AESL_transaction_pc++;
	}
	else
	{
		CodeState = ENTER_WRAPC;
		static unsigned AESL_transaction;

		static AESL_FILE_HANDLER aesl_fh;

		// "alpha"
		char* tvin_alpha = new char[50];
		aesl_fh.touch(AUTOTB_TVIN_alpha);

		// "beta"
		char* tvin_beta = new char[50];
		aesl_fh.touch(AUTOTB_TVIN_beta);

		// "tmp"
		char* tvin_tmp = new char[50];
		aesl_fh.touch(AUTOTB_TVIN_tmp);
		char* tvout_tmp = new char[50];
		aesl_fh.touch(AUTOTB_TVOUT_tmp);

		// "A"
		char* tvin_A = new char[50];
		aesl_fh.touch(AUTOTB_TVIN_A);

		// "B"
		char* tvin_B = new char[50];
		aesl_fh.touch(AUTOTB_TVIN_B);

		// "C"
		char* tvin_C = new char[50];
		aesl_fh.touch(AUTOTB_TVIN_C);

		// "D"
		char* tvin_D = new char[50];
		aesl_fh.touch(AUTOTB_TVIN_D);
		char* tvout_D = new char[50];
		aesl_fh.touch(AUTOTB_TVOUT_D);

		CodeState = DUMP_INPUTS;
		static INTER_TCL_FILE tcl_file(INTER_TCL);
		int leading_zero;

		// [[transaction]]
		sprintf(tvin_alpha, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVIN_alpha, tvin_alpha);

		sc_bv<64> alpha_tvin_wrapc_buffer;

		// RTL Name: alpha
		{
			// bitslice(63, 0)
			{
				// celement: alpha(63, 0)
				{
					// carray: (0) => (0) @ (0)
					{
						// sub                   : 
						// ori_name              : alpha
						// sub_1st_elem          : 
						// ori_name_1st_elem     : alpha
						// regulate_c_name       : alpha
						// input_type_conversion : *(long long*)&alpha
						if (&(alpha) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<64> alpha_tmp_mem;
							alpha_tmp_mem = *(long long*)&alpha;
							alpha_tvin_wrapc_buffer.range(63, 0) = alpha_tmp_mem.range(63, 0);
						}
					}
				}
			}
		}

		// dump tv to file
		for (int i = 0; i < 1; i++)
		{
			sprintf(tvin_alpha, "%s\n", (alpha_tvin_wrapc_buffer).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVIN_alpha, tvin_alpha);
		}

		tcl_file.set_num(1, &tcl_file.alpha_depth);
		sprintf(tvin_alpha, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVIN_alpha, tvin_alpha);

		// [[transaction]]
		sprintf(tvin_beta, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVIN_beta, tvin_beta);

		sc_bv<64> beta_tvin_wrapc_buffer;

		// RTL Name: beta
		{
			// bitslice(63, 0)
			{
				// celement: beta(63, 0)
				{
					// carray: (0) => (0) @ (0)
					{
						// sub                   : 
						// ori_name              : beta
						// sub_1st_elem          : 
						// ori_name_1st_elem     : beta
						// regulate_c_name       : beta
						// input_type_conversion : *(long long*)&beta
						if (&(beta) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<64> beta_tmp_mem;
							beta_tmp_mem = *(long long*)&beta;
							beta_tvin_wrapc_buffer.range(63, 0) = beta_tmp_mem.range(63, 0);
						}
					}
				}
			}
		}

		// dump tv to file
		for (int i = 0; i < 1; i++)
		{
			sprintf(tvin_beta, "%s\n", (beta_tvin_wrapc_buffer).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVIN_beta, tvin_beta);
		}

		tcl_file.set_num(1, &tcl_file.beta_depth);
		sprintf(tvin_beta, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVIN_beta, tvin_beta);

		// [[transaction]]
		sprintf(tvin_tmp, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVIN_tmp, tvin_tmp);

		sc_bv<64>* tmp_tvin_wrapc_buffer = new sc_bv<64>[1024];

		// RTL Name: tmp
		{
			// bitslice(63, 0)
			{
				int hls_map_index = 0;
				// celement: tmp(63, 0)
				{
					// carray: (0) => (31) @ (1)
					for (int i_0 = 0; i_0 <= 31; i_0 += 1)
					{
						// carray: (0) => (31) @ (1)
						for (int i_1 = 0; i_1 <= 31; i_1 += 1)
						{
							// sub                   : i_0 i_1
							// ori_name              : tmp[i_0][i_1]
							// sub_1st_elem          : 0 0
							// ori_name_1st_elem     : tmp[0][0]
							// regulate_c_name       : tmp
							// input_type_conversion : *(long long*)&tmp[i_0][i_1]
							if (&(tmp[0][0]) != NULL) // check the null address if the c port is array or others
							{
								sc_lv<64> tmp_tmp_mem;
								tmp_tmp_mem = *(long long*)&tmp[i_0][i_1];
								tmp_tvin_wrapc_buffer[hls_map_index].range(63, 0) = tmp_tmp_mem.range(63, 0);
                                 		       hls_map_index++;
							}
						}
					}
				}
			}
		}

		// dump tv to file
		for (int i = 0; i < 1024; i++)
		{
			sprintf(tvin_tmp, "%s\n", (tmp_tvin_wrapc_buffer[i]).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVIN_tmp, tvin_tmp);
		}

		tcl_file.set_num(1024, &tcl_file.tmp_depth);
		sprintf(tvin_tmp, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVIN_tmp, tvin_tmp);

		// release memory allocation
		delete [] tmp_tvin_wrapc_buffer;

		// [[transaction]]
		sprintf(tvin_A, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVIN_A, tvin_A);

		sc_bv<64>* A_tvin_wrapc_buffer = new sc_bv<64>[1024];

		// RTL Name: A
		{
			// bitslice(63, 0)
			{
				int hls_map_index = 0;
				// celement: A(63, 0)
				{
					// carray: (0) => (31) @ (1)
					for (int i_0 = 0; i_0 <= 31; i_0 += 1)
					{
						// carray: (0) => (31) @ (1)
						for (int i_1 = 0; i_1 <= 31; i_1 += 1)
						{
							// sub                   : i_0 i_1
							// ori_name              : A[i_0][i_1]
							// sub_1st_elem          : 0 0
							// ori_name_1st_elem     : A[0][0]
							// regulate_c_name       : A
							// input_type_conversion : *(long long*)&A[i_0][i_1]
							if (&(A[0][0]) != NULL) // check the null address if the c port is array or others
							{
								sc_lv<64> A_tmp_mem;
								A_tmp_mem = *(long long*)&A[i_0][i_1];
								A_tvin_wrapc_buffer[hls_map_index].range(63, 0) = A_tmp_mem.range(63, 0);
                                 		       hls_map_index++;
							}
						}
					}
				}
			}
		}

		// dump tv to file
		for (int i = 0; i < 1024; i++)
		{
			sprintf(tvin_A, "%s\n", (A_tvin_wrapc_buffer[i]).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVIN_A, tvin_A);
		}

		tcl_file.set_num(1024, &tcl_file.A_depth);
		sprintf(tvin_A, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVIN_A, tvin_A);

		// release memory allocation
		delete [] A_tvin_wrapc_buffer;

		// [[transaction]]
		sprintf(tvin_B, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVIN_B, tvin_B);

		sc_bv<64>* B_tvin_wrapc_buffer = new sc_bv<64>[1024];

		// RTL Name: B
		{
			// bitslice(63, 0)
			{
				int hls_map_index = 0;
				// celement: B(63, 0)
				{
					// carray: (0) => (31) @ (1)
					for (int i_0 = 0; i_0 <= 31; i_0 += 1)
					{
						// carray: (0) => (31) @ (1)
						for (int i_1 = 0; i_1 <= 31; i_1 += 1)
						{
							// sub                   : i_0 i_1
							// ori_name              : B[i_0][i_1]
							// sub_1st_elem          : 0 0
							// ori_name_1st_elem     : B[0][0]
							// regulate_c_name       : B
							// input_type_conversion : *(long long*)&B[i_0][i_1]
							if (&(B[0][0]) != NULL) // check the null address if the c port is array or others
							{
								sc_lv<64> B_tmp_mem;
								B_tmp_mem = *(long long*)&B[i_0][i_1];
								B_tvin_wrapc_buffer[hls_map_index].range(63, 0) = B_tmp_mem.range(63, 0);
                                 		       hls_map_index++;
							}
						}
					}
				}
			}
		}

		// dump tv to file
		for (int i = 0; i < 1024; i++)
		{
			sprintf(tvin_B, "%s\n", (B_tvin_wrapc_buffer[i]).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVIN_B, tvin_B);
		}

		tcl_file.set_num(1024, &tcl_file.B_depth);
		sprintf(tvin_B, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVIN_B, tvin_B);

		// release memory allocation
		delete [] B_tvin_wrapc_buffer;

		// [[transaction]]
		sprintf(tvin_C, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVIN_C, tvin_C);

		sc_bv<64>* C_tvin_wrapc_buffer = new sc_bv<64>[1024];

		// RTL Name: C
		{
			// bitslice(63, 0)
			{
				int hls_map_index = 0;
				// celement: C(63, 0)
				{
					// carray: (0) => (31) @ (1)
					for (int i_0 = 0; i_0 <= 31; i_0 += 1)
					{
						// carray: (0) => (31) @ (1)
						for (int i_1 = 0; i_1 <= 31; i_1 += 1)
						{
							// sub                   : i_0 i_1
							// ori_name              : C[i_0][i_1]
							// sub_1st_elem          : 0 0
							// ori_name_1st_elem     : C[0][0]
							// regulate_c_name       : C
							// input_type_conversion : *(long long*)&C[i_0][i_1]
							if (&(C[0][0]) != NULL) // check the null address if the c port is array or others
							{
								sc_lv<64> C_tmp_mem;
								C_tmp_mem = *(long long*)&C[i_0][i_1];
								C_tvin_wrapc_buffer[hls_map_index].range(63, 0) = C_tmp_mem.range(63, 0);
                                 		       hls_map_index++;
							}
						}
					}
				}
			}
		}

		// dump tv to file
		for (int i = 0; i < 1024; i++)
		{
			sprintf(tvin_C, "%s\n", (C_tvin_wrapc_buffer[i]).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVIN_C, tvin_C);
		}

		tcl_file.set_num(1024, &tcl_file.C_depth);
		sprintf(tvin_C, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVIN_C, tvin_C);

		// release memory allocation
		delete [] C_tvin_wrapc_buffer;

		// [[transaction]]
		sprintf(tvin_D, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVIN_D, tvin_D);

		sc_bv<64>* D_tvin_wrapc_buffer = new sc_bv<64>[1024];

		// RTL Name: D
		{
			// bitslice(63, 0)
			{
				int hls_map_index = 0;
				// celement: D(63, 0)
				{
					// carray: (0) => (31) @ (1)
					for (int i_0 = 0; i_0 <= 31; i_0 += 1)
					{
						// carray: (0) => (31) @ (1)
						for (int i_1 = 0; i_1 <= 31; i_1 += 1)
						{
							// sub                   : i_0 i_1
							// ori_name              : D[i_0][i_1]
							// sub_1st_elem          : 0 0
							// ori_name_1st_elem     : D[0][0]
							// regulate_c_name       : D
							// input_type_conversion : *(long long*)&D[i_0][i_1]
							if (&(D[0][0]) != NULL) // check the null address if the c port is array or others
							{
								sc_lv<64> D_tmp_mem;
								D_tmp_mem = *(long long*)&D[i_0][i_1];
								D_tvin_wrapc_buffer[hls_map_index].range(63, 0) = D_tmp_mem.range(63, 0);
                                 		       hls_map_index++;
							}
						}
					}
				}
			}
		}

		// dump tv to file
		for (int i = 0; i < 1024; i++)
		{
			sprintf(tvin_D, "%s\n", (D_tvin_wrapc_buffer[i]).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVIN_D, tvin_D);
		}

		tcl_file.set_num(1024, &tcl_file.D_depth);
		sprintf(tvin_D, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVIN_D, tvin_D);

		// release memory allocation
		delete [] D_tvin_wrapc_buffer;

// [call_c_dut] ---------->

		CodeState = CALL_C_DUT;
		kernel2_2mm(ni, nj, nk, nl, alpha, beta, tmp, A, B, C, D);

		CodeState = DUMP_OUTPUTS;

		// [[transaction]]
		sprintf(tvout_tmp, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVOUT_tmp, tvout_tmp);

		sc_bv<64>* tmp_tvout_wrapc_buffer = new sc_bv<64>[1024];

		// RTL Name: tmp
		{
			// bitslice(63, 0)
			{
				int hls_map_index = 0;
				// celement: tmp(63, 0)
				{
					// carray: (0) => (31) @ (1)
					for (int i_0 = 0; i_0 <= 31; i_0 += 1)
					{
						// carray: (0) => (31) @ (1)
						for (int i_1 = 0; i_1 <= 31; i_1 += 1)
						{
							// sub                   : i_0 i_1
							// ori_name              : tmp[i_0][i_1]
							// sub_1st_elem          : 0 0
							// ori_name_1st_elem     : tmp[0][0]
							// regulate_c_name       : tmp
							// input_type_conversion : *(long long*)&tmp[i_0][i_1]
							if (&(tmp[0][0]) != NULL) // check the null address if the c port is array or others
							{
								sc_lv<64> tmp_tmp_mem;
								tmp_tmp_mem = *(long long*)&tmp[i_0][i_1];
								tmp_tvout_wrapc_buffer[hls_map_index].range(63, 0) = tmp_tmp_mem.range(63, 0);
                                 		       hls_map_index++;
							}
						}
					}
				}
			}
		}

		// dump tv to file
		for (int i = 0; i < 1024; i++)
		{
			sprintf(tvout_tmp, "%s\n", (tmp_tvout_wrapc_buffer[i]).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVOUT_tmp, tvout_tmp);
		}

		tcl_file.set_num(1024, &tcl_file.tmp_depth);
		sprintf(tvout_tmp, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVOUT_tmp, tvout_tmp);

		// release memory allocation
		delete [] tmp_tvout_wrapc_buffer;

		// [[transaction]]
		sprintf(tvout_D, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVOUT_D, tvout_D);

		sc_bv<64>* D_tvout_wrapc_buffer = new sc_bv<64>[1024];

		// RTL Name: D
		{
			// bitslice(63, 0)
			{
				int hls_map_index = 0;
				// celement: D(63, 0)
				{
					// carray: (0) => (31) @ (1)
					for (int i_0 = 0; i_0 <= 31; i_0 += 1)
					{
						// carray: (0) => (31) @ (1)
						for (int i_1 = 0; i_1 <= 31; i_1 += 1)
						{
							// sub                   : i_0 i_1
							// ori_name              : D[i_0][i_1]
							// sub_1st_elem          : 0 0
							// ori_name_1st_elem     : D[0][0]
							// regulate_c_name       : D
							// input_type_conversion : *(long long*)&D[i_0][i_1]
							if (&(D[0][0]) != NULL) // check the null address if the c port is array or others
							{
								sc_lv<64> D_tmp_mem;
								D_tmp_mem = *(long long*)&D[i_0][i_1];
								D_tvout_wrapc_buffer[hls_map_index].range(63, 0) = D_tmp_mem.range(63, 0);
                                 		       hls_map_index++;
							}
						}
					}
				}
			}
		}

		// dump tv to file
		for (int i = 0; i < 1024; i++)
		{
			sprintf(tvout_D, "%s\n", (D_tvout_wrapc_buffer[i]).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVOUT_D, tvout_D);
		}

		tcl_file.set_num(1024, &tcl_file.D_depth);
		sprintf(tvout_D, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVOUT_D, tvout_D);

		// release memory allocation
		delete [] D_tvout_wrapc_buffer;

		CodeState = DELETE_CHAR_BUFFERS;
		// release memory allocation: "alpha"
		delete [] tvin_alpha;
		// release memory allocation: "beta"
		delete [] tvin_beta;
		// release memory allocation: "tmp"
		delete [] tvin_tmp;
		delete [] tvout_tmp;
		// release memory allocation: "A"
		delete [] tvin_A;
		// release memory allocation: "B"
		delete [] tvin_B;
		// release memory allocation: "C"
		delete [] tvin_C;
		// release memory allocation: "D"
		delete [] tvin_D;
		delete [] tvout_D;

		AESL_transaction++;

		tcl_file.set_num(AESL_transaction , &tcl_file.trans_num);
	}
}

