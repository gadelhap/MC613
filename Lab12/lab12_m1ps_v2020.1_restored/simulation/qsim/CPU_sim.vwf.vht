-- Copyright (C) 2017  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "06/22/2022 18:03:53"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          CPU
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY CPU_vhd_vec_tst IS
END CPU_vhd_vec_tst;
ARCHITECTURE CPU_arch OF CPU_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL ALU_2_DBus : STD_LOGIC;
SIGNAL clock : STD_LOGIC;
SIGNAL DBus : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL DM_2_DBus : STD_LOGIC;
SIGNAL DM_Rd : STD_LOGIC;
SIGNAL DM_Wr : STD_LOGIC;
SIGNAL IM_address : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL IM_instruction_out : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL instruction : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL IO_2_Reg : STD_LOGIC;
SIGNAL IO_IN : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL IO_OUT : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL IR_Ld : STD_LOGIC;
SIGNAL Pc_Inc : STD_LOGIC;
SIGNAL Pc_Ld : STD_LOGIC;
SIGNAL PC_Ld_En : STD_LOGIC;
SIGNAL Reg_2_IO : STD_LOGIC;
SIGNAL Reg_Wr : STD_LOGIC;
SIGNAL reset : STD_LOGIC;
SIGNAL RSource1 : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL RSource2 : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL stat_CVNZ : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL Stat_Wr : STD_LOGIC;
COMPONENT CPU
	PORT (
	ALU_2_DBus : OUT STD_LOGIC;
	clock : IN STD_LOGIC;
	DBus : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	DM_2_DBus : OUT STD_LOGIC;
	DM_Rd : OUT STD_LOGIC;
	DM_Wr : OUT STD_LOGIC;
	IM_address : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	IM_instruction_out : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	instruction : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	IO_2_Reg : OUT STD_LOGIC;
	IO_IN : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	IO_OUT : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	IR_Ld : OUT STD_LOGIC;
	Pc_Inc : OUT STD_LOGIC;
	Pc_Ld : OUT STD_LOGIC;
	PC_Ld_En : OUT STD_LOGIC;
	Reg_2_IO : OUT STD_LOGIC;
	Reg_Wr : OUT STD_LOGIC;
	reset : IN STD_LOGIC;
	RSource1 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	RSource2 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	stat_CVNZ : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	Stat_Wr : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : CPU
	PORT MAP (
-- list connections between master ports and signals
	ALU_2_DBus => ALU_2_DBus,
	clock => clock,
	DBus => DBus,
	DM_2_DBus => DM_2_DBus,
	DM_Rd => DM_Rd,
	DM_Wr => DM_Wr,
	IM_address => IM_address,
	IM_instruction_out => IM_instruction_out,
	instruction => instruction,
	IO_2_Reg => IO_2_Reg,
	IO_IN => IO_IN,
	IO_OUT => IO_OUT,
	IR_Ld => IR_Ld,
	Pc_Inc => Pc_Inc,
	Pc_Ld => Pc_Ld,
	PC_Ld_En => PC_Ld_En,
	Reg_2_IO => Reg_2_IO,
	Reg_Wr => Reg_Wr,
	reset => reset,
	RSource1 => RSource1,
	RSource2 => RSource2,
	stat_CVNZ => stat_CVNZ,
	Stat_Wr => Stat_Wr
	);

-- clock
t_prcs_clock: PROCESS
BEGIN
LOOP
	clock <= '0';
	WAIT FOR 500000 ps;
	clock <= '1';
	WAIT FOR 500000 ps;
	IF (NOW >= 400000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_clock;
-- IO_IN[31]
t_prcs_IO_IN_31: PROCESS
BEGIN
	IO_IN(31) <= '0';
WAIT;
END PROCESS t_prcs_IO_IN_31;
-- IO_IN[30]
t_prcs_IO_IN_30: PROCESS
BEGIN
	IO_IN(30) <= '0';
WAIT;
END PROCESS t_prcs_IO_IN_30;
-- IO_IN[29]
t_prcs_IO_IN_29: PROCESS
BEGIN
	IO_IN(29) <= '0';
WAIT;
END PROCESS t_prcs_IO_IN_29;
-- IO_IN[28]
t_prcs_IO_IN_28: PROCESS
BEGIN
	IO_IN(28) <= '0';
WAIT;
END PROCESS t_prcs_IO_IN_28;
-- IO_IN[27]
t_prcs_IO_IN_27: PROCESS
BEGIN
	IO_IN(27) <= '0';
WAIT;
END PROCESS t_prcs_IO_IN_27;
-- IO_IN[26]
t_prcs_IO_IN_26: PROCESS
BEGIN
	IO_IN(26) <= '0';
WAIT;
END PROCESS t_prcs_IO_IN_26;
-- IO_IN[25]
t_prcs_IO_IN_25: PROCESS
BEGIN
	IO_IN(25) <= '0';
WAIT;
END PROCESS t_prcs_IO_IN_25;
-- IO_IN[24]
t_prcs_IO_IN_24: PROCESS
BEGIN
	IO_IN(24) <= '0';
WAIT;
END PROCESS t_prcs_IO_IN_24;
-- IO_IN[23]
t_prcs_IO_IN_23: PROCESS
BEGIN
	IO_IN(23) <= '0';
WAIT;
END PROCESS t_prcs_IO_IN_23;
-- IO_IN[22]
t_prcs_IO_IN_22: PROCESS
BEGIN
	IO_IN(22) <= '0';
WAIT;
END PROCESS t_prcs_IO_IN_22;
-- IO_IN[21]
t_prcs_IO_IN_21: PROCESS
BEGIN
	IO_IN(21) <= '0';
WAIT;
END PROCESS t_prcs_IO_IN_21;
-- IO_IN[20]
t_prcs_IO_IN_20: PROCESS
BEGIN
	IO_IN(20) <= '0';
WAIT;
END PROCESS t_prcs_IO_IN_20;
-- IO_IN[19]
t_prcs_IO_IN_19: PROCESS
BEGIN
	IO_IN(19) <= '0';
WAIT;
END PROCESS t_prcs_IO_IN_19;
-- IO_IN[18]
t_prcs_IO_IN_18: PROCESS
BEGIN
	IO_IN(18) <= '0';
WAIT;
END PROCESS t_prcs_IO_IN_18;
-- IO_IN[17]
t_prcs_IO_IN_17: PROCESS
BEGIN
	IO_IN(17) <= '0';
WAIT;
END PROCESS t_prcs_IO_IN_17;
-- IO_IN[16]
t_prcs_IO_IN_16: PROCESS
BEGIN
	IO_IN(16) <= '0';
WAIT;
END PROCESS t_prcs_IO_IN_16;
-- IO_IN[15]
t_prcs_IO_IN_15: PROCESS
BEGIN
	IO_IN(15) <= '0';
WAIT;
END PROCESS t_prcs_IO_IN_15;
-- IO_IN[14]
t_prcs_IO_IN_14: PROCESS
BEGIN
	IO_IN(14) <= '0';
WAIT;
END PROCESS t_prcs_IO_IN_14;
-- IO_IN[13]
t_prcs_IO_IN_13: PROCESS
BEGIN
	IO_IN(13) <= '0';
WAIT;
END PROCESS t_prcs_IO_IN_13;
-- IO_IN[12]
t_prcs_IO_IN_12: PROCESS
BEGIN
	IO_IN(12) <= '0';
WAIT;
END PROCESS t_prcs_IO_IN_12;
-- IO_IN[11]
t_prcs_IO_IN_11: PROCESS
BEGIN
	IO_IN(11) <= '0';
WAIT;
END PROCESS t_prcs_IO_IN_11;
-- IO_IN[10]
t_prcs_IO_IN_10: PROCESS
BEGIN
	IO_IN(10) <= '0';
WAIT;
END PROCESS t_prcs_IO_IN_10;
-- IO_IN[9]
t_prcs_IO_IN_9: PROCESS
BEGIN
	IO_IN(9) <= '0';
WAIT;
END PROCESS t_prcs_IO_IN_9;
-- IO_IN[8]
t_prcs_IO_IN_8: PROCESS
BEGIN
	IO_IN(8) <= '0';
WAIT;
END PROCESS t_prcs_IO_IN_8;
-- IO_IN[7]
t_prcs_IO_IN_7: PROCESS
BEGIN
	IO_IN(7) <= '0';
WAIT;
END PROCESS t_prcs_IO_IN_7;
-- IO_IN[6]
t_prcs_IO_IN_6: PROCESS
BEGIN
	IO_IN(6) <= '0';
	WAIT FOR 11520000 ps;
	IO_IN(6) <= '1';
	WAIT FOR 3520000 ps;
	IO_IN(6) <= '0';
	WAIT FOR 43840000 ps;
	IO_IN(6) <= '1';
	WAIT FOR 3520000 ps;
	IO_IN(6) <= '0';
WAIT;
END PROCESS t_prcs_IO_IN_6;
-- IO_IN[5]
t_prcs_IO_IN_5: PROCESS
BEGIN
	IO_IN(5) <= '0';
WAIT;
END PROCESS t_prcs_IO_IN_5;
-- IO_IN[4]
t_prcs_IO_IN_4: PROCESS
BEGIN
	IO_IN(4) <= '0';
WAIT;
END PROCESS t_prcs_IO_IN_4;
-- IO_IN[3]
t_prcs_IO_IN_3: PROCESS
BEGIN
	IO_IN(3) <= '1';
	WAIT FOR 4480000 ps;
	IO_IN(3) <= '0';
	WAIT FOR 42880000 ps;
	IO_IN(3) <= '1';
	WAIT FOR 4480000 ps;
	IO_IN(3) <= '0';
WAIT;
END PROCESS t_prcs_IO_IN_3;
-- IO_IN[2]
t_prcs_IO_IN_2: PROCESS
BEGIN
	IO_IN(2) <= '0';
WAIT;
END PROCESS t_prcs_IO_IN_2;
-- IO_IN[1]
t_prcs_IO_IN_1: PROCESS
BEGIN
	IO_IN(1) <= '0';
WAIT;
END PROCESS t_prcs_IO_IN_1;
-- IO_IN[0]
t_prcs_IO_IN_0: PROCESS
BEGIN
	IO_IN(0) <= '0';
	WAIT FOR 7360000 ps;
	IO_IN(0) <= '1';
	WAIT FOR 4160000 ps;
	IO_IN(0) <= '0';
	WAIT FOR 43200000 ps;
	IO_IN(0) <= '1';
	WAIT FOR 4160000 ps;
	IO_IN(0) <= '0';
WAIT;
END PROCESS t_prcs_IO_IN_0;

-- reset
t_prcs_reset: PROCESS
BEGIN
	reset <= '1';
	WAIT FOR 160000 ps;
	reset <= '0';
	WAIT FOR 44640000 ps;
	reset <= '1';
	WAIT FOR 2560000 ps;
	reset <= '0';
WAIT;
END PROCESS t_prcs_reset;
END CPU_arch;
