;******************************************************************************
;* PRU C/C++ Codegen                                              Unix v2.1.5 *
;* Date/Time created: Sun Apr 21 22:06:09 2019                                *
;******************************************************************************
	.compiler_opts --abi=eabi --endian=little --hll_source=on --object_format=elf --silicon_version=3 --symdebug:dwarf --symdebug:dwarf_version=3 

$C$DW$CU	.dwtag  DW_TAG_compile_unit
	.dwattr $C$DW$CU, DW_AT_name("pru_fw.c")
	.dwattr $C$DW$CU, DW_AT_producer("TI PRU C/C++ Codegen Unix v2.1.5 Copyright (c) 2012-2017 Texas Instruments Incorporated")
	.dwattr $C$DW$CU, DW_AT_TI_version(0x01)
	.dwattr $C$DW$CU, DW_AT_comp_dir("/home/debian/oresat-star-tracker/prucam/pru_code")
	.global	__PRU_CREG_PRU_CFG
	.global	__PRU_CREG_PRU_INTC

$C$DW$1	.dwtag  DW_TAG_subprogram, DW_AT_name("memcpy")
	.dwattr $C$DW$1, DW_AT_TI_symbol_name("memcpy")
	.dwattr $C$DW$1, DW_AT_type(*$C$DW$T$3)
	.dwattr $C$DW$1, DW_AT_declaration
	.dwattr $C$DW$1, DW_AT_external
$C$DW$2	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$2, DW_AT_type(*$C$DW$T$3)
$C$DW$3	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$3, DW_AT_type(*$C$DW$T$279)
$C$DW$4	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$4, DW_AT_type(*$C$DW$T$11)
	.dwendtag $C$DW$1


$C$DW$5	.dwtag  DW_TAG_subprogram, DW_AT_name("__delay_cycles")
	.dwattr $C$DW$5, DW_AT_TI_symbol_name("__delay_cycles")
	.dwattr $C$DW$5, DW_AT_declaration
	.dwattr $C$DW$5, DW_AT_external
$C$DW$6	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$6, DW_AT_type(*$C$DW$T$11)
	.dwendtag $C$DW$5


$C$DW$7	.dwtag  DW_TAG_subprogram, DW_AT_name("malloc")
	.dwattr $C$DW$7, DW_AT_TI_symbol_name("malloc")
	.dwattr $C$DW$7, DW_AT_type(*$C$DW$T$3)
	.dwattr $C$DW$7, DW_AT_declaration
	.dwattr $C$DW$7, DW_AT_external
	.dwattr $C$DW$7, DW_AT_decl_file("/usr/share/ti/cgt-pru/include/stdlib.h")
	.dwattr $C$DW$7, DW_AT_decl_line(0x91)
	.dwattr $C$DW$7, DW_AT_decl_column(0x19)
$C$DW$8	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$8, DW_AT_type(*$C$DW$T$281)
	.dwendtag $C$DW$7

	.weak	||CT_CFG||
||CT_CFG||:	.usect	".creg.PRU_CFG.noload.near",68,1
$C$DW$9	.dwtag  DW_TAG_variable, DW_AT_name("CT_CFG")
	.dwattr $C$DW$9, DW_AT_TI_symbol_name("CT_CFG")
	.dwattr $C$DW$9, DW_AT_location[DW_OP_addr ||CT_CFG||]
	.dwattr $C$DW$9, DW_AT_type(*$C$DW$T$267)
	.dwattr $C$DW$9, DW_AT_external
	.dwattr $C$DW$9, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$9, DW_AT_decl_line(0xf2)
	.dwattr $C$DW$9, DW_AT_decl_column(0x17)
	.weak	||CT_INTC||
||CT_INTC||:	.usect	".creg.PRU_INTC.noload.far",5380,1
$C$DW$10	.dwtag  DW_TAG_variable, DW_AT_name("CT_INTC")
	.dwattr $C$DW$10, DW_AT_TI_symbol_name("CT_INTC")
	.dwattr $C$DW$10, DW_AT_location[DW_OP_addr ||CT_INTC||]
	.dwattr $C$DW$10, DW_AT_type(*$C$DW$T$277)
	.dwattr $C$DW$10, DW_AT_external
	.dwattr $C$DW$10, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$10, DW_AT_decl_line(0x389)
	.dwattr $C$DW$10, DW_AT_decl_column(0x18)
	.global	||pru_remoteproc_ResourceTable||
	.sect	".resource_table:retain", RW
	.retain
	.align	1
	.elfsym	||pru_remoteproc_ResourceTable||,SYM_SIZE(20)
||pru_remoteproc_ResourceTable||:
	.bits	1,32			; pru_remoteproc_ResourceTable.base.ver @ 0
	.bits	0,32			; pru_remoteproc_ResourceTable.base.num @ 32
	.bits	0,32			; pru_remoteproc_ResourceTable.base.reserved[0] @ 64
	.bits	0,32			; pru_remoteproc_ResourceTable.base.reserved[1] @ 96
	.bits	0,32			; pru_remoteproc_ResourceTable.offset[0] @ 128

$C$DW$11	.dwtag  DW_TAG_variable, DW_AT_name("pru_remoteproc_ResourceTable")
	.dwattr $C$DW$11, DW_AT_TI_symbol_name("pru_remoteproc_ResourceTable")
	.dwattr $C$DW$11, DW_AT_location[DW_OP_addr ||pru_remoteproc_ResourceTable||]
	.dwattr $C$DW$11, DW_AT_type(*$C$DW$T$260)
	.dwattr $C$DW$11, DW_AT_external
	.dwattr $C$DW$11, DW_AT_decl_file("resource_table_empty.h")
	.dwattr $C$DW$11, DW_AT_decl_line(0x40)
	.dwattr $C$DW$11, DW_AT_decl_column(0x1a)
;	/usr/bin/optpru /tmp/TI1aksAv1mr /tmp/TI1akqOxjCI 
;	/usr/bin/acpiapru -@/tmp/TI1akB2m5LG 
	.sect	".text:initPRU"
	.clink
	.global	||initPRU||

$C$DW$12	.dwtag  DW_TAG_subprogram, DW_AT_name("initPRU")
	.dwattr $C$DW$12, DW_AT_low_pc(||initPRU||)
	.dwattr $C$DW$12, DW_AT_high_pc(0x00)
	.dwattr $C$DW$12, DW_AT_TI_symbol_name("initPRU")
	.dwattr $C$DW$12, DW_AT_external
	.dwattr $C$DW$12, DW_AT_TI_begin_file("pru_fw.c")
	.dwattr $C$DW$12, DW_AT_TI_begin_line(0x68)
	.dwattr $C$DW$12, DW_AT_TI_begin_column(0x06)
	.dwattr $C$DW$12, DW_AT_decl_file("pru_fw.c")
	.dwattr $C$DW$12, DW_AT_decl_line(0x68)
	.dwattr $C$DW$12, DW_AT_decl_column(0x06)
	.dwattr $C$DW$12, DW_AT_TI_max_frame_size(0x00)
	.dwpsn	file "pru_fw.c",line 104,column 16,is_stmt,address ||initPRU||,isa 0

	.dwfde $C$DW$CIE, ||initPRU||

;***************************************************************
;* FNAME: initPRU                       FR SIZE:   0           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                            0 Auto,  0 SOE     *
;***************************************************************

||initPRU||:
;* --------------------------------------------------------------------------*
;* r1_0  assigned to $O$C1
;* r0_0  assigned to $O$C2
;* r15_0 assigned to $O$C3
;* r14_0 assigned to $O$C4
;* r0_0  assigned to $O$C5
;* r0_0  assigned to $O$C6
;* r0_0  assigned to $O$C7
;* r0_0  assigned to $O$C8
	.dwcfi	cfa_offset, 0
	.dwpsn	file "pru_fw.c",line 108,column 3,is_stmt,isa 0
        LDI32     r0, ||CT_CFG||        ; [ALU_PRU] |108| $O$C8,CT_CFG
        LBBO      &r1, r0, 4, 4         ; [ALU_PRU] |108| $O$C8
	.dwpsn	file "pru_fw.c",line 123,column 3,is_stmt,isa 0
        LDI32     r15, 0x01ff0000       ; [ALU_PRU] |123| $O$C3
	.dwpsn	file "pru_fw.c",line 108,column 3,is_stmt,isa 0
        CLR       r1, r1, 0x00000004    ; [ALU_PRU] |108| 
        SBBO      &r1, r0, 4, 4         ; [ALU_PRU] |108| $O$C8
	.dwpsn	file "pru_fw.c",line 115,column 3,is_stmt,isa 0
        LDI32     r1, 0xfffffffc        ; [ALU_PRU] |115| 
        LBBO      &r14, r0, 8, 4        ; [ALU_PRU] |115| $O$C8
        AND       r1, r14, r1           ; [ALU_PRU] |115| 
        SBBO      &r1, r0, 8, 4         ; [ALU_PRU] |115| $O$C8
	.dwpsn	file "pru_fw.c",line 123,column 3,is_stmt,isa 0
        LDI32     r1, ||CT_INTC||       ; [ALU_PRU] |123| $O$C1,CT_INTC
        LDI       r0, 0x0d00            ; [ALU_PRU] |123| 
        ADD       r0, r1, r0            ; [ALU_PRU] |123| $O$C7,$O$C1
        LBBO      &r14, r0, 0, 4        ; [ALU_PRU] |123| $O$C7
        SBBO      &r15, r0, 0, 4        ; [ALU_PRU] |123| $O$C7,$O$C3
	.dwpsn	file "pru_fw.c",line 124,column 3,is_stmt,isa 0
        LBBO      &r14, r0, 128, 4      ; [ALU_PRU] |124| $O$C7
        LDI       r14, 0x0000           ; [ALU_PRU] |124| 
        SBBO      &r14, r0, 128, 4      ; [ALU_PRU] |124| $O$C7
	.dwpsn	file "pru_fw.c",line 135,column 3,is_stmt,isa 0
        LDI32     r14, 0xfffffff0       ; [ALU_PRU] |135| 
        LDI32     r0, ||CT_INTC||+1040  ; [ALU_PRU] |135| $O$C6,CT_INTC
        LBBO      &r16, r0, 0, 4        ; [ALU_PRU] |135| $O$C6
        AND       r14, r16, r14         ; [ALU_PRU] |135| 
        SET       r14, r14, 0x00000001  ; [ALU_PRU] |135| 
        SBBO      &r14, r0, 0, 4        ; [ALU_PRU] |135| $O$C6
	.dwpsn	file "pru_fw.c",line 136,column 3,is_stmt,isa 0
        LDI32     r14, 0xfffff3ff       ; [ALU_PRU] |136| 
        LBBO      &r16, r0, 0, 4        ; [ALU_PRU] |136| $O$C6
        AND       r16, r16, r14         ; [ALU_PRU] |136| 
        LDI       r14, 0x0300           ; [ALU_PRU] |136| 
        OR        r14, r16, r14         ; [ALU_PRU] |136| 
        SBBO      &r14, r0, 0, 4        ; [ALU_PRU] |136| $O$C6
	.dwpsn	file "pru_fw.c",line 137,column 3,is_stmt,isa 0
        LDI32     r14, 0xfff0ffff       ; [ALU_PRU] |137| 
        LBBO      &r16, r0, 0, 4        ; [ALU_PRU] |137| $O$C6
        AND       r14, r16, r14         ; [ALU_PRU] |137| 
        SET       r14, r14, 0x00000012  ; [ALU_PRU] |137| 
        SBBO      &r14, r0, 0, 4        ; [ALU_PRU] |137| $O$C6
	.dwpsn	file "pru_fw.c",line 138,column 3,is_stmt,isa 0
        LDI32     r14, 0xf1ffffff       ; [ALU_PRU] |138| 
        LBBO      &r16, r0, 0, 4        ; [ALU_PRU] |138| $O$C6
        AND       r16, r16, r14         ; [ALU_PRU] |138| 
        LDI32     r14, 0x05000000       ; [ALU_PRU] |138| 
        OR        r14, r16, r14         ; [ALU_PRU] |138| 
        SBBO      &r14, r0, 0, 4        ; [ALU_PRU] |138| $O$C6
	.dwpsn	file "pru_fw.c",line 139,column 3,is_stmt,isa 0
        LDI32     r14, 0xfffffff0       ; [ALU_PRU] |139| 
        LBBO      &r16, r0, 4, 4        ; [ALU_PRU] |139| $O$C6
        AND       r14, r16, r14         ; [ALU_PRU] |139| 
        OR        r14, r14, 0x06        ; [ALU_PRU] |139| 
        SBBO      &r14, r0, 4, 4        ; [ALU_PRU] |139| $O$C6
	.dwpsn	file "pru_fw.c",line 140,column 3,is_stmt,isa 0
        LDI       r14, 0x0700           ; [ALU_PRU] |140| 
        LBBO      &r16, r0, 4, 4        ; [ALU_PRU] |140| $O$C6
        CLR       r16, r16, 0x0000000b  ; [ALU_PRU] |140| 
        OR        r14, r16, r14         ; [ALU_PRU] |140| 
        SBBO      &r14, r0, 4, 4        ; [ALU_PRU] |140| $O$C6
	.dwpsn	file "pru_fw.c",line 141,column 3,is_stmt,isa 0
        LDI32     r14, 0xfff8ffff       ; [ALU_PRU] |141| 
        LBBO      &r16, r0, 4, 4        ; [ALU_PRU] |141| $O$C6
        AND       r14, r16, r14         ; [ALU_PRU] |141| 
        SET       r14, r14, 0x00000013  ; [ALU_PRU] |141| 
        SBBO      &r14, r0, 4, 4        ; [ALU_PRU] |141| $O$C6
	.dwpsn	file "pru_fw.c",line 142,column 3,is_stmt,isa 0
        LDI32     r14, 0xf9ffffff       ; [ALU_PRU] |142| 
        LBBO      &r16, r0, 4, 4        ; [ALU_PRU] |142| $O$C6
        AND       r16, r16, r14         ; [ALU_PRU] |142| 
        LDI32     r14, 0x09000000       ; [ALU_PRU] |142| 
        OR        r14, r16, r14         ; [ALU_PRU] |142| 
        SBBO      &r14, r0, 4, 4        ; [ALU_PRU] |142| $O$C6
	.dwpsn	file "pru_fw.c",line 143,column 3,is_stmt,isa 0
        LDI32     r14, 0xfffffff0       ; [ALU_PRU] |143| 
        LBBO      &r16, r0, 8, 4        ; [ALU_PRU] |143| $O$C6
        AND       r14, r16, r14         ; [ALU_PRU] |143| 
        SET       r14, r14, 0x00000000  ; [ALU_PRU] |143| 
        SBBO      &r14, r0, 8, 4        ; [ALU_PRU] |143| $O$C6
	.dwpsn	file "pru_fw.c",line 146,column 3,is_stmt,isa 0
        LDI32     r14, 0xfffff1ff       ; [ALU_PRU] |146| 
        LDI32     r0, ||CT_INTC||+2048  ; [ALU_PRU] |146| $O$C5,CT_INTC
        LBBO      &r16, r0, 0, 4        ; [ALU_PRU] |146| $O$C5
        AND       r14, r16, r14         ; [ALU_PRU] |146| 
        SET       r14, r14, 0x00000008  ; [ALU_PRU] |146| 
        SBBO      &r14, r0, 0, 4        ; [ALU_PRU] |146| $O$C5
	.dwpsn	file "pru_fw.c",line 147,column 3,is_stmt,isa 0
        LDI32     r14, 0xfff0ffff       ; [ALU_PRU] |147| 
        LBBO      &r16, r0, 0, 4        ; [ALU_PRU] |147| $O$C5
        AND       r14, r16, r14         ; [ALU_PRU] |147| 
        SET       r14, r14, 0x00000011  ; [ALU_PRU] |147| 
        SBBO      &r14, r0, 0, 4        ; [ALU_PRU] |147| $O$C5
	.dwpsn	file "pru_fw.c",line 148,column 3,is_stmt,isa 0
        LDI32     r14, 0xf3ffffff       ; [ALU_PRU] |148| 
        LBBO      &r16, r0, 0, 4        ; [ALU_PRU] |148| $O$C5
        AND       r16, r16, r14         ; [ALU_PRU] |148| 
        LDI32     r14, 0x03000000       ; [ALU_PRU] |148| 
        OR        r14, r16, r14         ; [ALU_PRU] |148| 
        SBBO      &r14, r0, 0, 4        ; [ALU_PRU] |148| $O$C5
	.dwpsn	file "pru_fw.c",line 149,column 3,is_stmt,isa 0
        LDI32     r14, 0xfffffff0       ; [ALU_PRU] |149| 
        LBBO      &r16, r0, 4, 4        ; [ALU_PRU] |149| $O$C5
        AND       r14, r16, r14         ; [ALU_PRU] |149| 
        SET       r14, r14, 0x00000002  ; [ALU_PRU] |149| 
        SBBO      &r14, r0, 4, 4        ; [ALU_PRU] |149| $O$C5
	.dwpsn	file "pru_fw.c",line 150,column 3,is_stmt,isa 0
        LDI32     r14, 0xfffff1ff       ; [ALU_PRU] |150| 
        LBBO      &r16, r0, 4, 4        ; [ALU_PRU] |150| $O$C5
        AND       r16, r16, r14         ; [ALU_PRU] |150| 
        LDI       r14, 0x0500           ; [ALU_PRU] |150| 
        OR        r14, r16, r14         ; [ALU_PRU] |150| 
        SBBO      &r14, r0, 4, 4        ; [ALU_PRU] |150| $O$C5
	.dwpsn	file "pru_fw.c",line 151,column 3,is_stmt,isa 0
        LDI32     r14, 0xfff0ffff       ; [ALU_PRU] |151| 
        LBBO      &r16, r0, 4, 4        ; [ALU_PRU] |151| $O$C5
        AND       r16, r16, r14         ; [ALU_PRU] |151| 
        LDI32     r14, 0x00060000       ; [ALU_PRU] |151| 
        OR        r14, r16, r14         ; [ALU_PRU] |151| 
        SBBO      &r14, r0, 4, 4        ; [ALU_PRU] |151| $O$C5
	.dwpsn	file "pru_fw.c",line 152,column 3,is_stmt,isa 0
        LDI32     r14, 0x07000000       ; [ALU_PRU] |152| 
        LBBO      &r16, r0, 4, 4        ; [ALU_PRU] |152| $O$C5
        CLR       r16, r16, 0x0000001b  ; [ALU_PRU] |152| 
        OR        r14, r16, r14         ; [ALU_PRU] |152| 
        SBBO      &r14, r0, 4, 4        ; [ALU_PRU] |152| $O$C5
	.dwpsn	file "pru_fw.c",line 153,column 3,is_stmt,isa 0
        LDI32     r14, 0xfffffff8       ; [ALU_PRU] |153| 
        LBBO      &r16, r0, 8, 4        ; [ALU_PRU] |153| $O$C5
        AND       r14, r16, r14         ; [ALU_PRU] |153| 
        SET       r14, r14, 0x00000003  ; [ALU_PRU] |153| 
        SBBO      &r14, r0, 8, 4        ; [ALU_PRU] |153| $O$C5
	.dwpsn	file "pru_fw.c",line 154,column 3,is_stmt,isa 0
        LDI32     r14, 0xfffff9ff       ; [ALU_PRU] |154| 
        LBBO      &r16, r0, 8, 4        ; [ALU_PRU] |154| $O$C5
        AND       r16, r16, r14         ; [ALU_PRU] |154| 
        LDI       r14, 0x0900           ; [ALU_PRU] |154| 
        OR        r14, r16, r14         ; [ALU_PRU] |154| 
        SBBO      &r14, r0, 8, 4        ; [ALU_PRU] |154| $O$C5
	.dwpsn	file "pru_fw.c",line 157,column 3,is_stmt,isa 0
        FILL      &r14, 4               ; [ALU_PRU] |157| 
        LDI32     r0, ||CT_INTC||+640   ; [ALU_PRU] |157| $O$C2,CT_INTC
        LBBO      &r16, r0, 0, 4        ; [ALU_PRU] |157| $O$C2
        OR        r14, r16, r14         ; [ALU_PRU] |157| 
        SBBO      &r14, r0, 0, 4        ; [ALU_PRU] |157| $O$C2
	.dwpsn	file "pru_fw.c",line 158,column 3,is_stmt,isa 0
        FILL      &r14, 4               ; [ALU_PRU] |158| 
        LBBO      &r16, r0, 4, 4        ; [ALU_PRU] |158| $O$C2
        OR        r14, r16, r14         ; [ALU_PRU] |158| 
	.dwpsn	file "pru_fw.c",line 164,column 3,is_stmt,isa 0
        LDI       r16, 0x03fe           ; [ALU_PRU] |164| 
	.dwpsn	file "pru_fw.c",line 158,column 3,is_stmt,isa 0
        SBBO      &r14, r0, 4, 4        ; [ALU_PRU] |158| $O$C2
	.dwpsn	file "pru_fw.c",line 164,column 3,is_stmt,isa 0
        LDI32     r14, ||CT_INTC||+5376 ; [ALU_PRU] |164| $O$C4,CT_INTC
        LBBO      &r17, r14, 0, 4       ; [ALU_PRU] |164| $O$C4
        CLR       r17, r17, 0x00000000  ; [ALU_PRU] |164| 
        OR        r16, r17, r16         ; [ALU_PRU] |164| 
        SBBO      &r16, r14, 0, 4       ; [ALU_PRU] |164| $O$C4
	.dwpsn	file "pru_fw.c",line 167,column 3,is_stmt,isa 0
        LBBO      &r14, r0, 128, 4      ; [ALU_PRU] |167| $O$C2
        SBBO      &r15, r0, 128, 4      ; [ALU_PRU] |167| $O$C2,$O$C3
	.dwpsn	file "pru_fw.c",line 170,column 3,is_stmt,isa 0
        LBBO      &r0, r1, 16, 4        ; [ALU_PRU] |170| $O$C1
        SET       r0, r0, 0x00000000    ; [ALU_PRU] |170| 
        SBBO      &r0, r1, 16, 4        ; [ALU_PRU] |170| $O$C1
$C$DW$13	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$13, DW_AT_low_pc(0x00)
	.dwattr $C$DW$13, DW_AT_TI_return
        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$12, DW_AT_TI_end_file("pru_fw.c")
	.dwattr $C$DW$12, DW_AT_TI_end_line(0xb4)
	.dwattr $C$DW$12, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$12

	.sect	".text:main"
	.clink
	.global	||main||

$C$DW$14	.dwtag  DW_TAG_subprogram, DW_AT_name("main")
	.dwattr $C$DW$14, DW_AT_low_pc(||main||)
	.dwattr $C$DW$14, DW_AT_high_pc(0x00)
	.dwattr $C$DW$14, DW_AT_TI_symbol_name("main")
	.dwattr $C$DW$14, DW_AT_external
	.dwattr $C$DW$14, DW_AT_TI_begin_file("pru_fw.c")
	.dwattr $C$DW$14, DW_AT_TI_begin_line(0x1e)
	.dwattr $C$DW$14, DW_AT_TI_begin_column(0x06)
	.dwattr $C$DW$14, DW_AT_decl_file("pru_fw.c")
	.dwattr $C$DW$14, DW_AT_decl_line(0x1e)
	.dwattr $C$DW$14, DW_AT_decl_column(0x06)
	.dwattr $C$DW$14, DW_AT_TI_max_frame_size(0x10)
	.dwpsn	file "pru_fw.c",line 31,column 1,is_stmt,address ||main||,isa 0

	.dwfde $C$DW$CIE, ||main||

;***************************************************************
;* FNAME: main                          FR SIZE:  16           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                            0 Auto, 16 SOE     *
;***************************************************************

||main||:
;* --------------------------------------------------------------------------*
;* r5_0  assigned to base
$C$DW$15	.dwtag  DW_TAG_variable, DW_AT_name("base")
	.dwattr $C$DW$15, DW_AT_TI_symbol_name("base")
	.dwattr $C$DW$15, DW_AT_type(*$C$DW$T$290)
	.dwattr $C$DW$15, DW_AT_location[DW_OP_reg20]
;* r4_0  assigned to buf
$C$DW$16	.dwtag  DW_TAG_variable, DW_AT_name("buf")
	.dwattr $C$DW$16, DW_AT_TI_symbol_name("buf")
	.dwattr $C$DW$16, DW_AT_type(*$C$DW$T$295)
	.dwattr $C$DW$16, DW_AT_location[DW_OP_reg16]
;* r14_0 assigned to $O$L2
;* r7_0  assigned to $O$L1
;* r1_0  assigned to $O$U30
;* r6_0  assigned to $O$K9
	.dwcfi	cfa_offset, 0
        SUB       r2, r2, 0x10          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 16
        SBBO      &r3.b2, r2, 0, 16     ; [ALU_PRU] 
	.dwcfi	save_reg_to_mem, 14, -16
	.dwcfi	save_reg_to_mem, 15, -15
	.dwcfi	save_reg_to_mem, 16, -14
	.dwcfi	save_reg_to_mem, 17, -13
	.dwcfi	save_reg_to_mem, 18, -12
	.dwcfi	save_reg_to_mem, 19, -11
	.dwcfi	save_reg_to_mem, 20, -10
	.dwcfi	save_reg_to_mem, 21, -9
	.dwcfi	save_reg_to_mem, 22, -8
	.dwcfi	save_reg_to_mem, 23, -7
	.dwcfi	save_reg_to_mem, 24, -6
	.dwcfi	save_reg_to_mem, 25, -5
	.dwcfi	save_reg_to_mem, 26, -4
	.dwcfi	save_reg_to_mem, 27, -3
	.dwcfi	save_reg_to_mem, 28, -2
	.dwcfi	save_reg_to_mem, 29, -1
	.dwpsn	file "pru_fw.c",line 33,column 3,is_stmt,isa 0
$C$DW$17	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$17, DW_AT_low_pc(0x00)
	.dwattr $C$DW$17, DW_AT_name("initPRU")
	.dwattr $C$DW$17, DW_AT_TI_call
        JAL       r3.w2, ||initPRU||    ; [ALU_PRU] |33| initPRU
	.dwpsn	file "pru_fw.c",line 55,column 3,is_stmt,isa 0
        LDI       r14, 0x0500           ; [ALU_PRU] |55| 
$C$DW$18	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$18, DW_AT_low_pc(0x00)
	.dwattr $C$DW$18, DW_AT_name("malloc")
	.dwattr $C$DW$18, DW_AT_TI_call
        JAL       r3.w2, ||malloc||     ; [ALU_PRU] |55| malloc
        LDI32     r6, ||CT_INTC||+640   ; [ALU_PRU] $O$K9,CT_INTC
        MOV       r4, r14               ; [ALU_PRU] |55| buf
;* --------------------------------------------------------------------------*
;*   BEGIN LOOP ||$C$L1||
;*
;*   Loop source line                : 57
;*   Loop closing brace source line  : 101
;*   Known Minimum Trip Count        : 1
;*   Known Maximum Trip Count        : 4294967295
;*   Known Max Trip Count Factor     : 1
;* --------------------------------------------------------------------------*
||$C$L1||:    
	.dwpsn	file "pru_fw.c",line 61,column 5,is_stmt,isa 0
        NOP       ; [ALU_PRU] |61| 
;* --------------------------------------------------------------------------*
;*   BEGIN LOOP ||$C$L2||
;*
;*   Loop source line                : 64
;*   Loop closing brace source line  : 64
;*   Known Minimum Trip Count        : 1
;*   Known Maximum Trip Count        : 4294967295
;*   Known Max Trip Count Factor     : 1
;* --------------------------------------------------------------------------*
||$C$L2||:    
	.dwpsn	file "pru_fw.c",line 64,column 11,is_stmt,isa 0
        QBBC      ||$C$L2||, r31, 0x1f  ; [ALU_PRU] |64| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "pru_fw.c",line 67,column 5,is_stmt,isa 0
        FILL      &r0, 4                ; [ALU_PRU] |67| 
        LBBO      &r1, r6, 0, 4         ; [ALU_PRU] |67| $O$K9
        OR        r0, r1, r0            ; [ALU_PRU] |67| 
        SBBO      &r0, r6, 0, 4         ; [ALU_PRU] |67| $O$K9
	.dwpsn	file "pru_fw.c",line 72,column 5,is_stmt,isa 0
        LDI32     r0, 0x00010000        ; [ALU_PRU] |72| 
        LBBO      &r5, r0, 0, 4         ; [ALU_PRU] |72| base
;* --------------------------------------------------------------------------*
;*   BEGIN LOOP ||$C$L3||
;*
;*   Loop source line                : 74
;*   Loop closing brace source line  : 74
;*   Known Minimum Trip Count        : 1
;*   Known Maximum Trip Count        : 4294967295
;*   Known Max Trip Count Factor     : 1
;* --------------------------------------------------------------------------*
||$C$L3||:    
	.dwpsn	file "pru_fw.c",line 74,column 5,is_stmt,isa 0
        QBBS      ||$C$L3||, r31, 0x0f  ; [ALU_PRU] |74| 
;* --------------------------------------------------------------------------*
;*   BEGIN LOOP ||$C$L4||
;*
;*   Loop source line                : 75
;*   Loop closing brace source line  : 75
;*   Known Minimum Trip Count        : 1
;*   Known Maximum Trip Count        : 4294967295
;*   Known Max Trip Count Factor     : 1
;* --------------------------------------------------------------------------*
||$C$L4||:    
	.dwpsn	file "pru_fw.c",line 75,column 11,is_stmt,isa 0
        QBBC      ||$C$L4||, r31, 0x0f  ; [ALU_PRU] |75| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "pru_fw.c",line 77,column 20,is_stmt,isa 0
        LDI       r7.w0, 0x03c0         ; [ALU_PRU] |77| $O$L1
;* --------------------------------------------------------------------------*
;*   BEGIN LOOP ||$C$L5||
;*
;*   Loop source line                : 79
;*   Loop closing brace source line  : 79
;*   Known Minimum Trip Count        : 1
;*   Known Maximum Trip Count        : 4294967295
;*   Known Max Trip Count Factor     : 1
;* --------------------------------------------------------------------------*
||$C$L5||:    
	.dwpsn	file "pru_fw.c",line 79,column 13,is_stmt,isa 0
        QBBC      ||$C$L5||, r31, 0x0e  ; [ALU_PRU] |79| 
;* --------------------------------------------------------------------------*
        MOV       r1, r4                ; [ALU_PRU] $O$U30,buf
	.dwpsn	file "pru_fw.c",line 82,column 21,is_stmt,isa 0
        LDI       r14.w0, 0x0500        ; [ALU_PRU] |82| $O$L2
;* --------------------------------------------------------------------------*
;*   BEGIN LOOP ||$C$L6||
;*
;*   Loop source line                : 84
;*   Loop closing brace source line  : 84
;*   Known Minimum Trip Count        : 1
;*   Known Maximum Trip Count        : 4294967295
;*   Known Max Trip Count Factor     : 1
;* --------------------------------------------------------------------------*
||$C$L6||:    
	.dwpsn	file "pru_fw.c",line 84,column 15,is_stmt,isa 0
        QBBC      ||$C$L6||, r31, 0x10  ; [ALU_PRU] |84| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "pru_fw.c",line 87,column 9,is_stmt,isa 0
        MOV       r0, r31               ; [ALU_PRU] |87| 
        SBBO      &r0.b0, r1, 0, 1      ; [ALU_PRU] |87| $O$U30
;* --------------------------------------------------------------------------*
;*   BEGIN LOOP ||$C$L7||
;*
;*   Loop source line                : 89
;*   Loop closing brace source line  : 89
;*   Known Minimum Trip Count        : 1
;*   Known Maximum Trip Count        : 4294967295
;*   Known Max Trip Count Factor     : 1
;* --------------------------------------------------------------------------*
||$C$L7||:    
	.dwpsn	file "pru_fw.c",line 89,column 9,is_stmt,isa 0
        QBBS      ||$C$L7||, r31, 0x10  ; [ALU_PRU] |89| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "pru_fw.c",line 82,column 21,is_stmt,isa 0
        SUB       r14.w0, r14.w0, 0x01  ; [ALU_PRU] |82| $O$L2,$O$L2
        ADD       r1, r1, 0x01          ; [ALU_PRU] |82| $O$U30,$O$U30
        QBNE      ||$C$L6||, r14.w0, 0x00 ; [ALU_PRU] |82| $O$L2
;* --------------------------------------------------------------------------*
	.dwpsn	file "pru_fw.c",line 93,column 7,is_stmt,isa 0
        MOV       r14, r5               ; [ALU_PRU] |93| base
        MOV       r15, r4               ; [ALU_PRU] |93| buf
        LDI       r16, 0x0500           ; [ALU_PRU] |93| 
$C$DW$19	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$19, DW_AT_low_pc(0x00)
	.dwattr $C$DW$19, DW_AT_name("memcpy")
	.dwattr $C$DW$19, DW_AT_TI_call
        JAL       r3.w2, ||memcpy||     ; [ALU_PRU] |93| memcpy
	.dwpsn	file "pru_fw.c",line 77,column 20,is_stmt,isa 0
        SUB       r7.w0, r7.w0, 0x01    ; [ALU_PRU] |77| $O$L1,$O$L1
	.dwpsn	file "pru_fw.c",line 96,column 7,is_stmt,isa 0
        LDI       r0, 0x0500            ; [ALU_PRU] |96| 
        ADD       r5, r5, r0            ; [ALU_PRU] |96| base,base
	.dwpsn	file "pru_fw.c",line 77,column 20,is_stmt,isa 0
        QBNE      ||$C$L5||, r7.w0, 0x00 ; [ALU_PRU] |77| $O$L1
;* --------------------------------------------------------------------------*
	.dwpsn	file "pru_fw.c",line 100,column 5,is_stmt,isa 0
        LDI       r31, 0x0024           ; [ALU_PRU] |100| 
	.dwpsn	file "pru_fw.c",line 57,column 9,is_stmt,isa 0
        JMP       ||$C$L1||             ; [ALU_PRU] |57| 
	.dwattr $C$DW$14, DW_AT_TI_end_file("pru_fw.c")
	.dwattr $C$DW$14, DW_AT_TI_end_line(0x66)
	.dwattr $C$DW$14, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$14

;*****************************************************************************
;* UNDEFINED EXTERNAL REFERENCES                                             *
;*****************************************************************************
	.global	||malloc||
	.global	||memcpy||

;******************************************************************************
;* TYPE INFORMATION                                                           *
;******************************************************************************

$C$DW$T$19	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$19, DW_AT_byte_size(0x04)
$C$DW$20	.dwtag  DW_TAG_member
	.dwattr $C$DW$20, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$20, DW_AT_name("REVID")
	.dwattr $C$DW$20, DW_AT_TI_symbol_name("REVID")
	.dwattr $C$DW$20, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x20)
	.dwattr $C$DW$20, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$20, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$20, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$20, DW_AT_decl_line(0x2d)
	.dwattr $C$DW$20, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$19

	.dwattr $C$DW$T$19, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$19, DW_AT_decl_line(0x2c)
	.dwattr $C$DW$T$19, DW_AT_decl_column(0x13)
$C$DW$T$108	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$108, DW_AT_type(*$C$DW$T$19)

$C$DW$T$20	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$20, DW_AT_byte_size(0x04)
$C$DW$21	.dwtag  DW_TAG_member
	.dwattr $C$DW$21, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$21, DW_AT_name("IDLE_MODE")
	.dwattr $C$DW$21, DW_AT_TI_symbol_name("IDLE_MODE")
	.dwattr $C$DW$21, DW_AT_bit_offset(0x1e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$21, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$21, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$21, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$21, DW_AT_decl_line(0x37)
	.dwattr $C$DW$21, DW_AT_decl_column(0x0d)
$C$DW$22	.dwtag  DW_TAG_member
	.dwattr $C$DW$22, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$22, DW_AT_name("STANDBY_MODE")
	.dwattr $C$DW$22, DW_AT_TI_symbol_name("STANDBY_MODE")
	.dwattr $C$DW$22, DW_AT_bit_offset(0x1c), DW_AT_bit_size(0x02)
	.dwattr $C$DW$22, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$22, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$22, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$22, DW_AT_decl_line(0x38)
	.dwattr $C$DW$22, DW_AT_decl_column(0x0d)
$C$DW$23	.dwtag  DW_TAG_member
	.dwattr $C$DW$23, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$23, DW_AT_name("STANDBY_INIT")
	.dwattr $C$DW$23, DW_AT_TI_symbol_name("STANDBY_INIT")
	.dwattr $C$DW$23, DW_AT_bit_offset(0x1b), DW_AT_bit_size(0x01)
	.dwattr $C$DW$23, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$23, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$23, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$23, DW_AT_decl_line(0x39)
	.dwattr $C$DW$23, DW_AT_decl_column(0x0d)
$C$DW$24	.dwtag  DW_TAG_member
	.dwattr $C$DW$24, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$24, DW_AT_name("SUB_MWAIT")
	.dwattr $C$DW$24, DW_AT_TI_symbol_name("SUB_MWAIT")
	.dwattr $C$DW$24, DW_AT_bit_offset(0x1a), DW_AT_bit_size(0x01)
	.dwattr $C$DW$24, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$24, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$24, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$24, DW_AT_decl_line(0x3a)
	.dwattr $C$DW$24, DW_AT_decl_column(0x0d)
$C$DW$25	.dwtag  DW_TAG_member
	.dwattr $C$DW$25, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$25, DW_AT_name("rsvd6")
	.dwattr $C$DW$25, DW_AT_TI_symbol_name("rsvd6")
	.dwattr $C$DW$25, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x1a)
	.dwattr $C$DW$25, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$25, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$25, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$25, DW_AT_decl_line(0x3b)
	.dwattr $C$DW$25, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$20

	.dwattr $C$DW$T$20, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$20, DW_AT_decl_line(0x36)
	.dwattr $C$DW$T$20, DW_AT_decl_column(0x13)
$C$DW$T$110	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$110, DW_AT_type(*$C$DW$T$20)

$C$DW$T$21	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$21, DW_AT_byte_size(0x04)
$C$DW$26	.dwtag  DW_TAG_member
	.dwattr $C$DW$26, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$26, DW_AT_name("PRU0_GPI_MODE")
	.dwattr $C$DW$26, DW_AT_TI_symbol_name("PRU0_GPI_MODE")
	.dwattr $C$DW$26, DW_AT_bit_offset(0x1e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$26, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$26, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$26, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$26, DW_AT_decl_line(0x45)
	.dwattr $C$DW$26, DW_AT_decl_column(0x0d)
$C$DW$27	.dwtag  DW_TAG_member
	.dwattr $C$DW$27, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$27, DW_AT_name("PRU0_GPI_CLK_MODE")
	.dwattr $C$DW$27, DW_AT_TI_symbol_name("PRU0_GPI_CLK_MODE")
	.dwattr $C$DW$27, DW_AT_bit_offset(0x1d), DW_AT_bit_size(0x01)
	.dwattr $C$DW$27, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$27, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$27, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$27, DW_AT_decl_line(0x46)
	.dwattr $C$DW$27, DW_AT_decl_column(0x0d)
$C$DW$28	.dwtag  DW_TAG_member
	.dwattr $C$DW$28, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$28, DW_AT_name("PRU0_GPI_DIV0")
	.dwattr $C$DW$28, DW_AT_TI_symbol_name("PRU0_GPI_DIV0")
	.dwattr $C$DW$28, DW_AT_bit_offset(0x18), DW_AT_bit_size(0x05)
	.dwattr $C$DW$28, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$28, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$28, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$28, DW_AT_decl_line(0x47)
	.dwattr $C$DW$28, DW_AT_decl_column(0x0d)
$C$DW$29	.dwtag  DW_TAG_member
	.dwattr $C$DW$29, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$29, DW_AT_name("PRU0_GPI_DIV1")
	.dwattr $C$DW$29, DW_AT_TI_symbol_name("PRU0_GPI_DIV1")
	.dwattr $C$DW$29, DW_AT_bit_offset(0x13), DW_AT_bit_size(0x05)
	.dwattr $C$DW$29, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$29, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$29, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$29, DW_AT_decl_line(0x48)
	.dwattr $C$DW$29, DW_AT_decl_column(0x0d)
$C$DW$30	.dwtag  DW_TAG_member
	.dwattr $C$DW$30, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$30, DW_AT_name("PRU0_GPI_SB")
	.dwattr $C$DW$30, DW_AT_TI_symbol_name("PRU0_GPI_SB")
	.dwattr $C$DW$30, DW_AT_bit_offset(0x12), DW_AT_bit_size(0x01)
	.dwattr $C$DW$30, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$30, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$30, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$30, DW_AT_decl_line(0x49)
	.dwattr $C$DW$30, DW_AT_decl_column(0x0d)
$C$DW$31	.dwtag  DW_TAG_member
	.dwattr $C$DW$31, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$31, DW_AT_name("PRU0_GPO_MODE")
	.dwattr $C$DW$31, DW_AT_TI_symbol_name("PRU0_GPO_MODE")
	.dwattr $C$DW$31, DW_AT_bit_offset(0x11), DW_AT_bit_size(0x01)
	.dwattr $C$DW$31, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$31, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$31, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$31, DW_AT_decl_line(0x4a)
	.dwattr $C$DW$31, DW_AT_decl_column(0x0d)
$C$DW$32	.dwtag  DW_TAG_member
	.dwattr $C$DW$32, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$32, DW_AT_name("PRU0_GPO_DIV0")
	.dwattr $C$DW$32, DW_AT_TI_symbol_name("PRU0_GPO_DIV0")
	.dwattr $C$DW$32, DW_AT_bit_offset(0x0c), DW_AT_bit_size(0x05)
	.dwattr $C$DW$32, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$32, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$32, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$32, DW_AT_decl_line(0x4b)
	.dwattr $C$DW$32, DW_AT_decl_column(0x0d)
$C$DW$33	.dwtag  DW_TAG_member
	.dwattr $C$DW$33, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$33, DW_AT_name("PRU0_GPO_DIV1")
	.dwattr $C$DW$33, DW_AT_TI_symbol_name("PRU0_GPO_DIV1")
	.dwattr $C$DW$33, DW_AT_bit_offset(0x07), DW_AT_bit_size(0x05)
	.dwattr $C$DW$33, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$33, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$33, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$33, DW_AT_decl_line(0x4c)
	.dwattr $C$DW$33, DW_AT_decl_column(0x0d)
$C$DW$34	.dwtag  DW_TAG_member
	.dwattr $C$DW$34, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$34, DW_AT_name("PRU0_GPO_SH_SEL")
	.dwattr $C$DW$34, DW_AT_TI_symbol_name("PRU0_GPO_SH_SEL")
	.dwattr $C$DW$34, DW_AT_bit_offset(0x06), DW_AT_bit_size(0x01)
	.dwattr $C$DW$34, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$34, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$34, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$34, DW_AT_decl_line(0x4d)
	.dwattr $C$DW$34, DW_AT_decl_column(0x0d)
$C$DW$35	.dwtag  DW_TAG_member
	.dwattr $C$DW$35, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$35, DW_AT_name("rsvd26")
	.dwattr $C$DW$35, DW_AT_TI_symbol_name("rsvd26")
	.dwattr $C$DW$35, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x06)
	.dwattr $C$DW$35, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$35, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$35, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$35, DW_AT_decl_line(0x4e)
	.dwattr $C$DW$35, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$21

	.dwattr $C$DW$T$21, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$21, DW_AT_decl_line(0x44)
	.dwattr $C$DW$T$21, DW_AT_decl_column(0x13)
$C$DW$T$112	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$112, DW_AT_type(*$C$DW$T$21)

$C$DW$T$22	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$22, DW_AT_byte_size(0x04)
$C$DW$36	.dwtag  DW_TAG_member
	.dwattr $C$DW$36, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$36, DW_AT_name("PRU1_GPI_MODE")
	.dwattr $C$DW$36, DW_AT_TI_symbol_name("PRU1_GPI_MODE")
	.dwattr $C$DW$36, DW_AT_bit_offset(0x1e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$36, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$36, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$36, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$36, DW_AT_decl_line(0x58)
	.dwattr $C$DW$36, DW_AT_decl_column(0x0d)
$C$DW$37	.dwtag  DW_TAG_member
	.dwattr $C$DW$37, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$37, DW_AT_name("PRU1_GPI_CLK_MODE")
	.dwattr $C$DW$37, DW_AT_TI_symbol_name("PRU1_GPI_CLK_MODE")
	.dwattr $C$DW$37, DW_AT_bit_offset(0x1d), DW_AT_bit_size(0x01)
	.dwattr $C$DW$37, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$37, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$37, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$37, DW_AT_decl_line(0x59)
	.dwattr $C$DW$37, DW_AT_decl_column(0x0d)
$C$DW$38	.dwtag  DW_TAG_member
	.dwattr $C$DW$38, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$38, DW_AT_name("PRU1_GPI_DIV0")
	.dwattr $C$DW$38, DW_AT_TI_symbol_name("PRU1_GPI_DIV0")
	.dwattr $C$DW$38, DW_AT_bit_offset(0x18), DW_AT_bit_size(0x05)
	.dwattr $C$DW$38, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$38, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$38, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$38, DW_AT_decl_line(0x5a)
	.dwattr $C$DW$38, DW_AT_decl_column(0x0d)
$C$DW$39	.dwtag  DW_TAG_member
	.dwattr $C$DW$39, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$39, DW_AT_name("PRU1_GPI_DIV1")
	.dwattr $C$DW$39, DW_AT_TI_symbol_name("PRU1_GPI_DIV1")
	.dwattr $C$DW$39, DW_AT_bit_offset(0x13), DW_AT_bit_size(0x05)
	.dwattr $C$DW$39, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$39, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$39, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$39, DW_AT_decl_line(0x5b)
	.dwattr $C$DW$39, DW_AT_decl_column(0x0d)
$C$DW$40	.dwtag  DW_TAG_member
	.dwattr $C$DW$40, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$40, DW_AT_name("PRU1_GPI_SB")
	.dwattr $C$DW$40, DW_AT_TI_symbol_name("PRU1_GPI_SB")
	.dwattr $C$DW$40, DW_AT_bit_offset(0x12), DW_AT_bit_size(0x01)
	.dwattr $C$DW$40, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$40, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$40, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$40, DW_AT_decl_line(0x5c)
	.dwattr $C$DW$40, DW_AT_decl_column(0x0d)
$C$DW$41	.dwtag  DW_TAG_member
	.dwattr $C$DW$41, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$41, DW_AT_name("PRU1_GPO_MODE")
	.dwattr $C$DW$41, DW_AT_TI_symbol_name("PRU1_GPO_MODE")
	.dwattr $C$DW$41, DW_AT_bit_offset(0x11), DW_AT_bit_size(0x01)
	.dwattr $C$DW$41, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$41, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$41, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$41, DW_AT_decl_line(0x5d)
	.dwattr $C$DW$41, DW_AT_decl_column(0x0d)
$C$DW$42	.dwtag  DW_TAG_member
	.dwattr $C$DW$42, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$42, DW_AT_name("PRU1_GPO_DIV0")
	.dwattr $C$DW$42, DW_AT_TI_symbol_name("PRU1_GPO_DIV0")
	.dwattr $C$DW$42, DW_AT_bit_offset(0x0c), DW_AT_bit_size(0x05)
	.dwattr $C$DW$42, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$42, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$42, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$42, DW_AT_decl_line(0x5e)
	.dwattr $C$DW$42, DW_AT_decl_column(0x0d)
$C$DW$43	.dwtag  DW_TAG_member
	.dwattr $C$DW$43, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$43, DW_AT_name("PRU1_GPO_DIV1")
	.dwattr $C$DW$43, DW_AT_TI_symbol_name("PRU1_GPO_DIV1")
	.dwattr $C$DW$43, DW_AT_bit_offset(0x07), DW_AT_bit_size(0x05)
	.dwattr $C$DW$43, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$43, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$43, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$43, DW_AT_decl_line(0x5f)
	.dwattr $C$DW$43, DW_AT_decl_column(0x0d)
$C$DW$44	.dwtag  DW_TAG_member
	.dwattr $C$DW$44, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$44, DW_AT_name("PRU1_GPO_SH_SEL")
	.dwattr $C$DW$44, DW_AT_TI_symbol_name("PRU1_GPO_SH_SEL")
	.dwattr $C$DW$44, DW_AT_bit_offset(0x06), DW_AT_bit_size(0x01)
	.dwattr $C$DW$44, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$44, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$44, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$44, DW_AT_decl_line(0x60)
	.dwattr $C$DW$44, DW_AT_decl_column(0x0d)
$C$DW$45	.dwtag  DW_TAG_member
	.dwattr $C$DW$45, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$45, DW_AT_name("rsvd26")
	.dwattr $C$DW$45, DW_AT_TI_symbol_name("rsvd26")
	.dwattr $C$DW$45, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x06)
	.dwattr $C$DW$45, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$45, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$45, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$45, DW_AT_decl_line(0x61)
	.dwattr $C$DW$45, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$22

	.dwattr $C$DW$T$22, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$22, DW_AT_decl_line(0x57)
	.dwattr $C$DW$T$22, DW_AT_decl_column(0x13)
$C$DW$T$114	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$114, DW_AT_type(*$C$DW$T$22)

$C$DW$T$23	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$23, DW_AT_byte_size(0x04)
$C$DW$46	.dwtag  DW_TAG_member
	.dwattr $C$DW$46, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$46, DW_AT_name("PRU0_CLK_STOP_REQ")
	.dwattr $C$DW$46, DW_AT_TI_symbol_name("PRU0_CLK_STOP_REQ")
	.dwattr $C$DW$46, DW_AT_bit_offset(0x1f), DW_AT_bit_size(0x01)
	.dwattr $C$DW$46, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$46, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$46, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$46, DW_AT_decl_line(0x6b)
	.dwattr $C$DW$46, DW_AT_decl_column(0x0d)
$C$DW$47	.dwtag  DW_TAG_member
	.dwattr $C$DW$47, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$47, DW_AT_name("PRU0_CLK_STOP_ACK")
	.dwattr $C$DW$47, DW_AT_TI_symbol_name("PRU0_CLK_STOP_ACK")
	.dwattr $C$DW$47, DW_AT_bit_offset(0x1e), DW_AT_bit_size(0x01)
	.dwattr $C$DW$47, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$47, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$47, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$47, DW_AT_decl_line(0x6c)
	.dwattr $C$DW$47, DW_AT_decl_column(0x0d)
$C$DW$48	.dwtag  DW_TAG_member
	.dwattr $C$DW$48, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$48, DW_AT_name("PRU0_CLK_EN")
	.dwattr $C$DW$48, DW_AT_TI_symbol_name("PRU0_CLK_EN")
	.dwattr $C$DW$48, DW_AT_bit_offset(0x1d), DW_AT_bit_size(0x01)
	.dwattr $C$DW$48, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$48, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$48, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$48, DW_AT_decl_line(0x6d)
	.dwattr $C$DW$48, DW_AT_decl_column(0x0d)
$C$DW$49	.dwtag  DW_TAG_member
	.dwattr $C$DW$49, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$49, DW_AT_name("PRU1_CLK_STOP_REQ")
	.dwattr $C$DW$49, DW_AT_TI_symbol_name("PRU1_CLK_STOP_REQ")
	.dwattr $C$DW$49, DW_AT_bit_offset(0x1c), DW_AT_bit_size(0x01)
	.dwattr $C$DW$49, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$49, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$49, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$49, DW_AT_decl_line(0x6e)
	.dwattr $C$DW$49, DW_AT_decl_column(0x0d)
$C$DW$50	.dwtag  DW_TAG_member
	.dwattr $C$DW$50, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$50, DW_AT_name("PRU1_CLK_STOP_ACK")
	.dwattr $C$DW$50, DW_AT_TI_symbol_name("PRU1_CLK_STOP_ACK")
	.dwattr $C$DW$50, DW_AT_bit_offset(0x1b), DW_AT_bit_size(0x01)
	.dwattr $C$DW$50, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$50, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$50, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$50, DW_AT_decl_line(0x6f)
	.dwattr $C$DW$50, DW_AT_decl_column(0x0d)
$C$DW$51	.dwtag  DW_TAG_member
	.dwattr $C$DW$51, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$51, DW_AT_name("PRU1_CLK_EN")
	.dwattr $C$DW$51, DW_AT_TI_symbol_name("PRU1_CLK_EN")
	.dwattr $C$DW$51, DW_AT_bit_offset(0x1a), DW_AT_bit_size(0x01)
	.dwattr $C$DW$51, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$51, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$51, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$51, DW_AT_decl_line(0x70)
	.dwattr $C$DW$51, DW_AT_decl_column(0x0d)
$C$DW$52	.dwtag  DW_TAG_member
	.dwattr $C$DW$52, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$52, DW_AT_name("INTC_CLK_STOP_REQ")
	.dwattr $C$DW$52, DW_AT_TI_symbol_name("INTC_CLK_STOP_REQ")
	.dwattr $C$DW$52, DW_AT_bit_offset(0x19), DW_AT_bit_size(0x01)
	.dwattr $C$DW$52, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$52, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$52, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$52, DW_AT_decl_line(0x71)
	.dwattr $C$DW$52, DW_AT_decl_column(0x0d)
$C$DW$53	.dwtag  DW_TAG_member
	.dwattr $C$DW$53, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$53, DW_AT_name("INTC_CLK_STOP_ACK")
	.dwattr $C$DW$53, DW_AT_TI_symbol_name("INTC_CLK_STOP_ACK")
	.dwattr $C$DW$53, DW_AT_bit_offset(0x18), DW_AT_bit_size(0x01)
	.dwattr $C$DW$53, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$53, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$53, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$53, DW_AT_decl_line(0x72)
	.dwattr $C$DW$53, DW_AT_decl_column(0x0d)
$C$DW$54	.dwtag  DW_TAG_member
	.dwattr $C$DW$54, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$54, DW_AT_name("INTC_CLK_EN")
	.dwattr $C$DW$54, DW_AT_TI_symbol_name("INTC_CLK_EN")
	.dwattr $C$DW$54, DW_AT_bit_offset(0x17), DW_AT_bit_size(0x01)
	.dwattr $C$DW$54, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$54, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$54, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$54, DW_AT_decl_line(0x73)
	.dwattr $C$DW$54, DW_AT_decl_column(0x0d)
$C$DW$55	.dwtag  DW_TAG_member
	.dwattr $C$DW$55, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$55, DW_AT_name("UART_CLK_STOP_REQ")
	.dwattr $C$DW$55, DW_AT_TI_symbol_name("UART_CLK_STOP_REQ")
	.dwattr $C$DW$55, DW_AT_bit_offset(0x16), DW_AT_bit_size(0x01)
	.dwattr $C$DW$55, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$55, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$55, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$55, DW_AT_decl_line(0x74)
	.dwattr $C$DW$55, DW_AT_decl_column(0x0d)
$C$DW$56	.dwtag  DW_TAG_member
	.dwattr $C$DW$56, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$56, DW_AT_name("UART_CLK_STOP_ACK")
	.dwattr $C$DW$56, DW_AT_TI_symbol_name("UART_CLK_STOP_ACK")
	.dwattr $C$DW$56, DW_AT_bit_offset(0x15), DW_AT_bit_size(0x01)
	.dwattr $C$DW$56, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$56, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$56, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$56, DW_AT_decl_line(0x75)
	.dwattr $C$DW$56, DW_AT_decl_column(0x0d)
$C$DW$57	.dwtag  DW_TAG_member
	.dwattr $C$DW$57, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$57, DW_AT_name("UART_CLK_EN")
	.dwattr $C$DW$57, DW_AT_TI_symbol_name("UART_CLK_EN")
	.dwattr $C$DW$57, DW_AT_bit_offset(0x14), DW_AT_bit_size(0x01)
	.dwattr $C$DW$57, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$57, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$57, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$57, DW_AT_decl_line(0x76)
	.dwattr $C$DW$57, DW_AT_decl_column(0x0d)
$C$DW$58	.dwtag  DW_TAG_member
	.dwattr $C$DW$58, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$58, DW_AT_name("ECAP_CLK_STOP_REQ")
	.dwattr $C$DW$58, DW_AT_TI_symbol_name("ECAP_CLK_STOP_REQ")
	.dwattr $C$DW$58, DW_AT_bit_offset(0x13), DW_AT_bit_size(0x01)
	.dwattr $C$DW$58, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$58, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$58, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$58, DW_AT_decl_line(0x77)
	.dwattr $C$DW$58, DW_AT_decl_column(0x0d)
$C$DW$59	.dwtag  DW_TAG_member
	.dwattr $C$DW$59, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$59, DW_AT_name("ECAP_CLK_STOP_ACK")
	.dwattr $C$DW$59, DW_AT_TI_symbol_name("ECAP_CLK_STOP_ACK")
	.dwattr $C$DW$59, DW_AT_bit_offset(0x12), DW_AT_bit_size(0x01)
	.dwattr $C$DW$59, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$59, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$59, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$59, DW_AT_decl_line(0x78)
	.dwattr $C$DW$59, DW_AT_decl_column(0x0d)
$C$DW$60	.dwtag  DW_TAG_member
	.dwattr $C$DW$60, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$60, DW_AT_name("ECAP_CLK_EN")
	.dwattr $C$DW$60, DW_AT_TI_symbol_name("ECAP_CLK_EN")
	.dwattr $C$DW$60, DW_AT_bit_offset(0x11), DW_AT_bit_size(0x01)
	.dwattr $C$DW$60, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$60, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$60, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$60, DW_AT_decl_line(0x79)
	.dwattr $C$DW$60, DW_AT_decl_column(0x0d)
$C$DW$61	.dwtag  DW_TAG_member
	.dwattr $C$DW$61, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$61, DW_AT_name("IEP_CLK_STOP_REQ")
	.dwattr $C$DW$61, DW_AT_TI_symbol_name("IEP_CLK_STOP_REQ")
	.dwattr $C$DW$61, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x01)
	.dwattr $C$DW$61, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$61, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$61, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$61, DW_AT_decl_line(0x7a)
	.dwattr $C$DW$61, DW_AT_decl_column(0x0d)
$C$DW$62	.dwtag  DW_TAG_member
	.dwattr $C$DW$62, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$62, DW_AT_name("IEP_CLK_STOP_ACK")
	.dwattr $C$DW$62, DW_AT_TI_symbol_name("IEP_CLK_STOP_ACK")
	.dwattr $C$DW$62, DW_AT_bit_offset(0x0f), DW_AT_bit_size(0x01)
	.dwattr $C$DW$62, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$62, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$62, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$62, DW_AT_decl_line(0x7b)
	.dwattr $C$DW$62, DW_AT_decl_column(0x0d)
$C$DW$63	.dwtag  DW_TAG_member
	.dwattr $C$DW$63, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$63, DW_AT_name("IEP_CLK_EN")
	.dwattr $C$DW$63, DW_AT_TI_symbol_name("IEP_CLK_EN")
	.dwattr $C$DW$63, DW_AT_bit_offset(0x0e), DW_AT_bit_size(0x01)
	.dwattr $C$DW$63, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$63, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$63, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$63, DW_AT_decl_line(0x7c)
	.dwattr $C$DW$63, DW_AT_decl_column(0x0d)
$C$DW$64	.dwtag  DW_TAG_member
	.dwattr $C$DW$64, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$64, DW_AT_name("rsvd18")
	.dwattr $C$DW$64, DW_AT_TI_symbol_name("rsvd18")
	.dwattr $C$DW$64, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x0e)
	.dwattr $C$DW$64, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$64, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$64, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$64, DW_AT_decl_line(0x7d)
	.dwattr $C$DW$64, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$23

	.dwattr $C$DW$T$23, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$23, DW_AT_decl_line(0x6a)
	.dwattr $C$DW$T$23, DW_AT_decl_column(0x13)
$C$DW$T$116	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$116, DW_AT_type(*$C$DW$T$23)

$C$DW$T$24	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$24, DW_AT_byte_size(0x04)
$C$DW$65	.dwtag  DW_TAG_member
	.dwattr $C$DW$65, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$65, DW_AT_name("PRU0_IMEM_PE_RAW")
	.dwattr $C$DW$65, DW_AT_TI_symbol_name("PRU0_IMEM_PE_RAW")
	.dwattr $C$DW$65, DW_AT_bit_offset(0x1c), DW_AT_bit_size(0x04)
	.dwattr $C$DW$65, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$65, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$65, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$65, DW_AT_decl_line(0x87)
	.dwattr $C$DW$65, DW_AT_decl_column(0x0d)
$C$DW$66	.dwtag  DW_TAG_member
	.dwattr $C$DW$66, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$66, DW_AT_name("PRU0_DMEM_PE_RAW")
	.dwattr $C$DW$66, DW_AT_TI_symbol_name("PRU0_DMEM_PE_RAW")
	.dwattr $C$DW$66, DW_AT_bit_offset(0x18), DW_AT_bit_size(0x04)
	.dwattr $C$DW$66, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$66, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$66, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$66, DW_AT_decl_line(0x88)
	.dwattr $C$DW$66, DW_AT_decl_column(0x0d)
$C$DW$67	.dwtag  DW_TAG_member
	.dwattr $C$DW$67, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$67, DW_AT_name("PRU1_IMEM_PE_RAW")
	.dwattr $C$DW$67, DW_AT_TI_symbol_name("PRU1_IMEM_PE_RAW")
	.dwattr $C$DW$67, DW_AT_bit_offset(0x14), DW_AT_bit_size(0x04)
	.dwattr $C$DW$67, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$67, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$67, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$67, DW_AT_decl_line(0x89)
	.dwattr $C$DW$67, DW_AT_decl_column(0x0d)
$C$DW$68	.dwtag  DW_TAG_member
	.dwattr $C$DW$68, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$68, DW_AT_name("PRU1_DMEM_PE_RAW")
	.dwattr $C$DW$68, DW_AT_TI_symbol_name("PRU1_DMEM_PE_RAW")
	.dwattr $C$DW$68, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x04)
	.dwattr $C$DW$68, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$68, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$68, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$68, DW_AT_decl_line(0x8a)
	.dwattr $C$DW$68, DW_AT_decl_column(0x0d)
$C$DW$69	.dwtag  DW_TAG_member
	.dwattr $C$DW$69, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$69, DW_AT_name("RAM_PE_RAW")
	.dwattr $C$DW$69, DW_AT_TI_symbol_name("RAM_PE_RAW")
	.dwattr $C$DW$69, DW_AT_bit_offset(0x0c), DW_AT_bit_size(0x04)
	.dwattr $C$DW$69, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$69, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$69, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$69, DW_AT_decl_line(0x8b)
	.dwattr $C$DW$69, DW_AT_decl_column(0x0d)
$C$DW$70	.dwtag  DW_TAG_member
	.dwattr $C$DW$70, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$70, DW_AT_name("rsvd20")
	.dwattr $C$DW$70, DW_AT_TI_symbol_name("rsvd20")
	.dwattr $C$DW$70, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x0c)
	.dwattr $C$DW$70, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$70, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$70, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$70, DW_AT_decl_line(0x8c)
	.dwattr $C$DW$70, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$24

	.dwattr $C$DW$T$24, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$24, DW_AT_decl_line(0x86)
	.dwattr $C$DW$T$24, DW_AT_decl_column(0x14)
$C$DW$T$118	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$118, DW_AT_type(*$C$DW$T$24)

$C$DW$T$25	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$25, DW_AT_byte_size(0x04)
$C$DW$71	.dwtag  DW_TAG_member
	.dwattr $C$DW$71, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$71, DW_AT_name("PRU0_IMEM_PE")
	.dwattr $C$DW$71, DW_AT_TI_symbol_name("PRU0_IMEM_PE")
	.dwattr $C$DW$71, DW_AT_bit_offset(0x1c), DW_AT_bit_size(0x04)
	.dwattr $C$DW$71, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$71, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$71, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$71, DW_AT_decl_line(0x96)
	.dwattr $C$DW$71, DW_AT_decl_column(0x0d)
$C$DW$72	.dwtag  DW_TAG_member
	.dwattr $C$DW$72, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$72, DW_AT_name("PRU0_DMEM_PE")
	.dwattr $C$DW$72, DW_AT_TI_symbol_name("PRU0_DMEM_PE")
	.dwattr $C$DW$72, DW_AT_bit_offset(0x18), DW_AT_bit_size(0x04)
	.dwattr $C$DW$72, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$72, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$72, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$72, DW_AT_decl_line(0x97)
	.dwattr $C$DW$72, DW_AT_decl_column(0x0d)
$C$DW$73	.dwtag  DW_TAG_member
	.dwattr $C$DW$73, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$73, DW_AT_name("PRU1_IMEM_PE")
	.dwattr $C$DW$73, DW_AT_TI_symbol_name("PRU1_IMEM_PE")
	.dwattr $C$DW$73, DW_AT_bit_offset(0x14), DW_AT_bit_size(0x04)
	.dwattr $C$DW$73, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$73, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$73, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$73, DW_AT_decl_line(0x98)
	.dwattr $C$DW$73, DW_AT_decl_column(0x0d)
$C$DW$74	.dwtag  DW_TAG_member
	.dwattr $C$DW$74, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$74, DW_AT_name("PRU1_DMEM_PE")
	.dwattr $C$DW$74, DW_AT_TI_symbol_name("PRU1_DMEM_PE")
	.dwattr $C$DW$74, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x04)
	.dwattr $C$DW$74, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$74, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$74, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$74, DW_AT_decl_line(0x99)
	.dwattr $C$DW$74, DW_AT_decl_column(0x0d)
$C$DW$75	.dwtag  DW_TAG_member
	.dwattr $C$DW$75, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$75, DW_AT_name("RAM_PE")
	.dwattr $C$DW$75, DW_AT_TI_symbol_name("RAM_PE")
	.dwattr $C$DW$75, DW_AT_bit_offset(0x0c), DW_AT_bit_size(0x04)
	.dwattr $C$DW$75, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$75, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$75, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$75, DW_AT_decl_line(0x9a)
	.dwattr $C$DW$75, DW_AT_decl_column(0x0d)
$C$DW$76	.dwtag  DW_TAG_member
	.dwattr $C$DW$76, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$76, DW_AT_name("rsvd20")
	.dwattr $C$DW$76, DW_AT_TI_symbol_name("rsvd20")
	.dwattr $C$DW$76, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x0c)
	.dwattr $C$DW$76, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$76, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$76, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$76, DW_AT_decl_line(0x9b)
	.dwattr $C$DW$76, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$25

	.dwattr $C$DW$T$25, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$25, DW_AT_decl_line(0x95)
	.dwattr $C$DW$T$25, DW_AT_decl_column(0x14)
$C$DW$T$120	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$120, DW_AT_type(*$C$DW$T$25)

$C$DW$T$26	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$26, DW_AT_byte_size(0x04)
$C$DW$77	.dwtag  DW_TAG_member
	.dwattr $C$DW$77, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$77, DW_AT_name("PRU0_IMEM_PE_SET")
	.dwattr $C$DW$77, DW_AT_TI_symbol_name("PRU0_IMEM_PE_SET")
	.dwattr $C$DW$77, DW_AT_bit_offset(0x1c), DW_AT_bit_size(0x04)
	.dwattr $C$DW$77, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$77, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$77, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$77, DW_AT_decl_line(0xa4)
	.dwattr $C$DW$77, DW_AT_decl_column(0x0d)
$C$DW$78	.dwtag  DW_TAG_member
	.dwattr $C$DW$78, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$78, DW_AT_name("PRU0_DMEM_PE_SET")
	.dwattr $C$DW$78, DW_AT_TI_symbol_name("PRU0_DMEM_PE_SET")
	.dwattr $C$DW$78, DW_AT_bit_offset(0x18), DW_AT_bit_size(0x04)
	.dwattr $C$DW$78, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$78, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$78, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$78, DW_AT_decl_line(0xa5)
	.dwattr $C$DW$78, DW_AT_decl_column(0x0d)
$C$DW$79	.dwtag  DW_TAG_member
	.dwattr $C$DW$79, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$79, DW_AT_name("PRU1_IMEM_PE_SET")
	.dwattr $C$DW$79, DW_AT_TI_symbol_name("PRU1_IMEM_PE_SET")
	.dwattr $C$DW$79, DW_AT_bit_offset(0x14), DW_AT_bit_size(0x04)
	.dwattr $C$DW$79, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$79, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$79, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$79, DW_AT_decl_line(0xa6)
	.dwattr $C$DW$79, DW_AT_decl_column(0x0d)
$C$DW$80	.dwtag  DW_TAG_member
	.dwattr $C$DW$80, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$80, DW_AT_name("PRU1_DMEM_PE_SET")
	.dwattr $C$DW$80, DW_AT_TI_symbol_name("PRU1_DMEM_PE_SET")
	.dwattr $C$DW$80, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x04)
	.dwattr $C$DW$80, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$80, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$80, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$80, DW_AT_decl_line(0xa7)
	.dwattr $C$DW$80, DW_AT_decl_column(0x0d)
$C$DW$81	.dwtag  DW_TAG_member
	.dwattr $C$DW$81, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$81, DW_AT_name("RAM_PE_SET")
	.dwattr $C$DW$81, DW_AT_TI_symbol_name("RAM_PE_SET")
	.dwattr $C$DW$81, DW_AT_bit_offset(0x0c), DW_AT_bit_size(0x04)
	.dwattr $C$DW$81, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$81, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$81, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$81, DW_AT_decl_line(0xa8)
	.dwattr $C$DW$81, DW_AT_decl_column(0x0d)
$C$DW$82	.dwtag  DW_TAG_member
	.dwattr $C$DW$82, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$82, DW_AT_name("rsvd20")
	.dwattr $C$DW$82, DW_AT_TI_symbol_name("rsvd20")
	.dwattr $C$DW$82, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x0c)
	.dwattr $C$DW$82, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$82, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$82, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$82, DW_AT_decl_line(0xa9)
	.dwattr $C$DW$82, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$26

	.dwattr $C$DW$T$26, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$26, DW_AT_decl_line(0xa3)
	.dwattr $C$DW$T$26, DW_AT_decl_column(0x13)
$C$DW$T$122	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$122, DW_AT_type(*$C$DW$T$26)

$C$DW$T$27	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$27, DW_AT_byte_size(0x04)
$C$DW$83	.dwtag  DW_TAG_member
	.dwattr $C$DW$83, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$83, DW_AT_name("PRU0_IMEM_PE_CLR")
	.dwattr $C$DW$83, DW_AT_TI_symbol_name("PRU0_IMEM_PE_CLR")
	.dwattr $C$DW$83, DW_AT_bit_offset(0x1c), DW_AT_bit_size(0x04)
	.dwattr $C$DW$83, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$83, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$83, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$83, DW_AT_decl_line(0xb3)
	.dwattr $C$DW$83, DW_AT_decl_column(0x0d)
$C$DW$84	.dwtag  DW_TAG_member
	.dwattr $C$DW$84, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$84, DW_AT_name("PRU0_DMEM_PE_CLR")
	.dwattr $C$DW$84, DW_AT_TI_symbol_name("PRU0_DMEM_PE_CLR")
	.dwattr $C$DW$84, DW_AT_bit_offset(0x18), DW_AT_bit_size(0x04)
	.dwattr $C$DW$84, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$84, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$84, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$84, DW_AT_decl_line(0xb4)
	.dwattr $C$DW$84, DW_AT_decl_column(0x0d)
$C$DW$85	.dwtag  DW_TAG_member
	.dwattr $C$DW$85, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$85, DW_AT_name("PRU1_IMEM_PE_CLR")
	.dwattr $C$DW$85, DW_AT_TI_symbol_name("PRU1_IMEM_PE_CLR")
	.dwattr $C$DW$85, DW_AT_bit_offset(0x14), DW_AT_bit_size(0x04)
	.dwattr $C$DW$85, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$85, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$85, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$85, DW_AT_decl_line(0xb5)
	.dwattr $C$DW$85, DW_AT_decl_column(0x0d)
$C$DW$86	.dwtag  DW_TAG_member
	.dwattr $C$DW$86, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$86, DW_AT_name("PRU1_DMEM_PE_CLR")
	.dwattr $C$DW$86, DW_AT_TI_symbol_name("PRU1_DMEM_PE_CLR")
	.dwattr $C$DW$86, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x04)
	.dwattr $C$DW$86, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$86, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$86, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$86, DW_AT_decl_line(0xb6)
	.dwattr $C$DW$86, DW_AT_decl_column(0x0d)
$C$DW$87	.dwtag  DW_TAG_member
	.dwattr $C$DW$87, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$87, DW_AT_name("rsvd16")
	.dwattr $C$DW$87, DW_AT_TI_symbol_name("rsvd16")
	.dwattr $C$DW$87, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x10)
	.dwattr $C$DW$87, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$87, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$87, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$87, DW_AT_decl_line(0xb7)
	.dwattr $C$DW$87, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$27

	.dwattr $C$DW$T$27, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$27, DW_AT_decl_line(0xb2)
	.dwattr $C$DW$T$27, DW_AT_decl_column(0x13)
$C$DW$T$124	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$124, DW_AT_type(*$C$DW$T$27)

$C$DW$T$28	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$28, DW_AT_byte_size(0x04)
$C$DW$88	.dwtag  DW_TAG_member
	.dwattr $C$DW$88, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$88, DW_AT_name("PMAO_PRU0")
	.dwattr $C$DW$88, DW_AT_TI_symbol_name("PMAO_PRU0")
	.dwattr $C$DW$88, DW_AT_bit_offset(0x1f), DW_AT_bit_size(0x01)
	.dwattr $C$DW$88, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$88, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$88, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$88, DW_AT_decl_line(0xc4)
	.dwattr $C$DW$88, DW_AT_decl_column(0x0d)
$C$DW$89	.dwtag  DW_TAG_member
	.dwattr $C$DW$89, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$89, DW_AT_name("PMAO_PRU1")
	.dwattr $C$DW$89, DW_AT_TI_symbol_name("PMAO_PRU1")
	.dwattr $C$DW$89, DW_AT_bit_offset(0x1e), DW_AT_bit_size(0x01)
	.dwattr $C$DW$89, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$89, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$89, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$89, DW_AT_decl_line(0xc5)
	.dwattr $C$DW$89, DW_AT_decl_column(0x0d)
$C$DW$90	.dwtag  DW_TAG_member
	.dwattr $C$DW$90, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$90, DW_AT_name("rsvd2")
	.dwattr $C$DW$90, DW_AT_TI_symbol_name("rsvd2")
	.dwattr $C$DW$90, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x1e)
	.dwattr $C$DW$90, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$90, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$90, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$90, DW_AT_decl_line(0xc6)
	.dwattr $C$DW$90, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$28

	.dwattr $C$DW$T$28, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$28, DW_AT_decl_line(0xc3)
	.dwattr $C$DW$T$28, DW_AT_decl_column(0x13)
$C$DW$T$126	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$126, DW_AT_type(*$C$DW$T$28)

$C$DW$T$29	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$29, DW_AT_byte_size(0x04)
$C$DW$91	.dwtag  DW_TAG_member
	.dwattr $C$DW$91, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$91, DW_AT_name("OCP_EN")
	.dwattr $C$DW$91, DW_AT_TI_symbol_name("OCP_EN")
	.dwattr $C$DW$91, DW_AT_bit_offset(0x1f), DW_AT_bit_size(0x01)
	.dwattr $C$DW$91, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$91, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$91, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$91, DW_AT_decl_line(0xd3)
	.dwattr $C$DW$91, DW_AT_decl_column(0x0d)
$C$DW$92	.dwtag  DW_TAG_member
	.dwattr $C$DW$92, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$92, DW_AT_name("rsvd1")
	.dwattr $C$DW$92, DW_AT_TI_symbol_name("rsvd1")
	.dwattr $C$DW$92, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x1f)
	.dwattr $C$DW$92, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$92, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$92, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$92, DW_AT_decl_line(0xd4)
	.dwattr $C$DW$92, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$29

	.dwattr $C$DW$T$29, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$29, DW_AT_decl_line(0xd2)
	.dwattr $C$DW$T$29, DW_AT_decl_column(0x13)
$C$DW$T$128	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$128, DW_AT_type(*$C$DW$T$29)

$C$DW$T$30	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$30, DW_AT_byte_size(0x04)
$C$DW$93	.dwtag  DW_TAG_member
	.dwattr $C$DW$93, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$93, DW_AT_name("PRU1_PAD_HP_EN")
	.dwattr $C$DW$93, DW_AT_TI_symbol_name("PRU1_PAD_HP_EN")
	.dwattr $C$DW$93, DW_AT_bit_offset(0x1f), DW_AT_bit_size(0x01)
	.dwattr $C$DW$93, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$93, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$93, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$93, DW_AT_decl_line(0xde)
	.dwattr $C$DW$93, DW_AT_decl_column(0x0d)
$C$DW$94	.dwtag  DW_TAG_member
	.dwattr $C$DW$94, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$94, DW_AT_name("XFR_SHIFT_EN")
	.dwattr $C$DW$94, DW_AT_TI_symbol_name("XFR_SHIFT_EN")
	.dwattr $C$DW$94, DW_AT_bit_offset(0x1e), DW_AT_bit_size(0x01)
	.dwattr $C$DW$94, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$94, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$94, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$94, DW_AT_decl_line(0xdf)
	.dwattr $C$DW$94, DW_AT_decl_column(0x0d)
$C$DW$95	.dwtag  DW_TAG_member
	.dwattr $C$DW$95, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$95, DW_AT_name("rsvd2")
	.dwattr $C$DW$95, DW_AT_TI_symbol_name("rsvd2")
	.dwattr $C$DW$95, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x1e)
	.dwattr $C$DW$95, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$95, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$95, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$95, DW_AT_decl_line(0xe0)
	.dwattr $C$DW$95, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$30

	.dwattr $C$DW$T$30, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$30, DW_AT_decl_line(0xdd)
	.dwattr $C$DW$T$30, DW_AT_decl_column(0x13)
$C$DW$T$130	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$130, DW_AT_type(*$C$DW$T$30)

$C$DW$T$31	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$31, DW_AT_byte_size(0x04)
$C$DW$96	.dwtag  DW_TAG_member
	.dwattr $C$DW$96, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$96, DW_AT_name("PIN_MUX_SEL")
	.dwattr $C$DW$96, DW_AT_TI_symbol_name("PIN_MUX_SEL")
	.dwattr $C$DW$96, DW_AT_bit_offset(0x18), DW_AT_bit_size(0x08)
	.dwattr $C$DW$96, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$96, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$96, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$96, DW_AT_decl_line(0xec)
	.dwattr $C$DW$96, DW_AT_decl_column(0x0d)
$C$DW$97	.dwtag  DW_TAG_member
	.dwattr $C$DW$97, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$97, DW_AT_name("rsvd2")
	.dwattr $C$DW$97, DW_AT_TI_symbol_name("rsvd2")
	.dwattr $C$DW$97, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x18)
	.dwattr $C$DW$97, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$97, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$97, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$97, DW_AT_decl_line(0xed)
	.dwattr $C$DW$97, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$31

	.dwattr $C$DW$T$31, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$31, DW_AT_decl_line(0xeb)
	.dwattr $C$DW$T$31, DW_AT_decl_column(0x13)
$C$DW$T$132	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$132, DW_AT_type(*$C$DW$T$31)

$C$DW$T$35	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$35, DW_AT_byte_size(0x44)
$C$DW$98	.dwtag  DW_TAG_member
	.dwattr $C$DW$98, DW_AT_type(*$C$DW$T$109)
	.dwattr $C$DW$98, DW_AT_name("$P$T0")
	.dwattr $C$DW$98, DW_AT_TI_symbol_name("$P$T0")
	.dwattr $C$DW$98, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$98, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$98, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$98, DW_AT_decl_line(0x29)
	.dwattr $C$DW$98, DW_AT_decl_column(0x02)
$C$DW$99	.dwtag  DW_TAG_member
	.dwattr $C$DW$99, DW_AT_type(*$C$DW$T$111)
	.dwattr $C$DW$99, DW_AT_name("$P$T1")
	.dwattr $C$DW$99, DW_AT_TI_symbol_name("$P$T1")
	.dwattr $C$DW$99, DW_AT_data_member_location[DW_OP_plus_uconst 0x4]
	.dwattr $C$DW$99, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$99, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$99, DW_AT_decl_line(0x33)
	.dwattr $C$DW$99, DW_AT_decl_column(0x02)
$C$DW$100	.dwtag  DW_TAG_member
	.dwattr $C$DW$100, DW_AT_type(*$C$DW$T$113)
	.dwattr $C$DW$100, DW_AT_name("$P$T2")
	.dwattr $C$DW$100, DW_AT_TI_symbol_name("$P$T2")
	.dwattr $C$DW$100, DW_AT_data_member_location[DW_OP_plus_uconst 0x8]
	.dwattr $C$DW$100, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$100, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$100, DW_AT_decl_line(0x41)
	.dwattr $C$DW$100, DW_AT_decl_column(0x02)
$C$DW$101	.dwtag  DW_TAG_member
	.dwattr $C$DW$101, DW_AT_type(*$C$DW$T$115)
	.dwattr $C$DW$101, DW_AT_name("$P$T3")
	.dwattr $C$DW$101, DW_AT_TI_symbol_name("$P$T3")
	.dwattr $C$DW$101, DW_AT_data_member_location[DW_OP_plus_uconst 0xc]
	.dwattr $C$DW$101, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$101, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$101, DW_AT_decl_line(0x54)
	.dwattr $C$DW$101, DW_AT_decl_column(0x02)
$C$DW$102	.dwtag  DW_TAG_member
	.dwattr $C$DW$102, DW_AT_type(*$C$DW$T$117)
	.dwattr $C$DW$102, DW_AT_name("$P$T4")
	.dwattr $C$DW$102, DW_AT_TI_symbol_name("$P$T4")
	.dwattr $C$DW$102, DW_AT_data_member_location[DW_OP_plus_uconst 0x10]
	.dwattr $C$DW$102, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$102, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$102, DW_AT_decl_line(0x67)
	.dwattr $C$DW$102, DW_AT_decl_column(0x02)
$C$DW$103	.dwtag  DW_TAG_member
	.dwattr $C$DW$103, DW_AT_type(*$C$DW$T$119)
	.dwattr $C$DW$103, DW_AT_name("$P$T5")
	.dwattr $C$DW$103, DW_AT_TI_symbol_name("$P$T5")
	.dwattr $C$DW$103, DW_AT_data_member_location[DW_OP_plus_uconst 0x14]
	.dwattr $C$DW$103, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$103, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$103, DW_AT_decl_line(0x83)
	.dwattr $C$DW$103, DW_AT_decl_column(0x02)
$C$DW$104	.dwtag  DW_TAG_member
	.dwattr $C$DW$104, DW_AT_type(*$C$DW$T$121)
	.dwattr $C$DW$104, DW_AT_name("$P$T6")
	.dwattr $C$DW$104, DW_AT_TI_symbol_name("$P$T6")
	.dwattr $C$DW$104, DW_AT_data_member_location[DW_OP_plus_uconst 0x18]
	.dwattr $C$DW$104, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$104, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$104, DW_AT_decl_line(0x92)
	.dwattr $C$DW$104, DW_AT_decl_column(0x02)
$C$DW$105	.dwtag  DW_TAG_member
	.dwattr $C$DW$105, DW_AT_type(*$C$DW$T$123)
	.dwattr $C$DW$105, DW_AT_name("$P$T7")
	.dwattr $C$DW$105, DW_AT_TI_symbol_name("$P$T7")
	.dwattr $C$DW$105, DW_AT_data_member_location[DW_OP_plus_uconst 0x1c]
	.dwattr $C$DW$105, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$105, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$105, DW_AT_decl_line(0xa0)
	.dwattr $C$DW$105, DW_AT_decl_column(0x02)
$C$DW$106	.dwtag  DW_TAG_member
	.dwattr $C$DW$106, DW_AT_type(*$C$DW$T$125)
	.dwattr $C$DW$106, DW_AT_name("$P$T8")
	.dwattr $C$DW$106, DW_AT_TI_symbol_name("$P$T8")
	.dwattr $C$DW$106, DW_AT_data_member_location[DW_OP_plus_uconst 0x20]
	.dwattr $C$DW$106, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$106, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$106, DW_AT_decl_line(0xaf)
	.dwattr $C$DW$106, DW_AT_decl_column(0x02)
$C$DW$107	.dwtag  DW_TAG_member
	.dwattr $C$DW$107, DW_AT_type(*$C$DW$T$32)
	.dwattr $C$DW$107, DW_AT_name("rsvd24")
	.dwattr $C$DW$107, DW_AT_TI_symbol_name("rsvd24")
	.dwattr $C$DW$107, DW_AT_data_member_location[DW_OP_plus_uconst 0x24]
	.dwattr $C$DW$107, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$107, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$107, DW_AT_decl_line(0xbc)
	.dwattr $C$DW$107, DW_AT_decl_column(0x0b)
$C$DW$108	.dwtag  DW_TAG_member
	.dwattr $C$DW$108, DW_AT_type(*$C$DW$T$127)
	.dwattr $C$DW$108, DW_AT_name("$P$T9")
	.dwattr $C$DW$108, DW_AT_TI_symbol_name("$P$T9")
	.dwattr $C$DW$108, DW_AT_data_member_location[DW_OP_plus_uconst 0x28]
	.dwattr $C$DW$108, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$108, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$108, DW_AT_decl_line(0xc0)
	.dwattr $C$DW$108, DW_AT_decl_column(0x02)
$C$DW$109	.dwtag  DW_TAG_member
	.dwattr $C$DW$109, DW_AT_type(*$C$DW$T$33)
	.dwattr $C$DW$109, DW_AT_name("rsvd2c")
	.dwattr $C$DW$109, DW_AT_TI_symbol_name("rsvd2c")
	.dwattr $C$DW$109, DW_AT_data_member_location[DW_OP_plus_uconst 0x2c]
	.dwattr $C$DW$109, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$109, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$109, DW_AT_decl_line(0xcb)
	.dwattr $C$DW$109, DW_AT_decl_column(0x0b)
$C$DW$110	.dwtag  DW_TAG_member
	.dwattr $C$DW$110, DW_AT_type(*$C$DW$T$129)
	.dwattr $C$DW$110, DW_AT_name("$P$T10")
	.dwattr $C$DW$110, DW_AT_TI_symbol_name("$P$T10")
	.dwattr $C$DW$110, DW_AT_data_member_location[DW_OP_plus_uconst 0x30]
	.dwattr $C$DW$110, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$110, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$110, DW_AT_decl_line(0xcf)
	.dwattr $C$DW$110, DW_AT_decl_column(0x02)
$C$DW$111	.dwtag  DW_TAG_member
	.dwattr $C$DW$111, DW_AT_type(*$C$DW$T$131)
	.dwattr $C$DW$111, DW_AT_name("$P$T11")
	.dwattr $C$DW$111, DW_AT_TI_symbol_name("$P$T11")
	.dwattr $C$DW$111, DW_AT_data_member_location[DW_OP_plus_uconst 0x34]
	.dwattr $C$DW$111, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$111, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$111, DW_AT_decl_line(0xda)
	.dwattr $C$DW$111, DW_AT_decl_column(0x02)
$C$DW$112	.dwtag  DW_TAG_member
	.dwattr $C$DW$112, DW_AT_type(*$C$DW$T$34)
	.dwattr $C$DW$112, DW_AT_name("rsvd38")
	.dwattr $C$DW$112, DW_AT_TI_symbol_name("rsvd38")
	.dwattr $C$DW$112, DW_AT_data_member_location[DW_OP_plus_uconst 0x38]
	.dwattr $C$DW$112, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$112, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$112, DW_AT_decl_line(0xe5)
	.dwattr $C$DW$112, DW_AT_decl_column(0x0b)
$C$DW$113	.dwtag  DW_TAG_member
	.dwattr $C$DW$113, DW_AT_type(*$C$DW$T$133)
	.dwattr $C$DW$113, DW_AT_name("$P$T12")
	.dwattr $C$DW$113, DW_AT_TI_symbol_name("$P$T12")
	.dwattr $C$DW$113, DW_AT_data_member_location[DW_OP_plus_uconst 0x40]
	.dwattr $C$DW$113, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$113, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$113, DW_AT_decl_line(0xe8)
	.dwattr $C$DW$113, DW_AT_decl_column(0x02)
	.dwendtag $C$DW$T$35

	.dwattr $C$DW$T$35, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$35, DW_AT_decl_line(0x26)
	.dwattr $C$DW$T$35, DW_AT_decl_column(0x10)
$C$DW$T$266	.dwtag  DW_TAG_typedef, DW_AT_name("pruCfg")
	.dwattr $C$DW$T$266, DW_AT_type(*$C$DW$T$35)
	.dwattr $C$DW$T$266, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$266, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$266, DW_AT_decl_line(0xf0)
	.dwattr $C$DW$T$266, DW_AT_decl_column(0x03)
$C$DW$T$267	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$267, DW_AT_type(*$C$DW$T$266)

$C$DW$T$36	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$36, DW_AT_byte_size(0x04)
$C$DW$114	.dwtag  DW_TAG_member
	.dwattr $C$DW$114, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$114, DW_AT_name("REV_MINOR")
	.dwattr $C$DW$114, DW_AT_TI_symbol_name("REV_MINOR")
	.dwattr $C$DW$114, DW_AT_bit_offset(0x1a), DW_AT_bit_size(0x06)
	.dwattr $C$DW$114, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$114, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$114, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$114, DW_AT_decl_line(0x2d)
	.dwattr $C$DW$114, DW_AT_decl_column(0x0d)
$C$DW$115	.dwtag  DW_TAG_member
	.dwattr $C$DW$115, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$115, DW_AT_name("REV_CUSTOM")
	.dwattr $C$DW$115, DW_AT_TI_symbol_name("REV_CUSTOM")
	.dwattr $C$DW$115, DW_AT_bit_offset(0x18), DW_AT_bit_size(0x02)
	.dwattr $C$DW$115, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$115, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$115, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$115, DW_AT_decl_line(0x2e)
	.dwattr $C$DW$115, DW_AT_decl_column(0x0d)
$C$DW$116	.dwtag  DW_TAG_member
	.dwattr $C$DW$116, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$116, DW_AT_name("REV_MAJOR")
	.dwattr $C$DW$116, DW_AT_TI_symbol_name("REV_MAJOR")
	.dwattr $C$DW$116, DW_AT_bit_offset(0x15), DW_AT_bit_size(0x03)
	.dwattr $C$DW$116, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$116, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$116, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$116, DW_AT_decl_line(0x2f)
	.dwattr $C$DW$116, DW_AT_decl_column(0x0d)
$C$DW$117	.dwtag  DW_TAG_member
	.dwattr $C$DW$117, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$117, DW_AT_name("REV_RTL")
	.dwattr $C$DW$117, DW_AT_TI_symbol_name("REV_RTL")
	.dwattr $C$DW$117, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x05)
	.dwattr $C$DW$117, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$117, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$117, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$117, DW_AT_decl_line(0x30)
	.dwattr $C$DW$117, DW_AT_decl_column(0x0d)
$C$DW$118	.dwtag  DW_TAG_member
	.dwattr $C$DW$118, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$118, DW_AT_name("REV_MODULE")
	.dwattr $C$DW$118, DW_AT_TI_symbol_name("REV_MODULE")
	.dwattr $C$DW$118, DW_AT_bit_offset(0x04), DW_AT_bit_size(0x0c)
	.dwattr $C$DW$118, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$118, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$118, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$118, DW_AT_decl_line(0x31)
	.dwattr $C$DW$118, DW_AT_decl_column(0x0d)
$C$DW$119	.dwtag  DW_TAG_member
	.dwattr $C$DW$119, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$119, DW_AT_name("rsvd28")
	.dwattr $C$DW$119, DW_AT_TI_symbol_name("rsvd28")
	.dwattr $C$DW$119, DW_AT_bit_offset(0x02), DW_AT_bit_size(0x02)
	.dwattr $C$DW$119, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$119, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$119, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$119, DW_AT_decl_line(0x32)
	.dwattr $C$DW$119, DW_AT_decl_column(0x0d)
$C$DW$120	.dwtag  DW_TAG_member
	.dwattr $C$DW$120, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$120, DW_AT_name("REV_SCHEME")
	.dwattr $C$DW$120, DW_AT_TI_symbol_name("REV_SCHEME")
	.dwattr $C$DW$120, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x02)
	.dwattr $C$DW$120, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$120, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$120, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$120, DW_AT_decl_line(0x33)
	.dwattr $C$DW$120, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$36

	.dwattr $C$DW$T$36, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$36, DW_AT_decl_line(0x2c)
	.dwattr $C$DW$T$36, DW_AT_decl_column(0x13)
$C$DW$T$134	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$134, DW_AT_type(*$C$DW$T$36)

$C$DW$T$37	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$37, DW_AT_byte_size(0x04)
$C$DW$121	.dwtag  DW_TAG_member
	.dwattr $C$DW$121, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$121, DW_AT_name("rsvd0")
	.dwattr $C$DW$121, DW_AT_TI_symbol_name("rsvd0")
	.dwattr $C$DW$121, DW_AT_bit_offset(0x1e), DW_AT_bit_size(0x02)
	.dwattr $C$DW$121, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$121, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$121, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$121, DW_AT_decl_line(0x3d)
	.dwattr $C$DW$121, DW_AT_decl_column(0x0d)
$C$DW$122	.dwtag  DW_TAG_member
	.dwattr $C$DW$122, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$122, DW_AT_name("NEST_MODE")
	.dwattr $C$DW$122, DW_AT_TI_symbol_name("NEST_MODE")
	.dwattr $C$DW$122, DW_AT_bit_offset(0x1c), DW_AT_bit_size(0x02)
	.dwattr $C$DW$122, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$122, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$122, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$122, DW_AT_decl_line(0x3e)
	.dwattr $C$DW$122, DW_AT_decl_column(0x0d)
$C$DW$123	.dwtag  DW_TAG_member
	.dwattr $C$DW$123, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$123, DW_AT_name("rsvd4")
	.dwattr $C$DW$123, DW_AT_TI_symbol_name("rsvd4")
	.dwattr $C$DW$123, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x1c)
	.dwattr $C$DW$123, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$123, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$123, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$123, DW_AT_decl_line(0x3f)
	.dwattr $C$DW$123, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$37

	.dwattr $C$DW$T$37, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$37, DW_AT_decl_line(0x3c)
	.dwattr $C$DW$T$37, DW_AT_decl_column(0x13)
$C$DW$T$136	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$136, DW_AT_type(*$C$DW$T$37)

$C$DW$T$38	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$38, DW_AT_byte_size(0x04)
$C$DW$124	.dwtag  DW_TAG_member
	.dwattr $C$DW$124, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$124, DW_AT_name("EN_HINT_ANY")
	.dwattr $C$DW$124, DW_AT_TI_symbol_name("EN_HINT_ANY")
	.dwattr $C$DW$124, DW_AT_bit_offset(0x1f), DW_AT_bit_size(0x01)
	.dwattr $C$DW$124, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$124, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$124, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$124, DW_AT_decl_line(0x4c)
	.dwattr $C$DW$124, DW_AT_decl_column(0x0d)
$C$DW$125	.dwtag  DW_TAG_member
	.dwattr $C$DW$125, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$125, DW_AT_name("rsvd1")
	.dwattr $C$DW$125, DW_AT_TI_symbol_name("rsvd1")
	.dwattr $C$DW$125, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x1f)
	.dwattr $C$DW$125, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$125, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$125, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$125, DW_AT_decl_line(0x4d)
	.dwattr $C$DW$125, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$38

	.dwattr $C$DW$T$38, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$38, DW_AT_decl_line(0x4b)
	.dwattr $C$DW$T$38, DW_AT_decl_column(0x13)
$C$DW$T$138	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$138, DW_AT_type(*$C$DW$T$38)

$C$DW$T$39	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$39, DW_AT_byte_size(0x04)
$C$DW$126	.dwtag  DW_TAG_member
	.dwattr $C$DW$126, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$126, DW_AT_name("GLB_NEST_LEVEL")
	.dwattr $C$DW$126, DW_AT_TI_symbol_name("GLB_NEST_LEVEL")
	.dwattr $C$DW$126, DW_AT_bit_offset(0x17), DW_AT_bit_size(0x09)
	.dwattr $C$DW$126, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$126, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$126, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$126, DW_AT_decl_line(0x5a)
	.dwattr $C$DW$126, DW_AT_decl_column(0x0d)
$C$DW$127	.dwtag  DW_TAG_member
	.dwattr $C$DW$127, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$127, DW_AT_name("rsvd9")
	.dwattr $C$DW$127, DW_AT_TI_symbol_name("rsvd9")
	.dwattr $C$DW$127, DW_AT_bit_offset(0x01), DW_AT_bit_size(0x16)
	.dwattr $C$DW$127, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$127, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$127, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$127, DW_AT_decl_line(0x5b)
	.dwattr $C$DW$127, DW_AT_decl_column(0x0d)
$C$DW$128	.dwtag  DW_TAG_member
	.dwattr $C$DW$128, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$128, DW_AT_name("AUTO_OVERRIDE")
	.dwattr $C$DW$128, DW_AT_TI_symbol_name("AUTO_OVERRIDE")
	.dwattr $C$DW$128, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x01)
	.dwattr $C$DW$128, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$128, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$128, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$128, DW_AT_decl_line(0x5c)
	.dwattr $C$DW$128, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$39

	.dwattr $C$DW$T$39, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$39, DW_AT_decl_line(0x59)
	.dwattr $C$DW$T$39, DW_AT_decl_column(0x13)
$C$DW$T$140	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$140, DW_AT_type(*$C$DW$T$39)

$C$DW$T$40	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$40, DW_AT_byte_size(0x04)
$C$DW$129	.dwtag  DW_TAG_member
	.dwattr $C$DW$129, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$129, DW_AT_name("STS_SET_IDX")
	.dwattr $C$DW$129, DW_AT_TI_symbol_name("STS_SET_IDX")
	.dwattr $C$DW$129, DW_AT_bit_offset(0x16), DW_AT_bit_size(0x0a)
	.dwattr $C$DW$129, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$129, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$129, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$129, DW_AT_decl_line(0x66)
	.dwattr $C$DW$129, DW_AT_decl_column(0x0d)
$C$DW$130	.dwtag  DW_TAG_member
	.dwattr $C$DW$130, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$130, DW_AT_name("rsvd10")
	.dwattr $C$DW$130, DW_AT_TI_symbol_name("rsvd10")
	.dwattr $C$DW$130, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x16)
	.dwattr $C$DW$130, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$130, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$130, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$130, DW_AT_decl_line(0x67)
	.dwattr $C$DW$130, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$40

	.dwattr $C$DW$T$40, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$40, DW_AT_decl_line(0x65)
	.dwattr $C$DW$T$40, DW_AT_decl_column(0x13)
$C$DW$T$142	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$142, DW_AT_type(*$C$DW$T$40)

$C$DW$T$41	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$41, DW_AT_byte_size(0x04)
$C$DW$131	.dwtag  DW_TAG_member
	.dwattr $C$DW$131, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$131, DW_AT_name("STS_CLR_IDX")
	.dwattr $C$DW$131, DW_AT_TI_symbol_name("STS_CLR_IDX")
	.dwattr $C$DW$131, DW_AT_bit_offset(0x16), DW_AT_bit_size(0x0a)
	.dwattr $C$DW$131, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$131, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$131, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$131, DW_AT_decl_line(0x71)
	.dwattr $C$DW$131, DW_AT_decl_column(0x0d)
$C$DW$132	.dwtag  DW_TAG_member
	.dwattr $C$DW$132, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$132, DW_AT_name("rsvd10")
	.dwattr $C$DW$132, DW_AT_TI_symbol_name("rsvd10")
	.dwattr $C$DW$132, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x16)
	.dwattr $C$DW$132, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$132, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$132, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$132, DW_AT_decl_line(0x72)
	.dwattr $C$DW$132, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$41

	.dwattr $C$DW$T$41, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$41, DW_AT_decl_line(0x70)
	.dwattr $C$DW$T$41, DW_AT_decl_column(0x13)
$C$DW$T$144	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$144, DW_AT_type(*$C$DW$T$41)

$C$DW$T$42	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$42, DW_AT_byte_size(0x04)
$C$DW$133	.dwtag  DW_TAG_member
	.dwattr $C$DW$133, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$133, DW_AT_name("EN_SET_IDX")
	.dwattr $C$DW$133, DW_AT_TI_symbol_name("EN_SET_IDX")
	.dwattr $C$DW$133, DW_AT_bit_offset(0x16), DW_AT_bit_size(0x0a)
	.dwattr $C$DW$133, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$133, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$133, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$133, DW_AT_decl_line(0x7c)
	.dwattr $C$DW$133, DW_AT_decl_column(0x0d)
$C$DW$134	.dwtag  DW_TAG_member
	.dwattr $C$DW$134, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$134, DW_AT_name("rsvd10")
	.dwattr $C$DW$134, DW_AT_TI_symbol_name("rsvd10")
	.dwattr $C$DW$134, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x16)
	.dwattr $C$DW$134, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$134, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$134, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$134, DW_AT_decl_line(0x7d)
	.dwattr $C$DW$134, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$42

	.dwattr $C$DW$T$42, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$42, DW_AT_decl_line(0x7b)
	.dwattr $C$DW$T$42, DW_AT_decl_column(0x13)
$C$DW$T$146	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$146, DW_AT_type(*$C$DW$T$42)

$C$DW$T$43	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$43, DW_AT_byte_size(0x04)
$C$DW$135	.dwtag  DW_TAG_member
	.dwattr $C$DW$135, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$135, DW_AT_name("EN_CLR_IDX")
	.dwattr $C$DW$135, DW_AT_TI_symbol_name("EN_CLR_IDX")
	.dwattr $C$DW$135, DW_AT_bit_offset(0x16), DW_AT_bit_size(0x0a)
	.dwattr $C$DW$135, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$135, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$135, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$135, DW_AT_decl_line(0x87)
	.dwattr $C$DW$135, DW_AT_decl_column(0x0d)
$C$DW$136	.dwtag  DW_TAG_member
	.dwattr $C$DW$136, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$136, DW_AT_name("rsvd10")
	.dwattr $C$DW$136, DW_AT_TI_symbol_name("rsvd10")
	.dwattr $C$DW$136, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x16)
	.dwattr $C$DW$136, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$136, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$136, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$136, DW_AT_decl_line(0x88)
	.dwattr $C$DW$136, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$43

	.dwattr $C$DW$T$43, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$43, DW_AT_decl_line(0x86)
	.dwattr $C$DW$T$43, DW_AT_decl_column(0x13)
$C$DW$T$148	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$148, DW_AT_type(*$C$DW$T$43)

$C$DW$T$44	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$44, DW_AT_byte_size(0x04)
$C$DW$137	.dwtag  DW_TAG_member
	.dwattr $C$DW$137, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$137, DW_AT_name("HINT_EN_SET_IDX")
	.dwattr $C$DW$137, DW_AT_TI_symbol_name("HINT_EN_SET_IDX")
	.dwattr $C$DW$137, DW_AT_bit_offset(0x1c), DW_AT_bit_size(0x04)
	.dwattr $C$DW$137, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$137, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$137, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$137, DW_AT_decl_line(0x95)
	.dwattr $C$DW$137, DW_AT_decl_column(0x0d)
$C$DW$138	.dwtag  DW_TAG_member
	.dwattr $C$DW$138, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$138, DW_AT_name("rsvd4")
	.dwattr $C$DW$138, DW_AT_TI_symbol_name("rsvd4")
	.dwattr $C$DW$138, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x1c)
	.dwattr $C$DW$138, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$138, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$138, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$138, DW_AT_decl_line(0x96)
	.dwattr $C$DW$138, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$44

	.dwattr $C$DW$T$44, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$44, DW_AT_decl_line(0x94)
	.dwattr $C$DW$T$44, DW_AT_decl_column(0x13)
$C$DW$T$150	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$150, DW_AT_type(*$C$DW$T$44)

$C$DW$T$45	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$45, DW_AT_byte_size(0x04)
$C$DW$139	.dwtag  DW_TAG_member
	.dwattr $C$DW$139, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$139, DW_AT_name("HINT_EN_CLR_IDX")
	.dwattr $C$DW$139, DW_AT_TI_symbol_name("HINT_EN_CLR_IDX")
	.dwattr $C$DW$139, DW_AT_bit_offset(0x1c), DW_AT_bit_size(0x04)
	.dwattr $C$DW$139, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$139, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$139, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$139, DW_AT_decl_line(0xa0)
	.dwattr $C$DW$139, DW_AT_decl_column(0x0d)
$C$DW$140	.dwtag  DW_TAG_member
	.dwattr $C$DW$140, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$140, DW_AT_name("rsvd4")
	.dwattr $C$DW$140, DW_AT_TI_symbol_name("rsvd4")
	.dwattr $C$DW$140, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x1c)
	.dwattr $C$DW$140, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$140, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$140, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$140, DW_AT_decl_line(0xa1)
	.dwattr $C$DW$140, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$45

	.dwattr $C$DW$T$45, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$45, DW_AT_decl_line(0x9f)
	.dwattr $C$DW$T$45, DW_AT_decl_column(0x13)
$C$DW$T$152	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$152, DW_AT_type(*$C$DW$T$45)

$C$DW$T$46	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$46, DW_AT_byte_size(0x04)
$C$DW$141	.dwtag  DW_TAG_member
	.dwattr $C$DW$141, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$141, DW_AT_name("GLB_PRI_INTR")
	.dwattr $C$DW$141, DW_AT_TI_symbol_name("GLB_PRI_INTR")
	.dwattr $C$DW$141, DW_AT_bit_offset(0x16), DW_AT_bit_size(0x0a)
	.dwattr $C$DW$141, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$141, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$141, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$141, DW_AT_decl_line(0xae)
	.dwattr $C$DW$141, DW_AT_decl_column(0x0d)
$C$DW$142	.dwtag  DW_TAG_member
	.dwattr $C$DW$142, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$142, DW_AT_name("rsvd10")
	.dwattr $C$DW$142, DW_AT_TI_symbol_name("rsvd10")
	.dwattr $C$DW$142, DW_AT_bit_offset(0x01), DW_AT_bit_size(0x15)
	.dwattr $C$DW$142, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$142, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$142, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$142, DW_AT_decl_line(0xaf)
	.dwattr $C$DW$142, DW_AT_decl_column(0x0d)
$C$DW$143	.dwtag  DW_TAG_member
	.dwattr $C$DW$143, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$143, DW_AT_name("GLB_NONE")
	.dwattr $C$DW$143, DW_AT_TI_symbol_name("GLB_NONE")
	.dwattr $C$DW$143, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x01)
	.dwattr $C$DW$143, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$143, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$143, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$143, DW_AT_decl_line(0xb0)
	.dwattr $C$DW$143, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$46

	.dwattr $C$DW$T$46, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$46, DW_AT_decl_line(0xad)
	.dwattr $C$DW$T$46, DW_AT_decl_column(0x13)
$C$DW$T$154	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$154, DW_AT_type(*$C$DW$T$46)

$C$DW$T$47	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$47, DW_AT_byte_size(0x04)
$C$DW$144	.dwtag  DW_TAG_member
	.dwattr $C$DW$144, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$144, DW_AT_name("RAW_STS_31_0")
	.dwattr $C$DW$144, DW_AT_TI_symbol_name("RAW_STS_31_0")
	.dwattr $C$DW$144, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x20)
	.dwattr $C$DW$144, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$144, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$144, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$144, DW_AT_decl_line(0xbd)
	.dwattr $C$DW$144, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$47

	.dwattr $C$DW$T$47, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$47, DW_AT_decl_line(0xbc)
	.dwattr $C$DW$T$47, DW_AT_decl_column(0x13)
$C$DW$T$156	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$156, DW_AT_type(*$C$DW$T$47)

$C$DW$T$48	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$48, DW_AT_byte_size(0x04)
$C$DW$145	.dwtag  DW_TAG_member
	.dwattr $C$DW$145, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$145, DW_AT_name("RAW_STS_63_32")
	.dwattr $C$DW$145, DW_AT_TI_symbol_name("RAW_STS_63_32")
	.dwattr $C$DW$145, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x20)
	.dwattr $C$DW$145, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$145, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$145, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$145, DW_AT_decl_line(0xc7)
	.dwattr $C$DW$145, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$48

	.dwattr $C$DW$T$48, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$48, DW_AT_decl_line(0xc6)
	.dwattr $C$DW$T$48, DW_AT_decl_column(0x13)
$C$DW$T$158	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$158, DW_AT_type(*$C$DW$T$48)

$C$DW$T$49	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$49, DW_AT_byte_size(0x04)
$C$DW$146	.dwtag  DW_TAG_member
	.dwattr $C$DW$146, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$146, DW_AT_name("ENA_STS_31_0")
	.dwattr $C$DW$146, DW_AT_TI_symbol_name("ENA_STS_31_0")
	.dwattr $C$DW$146, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x20)
	.dwattr $C$DW$146, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$146, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$146, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$146, DW_AT_decl_line(0xd4)
	.dwattr $C$DW$146, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$49

	.dwattr $C$DW$T$49, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$49, DW_AT_decl_line(0xd3)
	.dwattr $C$DW$T$49, DW_AT_decl_column(0x13)
$C$DW$T$160	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$160, DW_AT_type(*$C$DW$T$49)

$C$DW$T$50	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$50, DW_AT_byte_size(0x04)
$C$DW$147	.dwtag  DW_TAG_member
	.dwattr $C$DW$147, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$147, DW_AT_name("ENA_STS_63_32")
	.dwattr $C$DW$147, DW_AT_TI_symbol_name("ENA_STS_63_32")
	.dwattr $C$DW$147, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x20)
	.dwattr $C$DW$147, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$147, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$147, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$147, DW_AT_decl_line(0xde)
	.dwattr $C$DW$147, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$50

	.dwattr $C$DW$T$50, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$50, DW_AT_decl_line(0xdd)
	.dwattr $C$DW$T$50, DW_AT_decl_column(0x13)
$C$DW$T$162	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$162, DW_AT_type(*$C$DW$T$50)

$C$DW$T$51	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$51, DW_AT_byte_size(0x04)
$C$DW$148	.dwtag  DW_TAG_member
	.dwattr $C$DW$148, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$148, DW_AT_name("EN_SET_31_0")
	.dwattr $C$DW$148, DW_AT_TI_symbol_name("EN_SET_31_0")
	.dwattr $C$DW$148, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x20)
	.dwattr $C$DW$148, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$148, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$148, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$148, DW_AT_decl_line(0xeb)
	.dwattr $C$DW$148, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$51

	.dwattr $C$DW$T$51, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$51, DW_AT_decl_line(0xea)
	.dwattr $C$DW$T$51, DW_AT_decl_column(0x13)
$C$DW$T$164	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$164, DW_AT_type(*$C$DW$T$51)

$C$DW$T$52	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$52, DW_AT_byte_size(0x04)
$C$DW$149	.dwtag  DW_TAG_member
	.dwattr $C$DW$149, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$149, DW_AT_name("EN_SET_63_32")
	.dwattr $C$DW$149, DW_AT_TI_symbol_name("EN_SET_63_32")
	.dwattr $C$DW$149, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x20)
	.dwattr $C$DW$149, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$149, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$149, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$149, DW_AT_decl_line(0xf5)
	.dwattr $C$DW$149, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$52

	.dwattr $C$DW$T$52, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$52, DW_AT_decl_line(0xf4)
	.dwattr $C$DW$T$52, DW_AT_decl_column(0x13)
$C$DW$T$166	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$166, DW_AT_type(*$C$DW$T$52)

$C$DW$T$53	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$53, DW_AT_byte_size(0x04)
$C$DW$150	.dwtag  DW_TAG_member
	.dwattr $C$DW$150, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$150, DW_AT_name("EN_CLR_31_0")
	.dwattr $C$DW$150, DW_AT_TI_symbol_name("EN_CLR_31_0")
	.dwattr $C$DW$150, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x20)
	.dwattr $C$DW$150, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$150, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$150, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$150, DW_AT_decl_line(0x102)
	.dwattr $C$DW$150, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$53

	.dwattr $C$DW$T$53, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$53, DW_AT_decl_line(0x101)
	.dwattr $C$DW$T$53, DW_AT_decl_column(0x13)
$C$DW$T$168	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$168, DW_AT_type(*$C$DW$T$53)

$C$DW$T$54	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$54, DW_AT_byte_size(0x04)
$C$DW$151	.dwtag  DW_TAG_member
	.dwattr $C$DW$151, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$151, DW_AT_name("EN_CLR_63_32")
	.dwattr $C$DW$151, DW_AT_TI_symbol_name("EN_CLR_63_32")
	.dwattr $C$DW$151, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x20)
	.dwattr $C$DW$151, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$151, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$151, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$151, DW_AT_decl_line(0x10c)
	.dwattr $C$DW$151, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$54

	.dwattr $C$DW$T$54, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$54, DW_AT_decl_line(0x10b)
	.dwattr $C$DW$T$54, DW_AT_decl_column(0x13)
$C$DW$T$170	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$170, DW_AT_type(*$C$DW$T$54)

$C$DW$T$55	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$55, DW_AT_byte_size(0x04)
$C$DW$152	.dwtag  DW_TAG_member
	.dwattr $C$DW$152, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$152, DW_AT_name("CH_MAP_0")
	.dwattr $C$DW$152, DW_AT_TI_symbol_name("CH_MAP_0")
	.dwattr $C$DW$152, DW_AT_bit_offset(0x1c), DW_AT_bit_size(0x04)
	.dwattr $C$DW$152, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$152, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$152, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$152, DW_AT_decl_line(0x119)
	.dwattr $C$DW$152, DW_AT_decl_column(0x0d)
$C$DW$153	.dwtag  DW_TAG_member
	.dwattr $C$DW$153, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$153, DW_AT_name("rsvd4")
	.dwattr $C$DW$153, DW_AT_TI_symbol_name("rsvd4")
	.dwattr $C$DW$153, DW_AT_bit_offset(0x18), DW_AT_bit_size(0x04)
	.dwattr $C$DW$153, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$153, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$153, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$153, DW_AT_decl_line(0x11a)
	.dwattr $C$DW$153, DW_AT_decl_column(0x0d)
$C$DW$154	.dwtag  DW_TAG_member
	.dwattr $C$DW$154, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$154, DW_AT_name("CH_MAP_1")
	.dwattr $C$DW$154, DW_AT_TI_symbol_name("CH_MAP_1")
	.dwattr $C$DW$154, DW_AT_bit_offset(0x14), DW_AT_bit_size(0x04)
	.dwattr $C$DW$154, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$154, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$154, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$154, DW_AT_decl_line(0x11b)
	.dwattr $C$DW$154, DW_AT_decl_column(0x0d)
$C$DW$155	.dwtag  DW_TAG_member
	.dwattr $C$DW$155, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$155, DW_AT_name("rsvd12")
	.dwattr $C$DW$155, DW_AT_TI_symbol_name("rsvd12")
	.dwattr $C$DW$155, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x04)
	.dwattr $C$DW$155, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$155, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$155, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$155, DW_AT_decl_line(0x11c)
	.dwattr $C$DW$155, DW_AT_decl_column(0x0d)
$C$DW$156	.dwtag  DW_TAG_member
	.dwattr $C$DW$156, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$156, DW_AT_name("CH_MAP_2")
	.dwattr $C$DW$156, DW_AT_TI_symbol_name("CH_MAP_2")
	.dwattr $C$DW$156, DW_AT_bit_offset(0x0c), DW_AT_bit_size(0x04)
	.dwattr $C$DW$156, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$156, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$156, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$156, DW_AT_decl_line(0x11d)
	.dwattr $C$DW$156, DW_AT_decl_column(0x0d)
$C$DW$157	.dwtag  DW_TAG_member
	.dwattr $C$DW$157, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$157, DW_AT_name("rsvd20")
	.dwattr $C$DW$157, DW_AT_TI_symbol_name("rsvd20")
	.dwattr $C$DW$157, DW_AT_bit_offset(0x08), DW_AT_bit_size(0x04)
	.dwattr $C$DW$157, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$157, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$157, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$157, DW_AT_decl_line(0x11e)
	.dwattr $C$DW$157, DW_AT_decl_column(0x0d)
$C$DW$158	.dwtag  DW_TAG_member
	.dwattr $C$DW$158, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$158, DW_AT_name("CH_MAP_3")
	.dwattr $C$DW$158, DW_AT_TI_symbol_name("CH_MAP_3")
	.dwattr $C$DW$158, DW_AT_bit_offset(0x04), DW_AT_bit_size(0x04)
	.dwattr $C$DW$158, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$158, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$158, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$158, DW_AT_decl_line(0x11f)
	.dwattr $C$DW$158, DW_AT_decl_column(0x0d)
$C$DW$159	.dwtag  DW_TAG_member
	.dwattr $C$DW$159, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$159, DW_AT_name("rsvd28")
	.dwattr $C$DW$159, DW_AT_TI_symbol_name("rsvd28")
	.dwattr $C$DW$159, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x04)
	.dwattr $C$DW$159, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$159, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$159, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$159, DW_AT_decl_line(0x120)
	.dwattr $C$DW$159, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$55

	.dwattr $C$DW$T$55, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$55, DW_AT_decl_line(0x118)
	.dwattr $C$DW$T$55, DW_AT_decl_column(0x13)
$C$DW$T$172	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$172, DW_AT_type(*$C$DW$T$55)

$C$DW$T$56	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$56, DW_AT_byte_size(0x04)
$C$DW$160	.dwtag  DW_TAG_member
	.dwattr $C$DW$160, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$160, DW_AT_name("CH_MAP_4")
	.dwattr $C$DW$160, DW_AT_TI_symbol_name("CH_MAP_4")
	.dwattr $C$DW$160, DW_AT_bit_offset(0x1c), DW_AT_bit_size(0x04)
	.dwattr $C$DW$160, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$160, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$160, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$160, DW_AT_decl_line(0x12a)
	.dwattr $C$DW$160, DW_AT_decl_column(0x0d)
$C$DW$161	.dwtag  DW_TAG_member
	.dwattr $C$DW$161, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$161, DW_AT_name("rsvd4")
	.dwattr $C$DW$161, DW_AT_TI_symbol_name("rsvd4")
	.dwattr $C$DW$161, DW_AT_bit_offset(0x18), DW_AT_bit_size(0x04)
	.dwattr $C$DW$161, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$161, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$161, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$161, DW_AT_decl_line(0x12b)
	.dwattr $C$DW$161, DW_AT_decl_column(0x0d)
$C$DW$162	.dwtag  DW_TAG_member
	.dwattr $C$DW$162, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$162, DW_AT_name("CH_MAP_5")
	.dwattr $C$DW$162, DW_AT_TI_symbol_name("CH_MAP_5")
	.dwattr $C$DW$162, DW_AT_bit_offset(0x14), DW_AT_bit_size(0x04)
	.dwattr $C$DW$162, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$162, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$162, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$162, DW_AT_decl_line(0x12c)
	.dwattr $C$DW$162, DW_AT_decl_column(0x0d)
$C$DW$163	.dwtag  DW_TAG_member
	.dwattr $C$DW$163, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$163, DW_AT_name("rsvd12")
	.dwattr $C$DW$163, DW_AT_TI_symbol_name("rsvd12")
	.dwattr $C$DW$163, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x04)
	.dwattr $C$DW$163, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$163, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$163, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$163, DW_AT_decl_line(0x12d)
	.dwattr $C$DW$163, DW_AT_decl_column(0x0d)
$C$DW$164	.dwtag  DW_TAG_member
	.dwattr $C$DW$164, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$164, DW_AT_name("CH_MAP_6")
	.dwattr $C$DW$164, DW_AT_TI_symbol_name("CH_MAP_6")
	.dwattr $C$DW$164, DW_AT_bit_offset(0x0c), DW_AT_bit_size(0x04)
	.dwattr $C$DW$164, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$164, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$164, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$164, DW_AT_decl_line(0x12e)
	.dwattr $C$DW$164, DW_AT_decl_column(0x0d)
$C$DW$165	.dwtag  DW_TAG_member
	.dwattr $C$DW$165, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$165, DW_AT_name("rsvd20")
	.dwattr $C$DW$165, DW_AT_TI_symbol_name("rsvd20")
	.dwattr $C$DW$165, DW_AT_bit_offset(0x08), DW_AT_bit_size(0x04)
	.dwattr $C$DW$165, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$165, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$165, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$165, DW_AT_decl_line(0x12f)
	.dwattr $C$DW$165, DW_AT_decl_column(0x0d)
$C$DW$166	.dwtag  DW_TAG_member
	.dwattr $C$DW$166, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$166, DW_AT_name("CH_MAP_7")
	.dwattr $C$DW$166, DW_AT_TI_symbol_name("CH_MAP_7")
	.dwattr $C$DW$166, DW_AT_bit_offset(0x04), DW_AT_bit_size(0x04)
	.dwattr $C$DW$166, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$166, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$166, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$166, DW_AT_decl_line(0x130)
	.dwattr $C$DW$166, DW_AT_decl_column(0x0d)
$C$DW$167	.dwtag  DW_TAG_member
	.dwattr $C$DW$167, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$167, DW_AT_name("rsvd28")
	.dwattr $C$DW$167, DW_AT_TI_symbol_name("rsvd28")
	.dwattr $C$DW$167, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x04)
	.dwattr $C$DW$167, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$167, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$167, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$167, DW_AT_decl_line(0x131)
	.dwattr $C$DW$167, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$56

	.dwattr $C$DW$T$56, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$56, DW_AT_decl_line(0x129)
	.dwattr $C$DW$T$56, DW_AT_decl_column(0x13)
$C$DW$T$174	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$174, DW_AT_type(*$C$DW$T$56)

$C$DW$T$57	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$57, DW_AT_byte_size(0x04)
$C$DW$168	.dwtag  DW_TAG_member
	.dwattr $C$DW$168, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$168, DW_AT_name("CH_MAP_8")
	.dwattr $C$DW$168, DW_AT_TI_symbol_name("CH_MAP_8")
	.dwattr $C$DW$168, DW_AT_bit_offset(0x1c), DW_AT_bit_size(0x04)
	.dwattr $C$DW$168, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$168, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$168, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$168, DW_AT_decl_line(0x13b)
	.dwattr $C$DW$168, DW_AT_decl_column(0x0d)
$C$DW$169	.dwtag  DW_TAG_member
	.dwattr $C$DW$169, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$169, DW_AT_name("rsvd4")
	.dwattr $C$DW$169, DW_AT_TI_symbol_name("rsvd4")
	.dwattr $C$DW$169, DW_AT_bit_offset(0x18), DW_AT_bit_size(0x04)
	.dwattr $C$DW$169, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$169, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$169, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$169, DW_AT_decl_line(0x13c)
	.dwattr $C$DW$169, DW_AT_decl_column(0x0d)
$C$DW$170	.dwtag  DW_TAG_member
	.dwattr $C$DW$170, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$170, DW_AT_name("CH_MAP_9")
	.dwattr $C$DW$170, DW_AT_TI_symbol_name("CH_MAP_9")
	.dwattr $C$DW$170, DW_AT_bit_offset(0x14), DW_AT_bit_size(0x04)
	.dwattr $C$DW$170, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$170, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$170, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$170, DW_AT_decl_line(0x13d)
	.dwattr $C$DW$170, DW_AT_decl_column(0x0d)
$C$DW$171	.dwtag  DW_TAG_member
	.dwattr $C$DW$171, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$171, DW_AT_name("rsvd12")
	.dwattr $C$DW$171, DW_AT_TI_symbol_name("rsvd12")
	.dwattr $C$DW$171, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x04)
	.dwattr $C$DW$171, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$171, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$171, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$171, DW_AT_decl_line(0x13e)
	.dwattr $C$DW$171, DW_AT_decl_column(0x0d)
$C$DW$172	.dwtag  DW_TAG_member
	.dwattr $C$DW$172, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$172, DW_AT_name("CH_MAP_10")
	.dwattr $C$DW$172, DW_AT_TI_symbol_name("CH_MAP_10")
	.dwattr $C$DW$172, DW_AT_bit_offset(0x0c), DW_AT_bit_size(0x04)
	.dwattr $C$DW$172, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$172, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$172, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$172, DW_AT_decl_line(0x13f)
	.dwattr $C$DW$172, DW_AT_decl_column(0x0d)
$C$DW$173	.dwtag  DW_TAG_member
	.dwattr $C$DW$173, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$173, DW_AT_name("rsvd20")
	.dwattr $C$DW$173, DW_AT_TI_symbol_name("rsvd20")
	.dwattr $C$DW$173, DW_AT_bit_offset(0x08), DW_AT_bit_size(0x04)
	.dwattr $C$DW$173, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$173, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$173, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$173, DW_AT_decl_line(0x140)
	.dwattr $C$DW$173, DW_AT_decl_column(0x0d)
$C$DW$174	.dwtag  DW_TAG_member
	.dwattr $C$DW$174, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$174, DW_AT_name("CH_MAP_11")
	.dwattr $C$DW$174, DW_AT_TI_symbol_name("CH_MAP_11")
	.dwattr $C$DW$174, DW_AT_bit_offset(0x04), DW_AT_bit_size(0x04)
	.dwattr $C$DW$174, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$174, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$174, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$174, DW_AT_decl_line(0x141)
	.dwattr $C$DW$174, DW_AT_decl_column(0x0d)
$C$DW$175	.dwtag  DW_TAG_member
	.dwattr $C$DW$175, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$175, DW_AT_name("rsvd28")
	.dwattr $C$DW$175, DW_AT_TI_symbol_name("rsvd28")
	.dwattr $C$DW$175, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x04)
	.dwattr $C$DW$175, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$175, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$175, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$175, DW_AT_decl_line(0x142)
	.dwattr $C$DW$175, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$57

	.dwattr $C$DW$T$57, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$57, DW_AT_decl_line(0x13a)
	.dwattr $C$DW$T$57, DW_AT_decl_column(0x13)
$C$DW$T$176	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$176, DW_AT_type(*$C$DW$T$57)

$C$DW$T$58	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$58, DW_AT_byte_size(0x04)
$C$DW$176	.dwtag  DW_TAG_member
	.dwattr $C$DW$176, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$176, DW_AT_name("CH_MAP_12")
	.dwattr $C$DW$176, DW_AT_TI_symbol_name("CH_MAP_12")
	.dwattr $C$DW$176, DW_AT_bit_offset(0x1c), DW_AT_bit_size(0x04)
	.dwattr $C$DW$176, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$176, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$176, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$176, DW_AT_decl_line(0x14c)
	.dwattr $C$DW$176, DW_AT_decl_column(0x0d)
$C$DW$177	.dwtag  DW_TAG_member
	.dwattr $C$DW$177, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$177, DW_AT_name("rsvd4")
	.dwattr $C$DW$177, DW_AT_TI_symbol_name("rsvd4")
	.dwattr $C$DW$177, DW_AT_bit_offset(0x18), DW_AT_bit_size(0x04)
	.dwattr $C$DW$177, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$177, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$177, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$177, DW_AT_decl_line(0x14d)
	.dwattr $C$DW$177, DW_AT_decl_column(0x0d)
$C$DW$178	.dwtag  DW_TAG_member
	.dwattr $C$DW$178, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$178, DW_AT_name("CH_MAP_13")
	.dwattr $C$DW$178, DW_AT_TI_symbol_name("CH_MAP_13")
	.dwattr $C$DW$178, DW_AT_bit_offset(0x14), DW_AT_bit_size(0x04)
	.dwattr $C$DW$178, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$178, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$178, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$178, DW_AT_decl_line(0x14e)
	.dwattr $C$DW$178, DW_AT_decl_column(0x0d)
$C$DW$179	.dwtag  DW_TAG_member
	.dwattr $C$DW$179, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$179, DW_AT_name("rsvd12")
	.dwattr $C$DW$179, DW_AT_TI_symbol_name("rsvd12")
	.dwattr $C$DW$179, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x04)
	.dwattr $C$DW$179, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$179, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$179, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$179, DW_AT_decl_line(0x14f)
	.dwattr $C$DW$179, DW_AT_decl_column(0x0d)
$C$DW$180	.dwtag  DW_TAG_member
	.dwattr $C$DW$180, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$180, DW_AT_name("CH_MAP_14")
	.dwattr $C$DW$180, DW_AT_TI_symbol_name("CH_MAP_14")
	.dwattr $C$DW$180, DW_AT_bit_offset(0x0c), DW_AT_bit_size(0x04)
	.dwattr $C$DW$180, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$180, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$180, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$180, DW_AT_decl_line(0x150)
	.dwattr $C$DW$180, DW_AT_decl_column(0x0d)
$C$DW$181	.dwtag  DW_TAG_member
	.dwattr $C$DW$181, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$181, DW_AT_name("rsvd20")
	.dwattr $C$DW$181, DW_AT_TI_symbol_name("rsvd20")
	.dwattr $C$DW$181, DW_AT_bit_offset(0x08), DW_AT_bit_size(0x04)
	.dwattr $C$DW$181, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$181, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$181, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$181, DW_AT_decl_line(0x151)
	.dwattr $C$DW$181, DW_AT_decl_column(0x0d)
$C$DW$182	.dwtag  DW_TAG_member
	.dwattr $C$DW$182, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$182, DW_AT_name("CH_MAP_15")
	.dwattr $C$DW$182, DW_AT_TI_symbol_name("CH_MAP_15")
	.dwattr $C$DW$182, DW_AT_bit_offset(0x04), DW_AT_bit_size(0x04)
	.dwattr $C$DW$182, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$182, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$182, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$182, DW_AT_decl_line(0x152)
	.dwattr $C$DW$182, DW_AT_decl_column(0x0d)
$C$DW$183	.dwtag  DW_TAG_member
	.dwattr $C$DW$183, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$183, DW_AT_name("rsvd28")
	.dwattr $C$DW$183, DW_AT_TI_symbol_name("rsvd28")
	.dwattr $C$DW$183, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x04)
	.dwattr $C$DW$183, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$183, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$183, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$183, DW_AT_decl_line(0x153)
	.dwattr $C$DW$183, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$58

	.dwattr $C$DW$T$58, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$58, DW_AT_decl_line(0x14b)
	.dwattr $C$DW$T$58, DW_AT_decl_column(0x13)
$C$DW$T$178	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$178, DW_AT_type(*$C$DW$T$58)

$C$DW$T$59	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$59, DW_AT_byte_size(0x04)
$C$DW$184	.dwtag  DW_TAG_member
	.dwattr $C$DW$184, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$184, DW_AT_name("CH_MAP_16")
	.dwattr $C$DW$184, DW_AT_TI_symbol_name("CH_MAP_16")
	.dwattr $C$DW$184, DW_AT_bit_offset(0x1c), DW_AT_bit_size(0x04)
	.dwattr $C$DW$184, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$184, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$184, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$184, DW_AT_decl_line(0x15d)
	.dwattr $C$DW$184, DW_AT_decl_column(0x0d)
$C$DW$185	.dwtag  DW_TAG_member
	.dwattr $C$DW$185, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$185, DW_AT_name("rsvd4")
	.dwattr $C$DW$185, DW_AT_TI_symbol_name("rsvd4")
	.dwattr $C$DW$185, DW_AT_bit_offset(0x18), DW_AT_bit_size(0x04)
	.dwattr $C$DW$185, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$185, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$185, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$185, DW_AT_decl_line(0x15e)
	.dwattr $C$DW$185, DW_AT_decl_column(0x0d)
$C$DW$186	.dwtag  DW_TAG_member
	.dwattr $C$DW$186, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$186, DW_AT_name("CH_MAP_17")
	.dwattr $C$DW$186, DW_AT_TI_symbol_name("CH_MAP_17")
	.dwattr $C$DW$186, DW_AT_bit_offset(0x14), DW_AT_bit_size(0x04)
	.dwattr $C$DW$186, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$186, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$186, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$186, DW_AT_decl_line(0x15f)
	.dwattr $C$DW$186, DW_AT_decl_column(0x0d)
$C$DW$187	.dwtag  DW_TAG_member
	.dwattr $C$DW$187, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$187, DW_AT_name("rsvd12")
	.dwattr $C$DW$187, DW_AT_TI_symbol_name("rsvd12")
	.dwattr $C$DW$187, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x04)
	.dwattr $C$DW$187, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$187, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$187, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$187, DW_AT_decl_line(0x160)
	.dwattr $C$DW$187, DW_AT_decl_column(0x0d)
$C$DW$188	.dwtag  DW_TAG_member
	.dwattr $C$DW$188, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$188, DW_AT_name("CH_MAP_18")
	.dwattr $C$DW$188, DW_AT_TI_symbol_name("CH_MAP_18")
	.dwattr $C$DW$188, DW_AT_bit_offset(0x0c), DW_AT_bit_size(0x04)
	.dwattr $C$DW$188, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$188, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$188, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$188, DW_AT_decl_line(0x161)
	.dwattr $C$DW$188, DW_AT_decl_column(0x0d)
$C$DW$189	.dwtag  DW_TAG_member
	.dwattr $C$DW$189, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$189, DW_AT_name("rsvd20")
	.dwattr $C$DW$189, DW_AT_TI_symbol_name("rsvd20")
	.dwattr $C$DW$189, DW_AT_bit_offset(0x08), DW_AT_bit_size(0x04)
	.dwattr $C$DW$189, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$189, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$189, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$189, DW_AT_decl_line(0x162)
	.dwattr $C$DW$189, DW_AT_decl_column(0x0d)
$C$DW$190	.dwtag  DW_TAG_member
	.dwattr $C$DW$190, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$190, DW_AT_name("CH_MAP_19")
	.dwattr $C$DW$190, DW_AT_TI_symbol_name("CH_MAP_19")
	.dwattr $C$DW$190, DW_AT_bit_offset(0x04), DW_AT_bit_size(0x04)
	.dwattr $C$DW$190, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$190, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$190, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$190, DW_AT_decl_line(0x163)
	.dwattr $C$DW$190, DW_AT_decl_column(0x0d)
$C$DW$191	.dwtag  DW_TAG_member
	.dwattr $C$DW$191, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$191, DW_AT_name("rsvd28")
	.dwattr $C$DW$191, DW_AT_TI_symbol_name("rsvd28")
	.dwattr $C$DW$191, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x04)
	.dwattr $C$DW$191, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$191, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$191, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$191, DW_AT_decl_line(0x164)
	.dwattr $C$DW$191, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$59

	.dwattr $C$DW$T$59, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$59, DW_AT_decl_line(0x15c)
	.dwattr $C$DW$T$59, DW_AT_decl_column(0x13)
$C$DW$T$180	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$180, DW_AT_type(*$C$DW$T$59)

$C$DW$T$60	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$60, DW_AT_byte_size(0x04)
$C$DW$192	.dwtag  DW_TAG_member
	.dwattr $C$DW$192, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$192, DW_AT_name("CH_MAP_20")
	.dwattr $C$DW$192, DW_AT_TI_symbol_name("CH_MAP_20")
	.dwattr $C$DW$192, DW_AT_bit_offset(0x1c), DW_AT_bit_size(0x04)
	.dwattr $C$DW$192, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$192, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$192, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$192, DW_AT_decl_line(0x16e)
	.dwattr $C$DW$192, DW_AT_decl_column(0x0d)
$C$DW$193	.dwtag  DW_TAG_member
	.dwattr $C$DW$193, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$193, DW_AT_name("rsvd4")
	.dwattr $C$DW$193, DW_AT_TI_symbol_name("rsvd4")
	.dwattr $C$DW$193, DW_AT_bit_offset(0x18), DW_AT_bit_size(0x04)
	.dwattr $C$DW$193, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$193, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$193, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$193, DW_AT_decl_line(0x16f)
	.dwattr $C$DW$193, DW_AT_decl_column(0x0d)
$C$DW$194	.dwtag  DW_TAG_member
	.dwattr $C$DW$194, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$194, DW_AT_name("CH_MAP_21")
	.dwattr $C$DW$194, DW_AT_TI_symbol_name("CH_MAP_21")
	.dwattr $C$DW$194, DW_AT_bit_offset(0x14), DW_AT_bit_size(0x04)
	.dwattr $C$DW$194, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$194, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$194, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$194, DW_AT_decl_line(0x170)
	.dwattr $C$DW$194, DW_AT_decl_column(0x0d)
$C$DW$195	.dwtag  DW_TAG_member
	.dwattr $C$DW$195, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$195, DW_AT_name("rsvd12")
	.dwattr $C$DW$195, DW_AT_TI_symbol_name("rsvd12")
	.dwattr $C$DW$195, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x04)
	.dwattr $C$DW$195, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$195, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$195, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$195, DW_AT_decl_line(0x171)
	.dwattr $C$DW$195, DW_AT_decl_column(0x0d)
$C$DW$196	.dwtag  DW_TAG_member
	.dwattr $C$DW$196, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$196, DW_AT_name("CH_MAP_22")
	.dwattr $C$DW$196, DW_AT_TI_symbol_name("CH_MAP_22")
	.dwattr $C$DW$196, DW_AT_bit_offset(0x0c), DW_AT_bit_size(0x04)
	.dwattr $C$DW$196, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$196, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$196, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$196, DW_AT_decl_line(0x172)
	.dwattr $C$DW$196, DW_AT_decl_column(0x0d)
$C$DW$197	.dwtag  DW_TAG_member
	.dwattr $C$DW$197, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$197, DW_AT_name("rsvd20")
	.dwattr $C$DW$197, DW_AT_TI_symbol_name("rsvd20")
	.dwattr $C$DW$197, DW_AT_bit_offset(0x08), DW_AT_bit_size(0x04)
	.dwattr $C$DW$197, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$197, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$197, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$197, DW_AT_decl_line(0x173)
	.dwattr $C$DW$197, DW_AT_decl_column(0x0d)
$C$DW$198	.dwtag  DW_TAG_member
	.dwattr $C$DW$198, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$198, DW_AT_name("CH_MAP_23")
	.dwattr $C$DW$198, DW_AT_TI_symbol_name("CH_MAP_23")
	.dwattr $C$DW$198, DW_AT_bit_offset(0x04), DW_AT_bit_size(0x04)
	.dwattr $C$DW$198, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$198, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$198, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$198, DW_AT_decl_line(0x174)
	.dwattr $C$DW$198, DW_AT_decl_column(0x0d)
$C$DW$199	.dwtag  DW_TAG_member
	.dwattr $C$DW$199, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$199, DW_AT_name("rsvd28")
	.dwattr $C$DW$199, DW_AT_TI_symbol_name("rsvd28")
	.dwattr $C$DW$199, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x04)
	.dwattr $C$DW$199, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$199, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$199, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$199, DW_AT_decl_line(0x175)
	.dwattr $C$DW$199, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$60

	.dwattr $C$DW$T$60, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$60, DW_AT_decl_line(0x16d)
	.dwattr $C$DW$T$60, DW_AT_decl_column(0x13)
$C$DW$T$182	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$182, DW_AT_type(*$C$DW$T$60)

$C$DW$T$61	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$61, DW_AT_byte_size(0x04)
$C$DW$200	.dwtag  DW_TAG_member
	.dwattr $C$DW$200, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$200, DW_AT_name("CH_MAP_24")
	.dwattr $C$DW$200, DW_AT_TI_symbol_name("CH_MAP_24")
	.dwattr $C$DW$200, DW_AT_bit_offset(0x1c), DW_AT_bit_size(0x04)
	.dwattr $C$DW$200, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$200, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$200, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$200, DW_AT_decl_line(0x17f)
	.dwattr $C$DW$200, DW_AT_decl_column(0x0d)
$C$DW$201	.dwtag  DW_TAG_member
	.dwattr $C$DW$201, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$201, DW_AT_name("rsvd4")
	.dwattr $C$DW$201, DW_AT_TI_symbol_name("rsvd4")
	.dwattr $C$DW$201, DW_AT_bit_offset(0x18), DW_AT_bit_size(0x04)
	.dwattr $C$DW$201, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$201, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$201, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$201, DW_AT_decl_line(0x180)
	.dwattr $C$DW$201, DW_AT_decl_column(0x0d)
$C$DW$202	.dwtag  DW_TAG_member
	.dwattr $C$DW$202, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$202, DW_AT_name("CH_MAP_25")
	.dwattr $C$DW$202, DW_AT_TI_symbol_name("CH_MAP_25")
	.dwattr $C$DW$202, DW_AT_bit_offset(0x14), DW_AT_bit_size(0x04)
	.dwattr $C$DW$202, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$202, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$202, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$202, DW_AT_decl_line(0x181)
	.dwattr $C$DW$202, DW_AT_decl_column(0x0d)
$C$DW$203	.dwtag  DW_TAG_member
	.dwattr $C$DW$203, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$203, DW_AT_name("rsvd12")
	.dwattr $C$DW$203, DW_AT_TI_symbol_name("rsvd12")
	.dwattr $C$DW$203, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x04)
	.dwattr $C$DW$203, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$203, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$203, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$203, DW_AT_decl_line(0x182)
	.dwattr $C$DW$203, DW_AT_decl_column(0x0d)
$C$DW$204	.dwtag  DW_TAG_member
	.dwattr $C$DW$204, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$204, DW_AT_name("CH_MAP_26")
	.dwattr $C$DW$204, DW_AT_TI_symbol_name("CH_MAP_26")
	.dwattr $C$DW$204, DW_AT_bit_offset(0x0c), DW_AT_bit_size(0x04)
	.dwattr $C$DW$204, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$204, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$204, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$204, DW_AT_decl_line(0x183)
	.dwattr $C$DW$204, DW_AT_decl_column(0x0d)
$C$DW$205	.dwtag  DW_TAG_member
	.dwattr $C$DW$205, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$205, DW_AT_name("rsvd20")
	.dwattr $C$DW$205, DW_AT_TI_symbol_name("rsvd20")
	.dwattr $C$DW$205, DW_AT_bit_offset(0x08), DW_AT_bit_size(0x04)
	.dwattr $C$DW$205, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$205, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$205, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$205, DW_AT_decl_line(0x184)
	.dwattr $C$DW$205, DW_AT_decl_column(0x0d)
$C$DW$206	.dwtag  DW_TAG_member
	.dwattr $C$DW$206, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$206, DW_AT_name("CH_MAP_27")
	.dwattr $C$DW$206, DW_AT_TI_symbol_name("CH_MAP_27")
	.dwattr $C$DW$206, DW_AT_bit_offset(0x04), DW_AT_bit_size(0x04)
	.dwattr $C$DW$206, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$206, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$206, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$206, DW_AT_decl_line(0x185)
	.dwattr $C$DW$206, DW_AT_decl_column(0x0d)
$C$DW$207	.dwtag  DW_TAG_member
	.dwattr $C$DW$207, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$207, DW_AT_name("rsvd28")
	.dwattr $C$DW$207, DW_AT_TI_symbol_name("rsvd28")
	.dwattr $C$DW$207, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x04)
	.dwattr $C$DW$207, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$207, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$207, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$207, DW_AT_decl_line(0x186)
	.dwattr $C$DW$207, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$61

	.dwattr $C$DW$T$61, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$61, DW_AT_decl_line(0x17e)
	.dwattr $C$DW$T$61, DW_AT_decl_column(0x13)
$C$DW$T$184	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$184, DW_AT_type(*$C$DW$T$61)

$C$DW$T$62	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$62, DW_AT_byte_size(0x04)
$C$DW$208	.dwtag  DW_TAG_member
	.dwattr $C$DW$208, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$208, DW_AT_name("CH_MAP_28")
	.dwattr $C$DW$208, DW_AT_TI_symbol_name("CH_MAP_28")
	.dwattr $C$DW$208, DW_AT_bit_offset(0x1c), DW_AT_bit_size(0x04)
	.dwattr $C$DW$208, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$208, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$208, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$208, DW_AT_decl_line(0x190)
	.dwattr $C$DW$208, DW_AT_decl_column(0x0d)
$C$DW$209	.dwtag  DW_TAG_member
	.dwattr $C$DW$209, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$209, DW_AT_name("rsvd4")
	.dwattr $C$DW$209, DW_AT_TI_symbol_name("rsvd4")
	.dwattr $C$DW$209, DW_AT_bit_offset(0x18), DW_AT_bit_size(0x04)
	.dwattr $C$DW$209, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$209, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$209, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$209, DW_AT_decl_line(0x191)
	.dwattr $C$DW$209, DW_AT_decl_column(0x0d)
$C$DW$210	.dwtag  DW_TAG_member
	.dwattr $C$DW$210, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$210, DW_AT_name("CH_MAP_29")
	.dwattr $C$DW$210, DW_AT_TI_symbol_name("CH_MAP_29")
	.dwattr $C$DW$210, DW_AT_bit_offset(0x14), DW_AT_bit_size(0x04)
	.dwattr $C$DW$210, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$210, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$210, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$210, DW_AT_decl_line(0x192)
	.dwattr $C$DW$210, DW_AT_decl_column(0x0d)
$C$DW$211	.dwtag  DW_TAG_member
	.dwattr $C$DW$211, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$211, DW_AT_name("rsvd12")
	.dwattr $C$DW$211, DW_AT_TI_symbol_name("rsvd12")
	.dwattr $C$DW$211, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x04)
	.dwattr $C$DW$211, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$211, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$211, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$211, DW_AT_decl_line(0x193)
	.dwattr $C$DW$211, DW_AT_decl_column(0x0d)
$C$DW$212	.dwtag  DW_TAG_member
	.dwattr $C$DW$212, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$212, DW_AT_name("CH_MAP_30")
	.dwattr $C$DW$212, DW_AT_TI_symbol_name("CH_MAP_30")
	.dwattr $C$DW$212, DW_AT_bit_offset(0x0c), DW_AT_bit_size(0x04)
	.dwattr $C$DW$212, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$212, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$212, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$212, DW_AT_decl_line(0x194)
	.dwattr $C$DW$212, DW_AT_decl_column(0x0d)
$C$DW$213	.dwtag  DW_TAG_member
	.dwattr $C$DW$213, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$213, DW_AT_name("rsvd20")
	.dwattr $C$DW$213, DW_AT_TI_symbol_name("rsvd20")
	.dwattr $C$DW$213, DW_AT_bit_offset(0x08), DW_AT_bit_size(0x04)
	.dwattr $C$DW$213, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$213, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$213, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$213, DW_AT_decl_line(0x195)
	.dwattr $C$DW$213, DW_AT_decl_column(0x0d)
$C$DW$214	.dwtag  DW_TAG_member
	.dwattr $C$DW$214, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$214, DW_AT_name("CH_MAP_31")
	.dwattr $C$DW$214, DW_AT_TI_symbol_name("CH_MAP_31")
	.dwattr $C$DW$214, DW_AT_bit_offset(0x04), DW_AT_bit_size(0x04)
	.dwattr $C$DW$214, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$214, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$214, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$214, DW_AT_decl_line(0x196)
	.dwattr $C$DW$214, DW_AT_decl_column(0x0d)
$C$DW$215	.dwtag  DW_TAG_member
	.dwattr $C$DW$215, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$215, DW_AT_name("rsvd28")
	.dwattr $C$DW$215, DW_AT_TI_symbol_name("rsvd28")
	.dwattr $C$DW$215, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x04)
	.dwattr $C$DW$215, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$215, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$215, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$215, DW_AT_decl_line(0x197)
	.dwattr $C$DW$215, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$62

	.dwattr $C$DW$T$62, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$62, DW_AT_decl_line(0x18f)
	.dwattr $C$DW$T$62, DW_AT_decl_column(0x13)
$C$DW$T$186	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$186, DW_AT_type(*$C$DW$T$62)

$C$DW$T$63	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$63, DW_AT_byte_size(0x04)
$C$DW$216	.dwtag  DW_TAG_member
	.dwattr $C$DW$216, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$216, DW_AT_name("CH_MAP_32")
	.dwattr $C$DW$216, DW_AT_TI_symbol_name("CH_MAP_32")
	.dwattr $C$DW$216, DW_AT_bit_offset(0x1c), DW_AT_bit_size(0x04)
	.dwattr $C$DW$216, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$216, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$216, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$216, DW_AT_decl_line(0x1a1)
	.dwattr $C$DW$216, DW_AT_decl_column(0x0d)
$C$DW$217	.dwtag  DW_TAG_member
	.dwattr $C$DW$217, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$217, DW_AT_name("rsvd4")
	.dwattr $C$DW$217, DW_AT_TI_symbol_name("rsvd4")
	.dwattr $C$DW$217, DW_AT_bit_offset(0x18), DW_AT_bit_size(0x04)
	.dwattr $C$DW$217, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$217, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$217, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$217, DW_AT_decl_line(0x1a2)
	.dwattr $C$DW$217, DW_AT_decl_column(0x0d)
$C$DW$218	.dwtag  DW_TAG_member
	.dwattr $C$DW$218, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$218, DW_AT_name("CH_MAP_33")
	.dwattr $C$DW$218, DW_AT_TI_symbol_name("CH_MAP_33")
	.dwattr $C$DW$218, DW_AT_bit_offset(0x14), DW_AT_bit_size(0x04)
	.dwattr $C$DW$218, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$218, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$218, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$218, DW_AT_decl_line(0x1a3)
	.dwattr $C$DW$218, DW_AT_decl_column(0x0d)
$C$DW$219	.dwtag  DW_TAG_member
	.dwattr $C$DW$219, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$219, DW_AT_name("rsvd12")
	.dwattr $C$DW$219, DW_AT_TI_symbol_name("rsvd12")
	.dwattr $C$DW$219, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x04)
	.dwattr $C$DW$219, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$219, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$219, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$219, DW_AT_decl_line(0x1a4)
	.dwattr $C$DW$219, DW_AT_decl_column(0x0d)
$C$DW$220	.dwtag  DW_TAG_member
	.dwattr $C$DW$220, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$220, DW_AT_name("CH_MAP_34")
	.dwattr $C$DW$220, DW_AT_TI_symbol_name("CH_MAP_34")
	.dwattr $C$DW$220, DW_AT_bit_offset(0x0c), DW_AT_bit_size(0x04)
	.dwattr $C$DW$220, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$220, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$220, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$220, DW_AT_decl_line(0x1a5)
	.dwattr $C$DW$220, DW_AT_decl_column(0x0d)
$C$DW$221	.dwtag  DW_TAG_member
	.dwattr $C$DW$221, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$221, DW_AT_name("rsvd20")
	.dwattr $C$DW$221, DW_AT_TI_symbol_name("rsvd20")
	.dwattr $C$DW$221, DW_AT_bit_offset(0x08), DW_AT_bit_size(0x04)
	.dwattr $C$DW$221, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$221, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$221, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$221, DW_AT_decl_line(0x1a6)
	.dwattr $C$DW$221, DW_AT_decl_column(0x0d)
$C$DW$222	.dwtag  DW_TAG_member
	.dwattr $C$DW$222, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$222, DW_AT_name("CH_MAP_35")
	.dwattr $C$DW$222, DW_AT_TI_symbol_name("CH_MAP_35")
	.dwattr $C$DW$222, DW_AT_bit_offset(0x04), DW_AT_bit_size(0x04)
	.dwattr $C$DW$222, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$222, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$222, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$222, DW_AT_decl_line(0x1a7)
	.dwattr $C$DW$222, DW_AT_decl_column(0x0d)
$C$DW$223	.dwtag  DW_TAG_member
	.dwattr $C$DW$223, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$223, DW_AT_name("rsvd28")
	.dwattr $C$DW$223, DW_AT_TI_symbol_name("rsvd28")
	.dwattr $C$DW$223, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x04)
	.dwattr $C$DW$223, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$223, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$223, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$223, DW_AT_decl_line(0x1a8)
	.dwattr $C$DW$223, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$63

	.dwattr $C$DW$T$63, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$63, DW_AT_decl_line(0x1a0)
	.dwattr $C$DW$T$63, DW_AT_decl_column(0x13)
$C$DW$T$188	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$188, DW_AT_type(*$C$DW$T$63)

$C$DW$T$64	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$64, DW_AT_byte_size(0x04)
$C$DW$224	.dwtag  DW_TAG_member
	.dwattr $C$DW$224, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$224, DW_AT_name("CH_MAP_36")
	.dwattr $C$DW$224, DW_AT_TI_symbol_name("CH_MAP_36")
	.dwattr $C$DW$224, DW_AT_bit_offset(0x1c), DW_AT_bit_size(0x04)
	.dwattr $C$DW$224, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$224, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$224, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$224, DW_AT_decl_line(0x1b2)
	.dwattr $C$DW$224, DW_AT_decl_column(0x0d)
$C$DW$225	.dwtag  DW_TAG_member
	.dwattr $C$DW$225, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$225, DW_AT_name("rsvd4")
	.dwattr $C$DW$225, DW_AT_TI_symbol_name("rsvd4")
	.dwattr $C$DW$225, DW_AT_bit_offset(0x18), DW_AT_bit_size(0x04)
	.dwattr $C$DW$225, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$225, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$225, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$225, DW_AT_decl_line(0x1b3)
	.dwattr $C$DW$225, DW_AT_decl_column(0x0d)
$C$DW$226	.dwtag  DW_TAG_member
	.dwattr $C$DW$226, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$226, DW_AT_name("CH_MAP_37")
	.dwattr $C$DW$226, DW_AT_TI_symbol_name("CH_MAP_37")
	.dwattr $C$DW$226, DW_AT_bit_offset(0x14), DW_AT_bit_size(0x04)
	.dwattr $C$DW$226, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$226, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$226, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$226, DW_AT_decl_line(0x1b4)
	.dwattr $C$DW$226, DW_AT_decl_column(0x0d)
$C$DW$227	.dwtag  DW_TAG_member
	.dwattr $C$DW$227, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$227, DW_AT_name("rsvd12")
	.dwattr $C$DW$227, DW_AT_TI_symbol_name("rsvd12")
	.dwattr $C$DW$227, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x04)
	.dwattr $C$DW$227, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$227, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$227, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$227, DW_AT_decl_line(0x1b5)
	.dwattr $C$DW$227, DW_AT_decl_column(0x0d)
$C$DW$228	.dwtag  DW_TAG_member
	.dwattr $C$DW$228, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$228, DW_AT_name("CH_MAP_38")
	.dwattr $C$DW$228, DW_AT_TI_symbol_name("CH_MAP_38")
	.dwattr $C$DW$228, DW_AT_bit_offset(0x0c), DW_AT_bit_size(0x04)
	.dwattr $C$DW$228, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$228, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$228, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$228, DW_AT_decl_line(0x1b6)
	.dwattr $C$DW$228, DW_AT_decl_column(0x0d)
$C$DW$229	.dwtag  DW_TAG_member
	.dwattr $C$DW$229, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$229, DW_AT_name("rsvd20")
	.dwattr $C$DW$229, DW_AT_TI_symbol_name("rsvd20")
	.dwattr $C$DW$229, DW_AT_bit_offset(0x08), DW_AT_bit_size(0x04)
	.dwattr $C$DW$229, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$229, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$229, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$229, DW_AT_decl_line(0x1b7)
	.dwattr $C$DW$229, DW_AT_decl_column(0x0d)
$C$DW$230	.dwtag  DW_TAG_member
	.dwattr $C$DW$230, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$230, DW_AT_name("CH_MAP_39")
	.dwattr $C$DW$230, DW_AT_TI_symbol_name("CH_MAP_39")
	.dwattr $C$DW$230, DW_AT_bit_offset(0x04), DW_AT_bit_size(0x04)
	.dwattr $C$DW$230, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$230, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$230, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$230, DW_AT_decl_line(0x1b8)
	.dwattr $C$DW$230, DW_AT_decl_column(0x0d)
$C$DW$231	.dwtag  DW_TAG_member
	.dwattr $C$DW$231, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$231, DW_AT_name("rsvd28")
	.dwattr $C$DW$231, DW_AT_TI_symbol_name("rsvd28")
	.dwattr $C$DW$231, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x04)
	.dwattr $C$DW$231, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$231, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$231, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$231, DW_AT_decl_line(0x1b9)
	.dwattr $C$DW$231, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$64

	.dwattr $C$DW$T$64, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$64, DW_AT_decl_line(0x1b1)
	.dwattr $C$DW$T$64, DW_AT_decl_column(0x13)
$C$DW$T$190	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$190, DW_AT_type(*$C$DW$T$64)

$C$DW$T$65	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$65, DW_AT_byte_size(0x04)
$C$DW$232	.dwtag  DW_TAG_member
	.dwattr $C$DW$232, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$232, DW_AT_name("CH_MAP_40")
	.dwattr $C$DW$232, DW_AT_TI_symbol_name("CH_MAP_40")
	.dwattr $C$DW$232, DW_AT_bit_offset(0x1c), DW_AT_bit_size(0x04)
	.dwattr $C$DW$232, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$232, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$232, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$232, DW_AT_decl_line(0x1c3)
	.dwattr $C$DW$232, DW_AT_decl_column(0x0d)
$C$DW$233	.dwtag  DW_TAG_member
	.dwattr $C$DW$233, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$233, DW_AT_name("rsvd4")
	.dwattr $C$DW$233, DW_AT_TI_symbol_name("rsvd4")
	.dwattr $C$DW$233, DW_AT_bit_offset(0x18), DW_AT_bit_size(0x04)
	.dwattr $C$DW$233, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$233, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$233, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$233, DW_AT_decl_line(0x1c4)
	.dwattr $C$DW$233, DW_AT_decl_column(0x0d)
$C$DW$234	.dwtag  DW_TAG_member
	.dwattr $C$DW$234, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$234, DW_AT_name("CH_MAP_41")
	.dwattr $C$DW$234, DW_AT_TI_symbol_name("CH_MAP_41")
	.dwattr $C$DW$234, DW_AT_bit_offset(0x14), DW_AT_bit_size(0x04)
	.dwattr $C$DW$234, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$234, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$234, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$234, DW_AT_decl_line(0x1c5)
	.dwattr $C$DW$234, DW_AT_decl_column(0x0d)
$C$DW$235	.dwtag  DW_TAG_member
	.dwattr $C$DW$235, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$235, DW_AT_name("rsvd12")
	.dwattr $C$DW$235, DW_AT_TI_symbol_name("rsvd12")
	.dwattr $C$DW$235, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x04)
	.dwattr $C$DW$235, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$235, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$235, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$235, DW_AT_decl_line(0x1c6)
	.dwattr $C$DW$235, DW_AT_decl_column(0x0d)
$C$DW$236	.dwtag  DW_TAG_member
	.dwattr $C$DW$236, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$236, DW_AT_name("CH_MAP_42")
	.dwattr $C$DW$236, DW_AT_TI_symbol_name("CH_MAP_42")
	.dwattr $C$DW$236, DW_AT_bit_offset(0x0c), DW_AT_bit_size(0x04)
	.dwattr $C$DW$236, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$236, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$236, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$236, DW_AT_decl_line(0x1c7)
	.dwattr $C$DW$236, DW_AT_decl_column(0x0d)
$C$DW$237	.dwtag  DW_TAG_member
	.dwattr $C$DW$237, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$237, DW_AT_name("rsvd20")
	.dwattr $C$DW$237, DW_AT_TI_symbol_name("rsvd20")
	.dwattr $C$DW$237, DW_AT_bit_offset(0x08), DW_AT_bit_size(0x04)
	.dwattr $C$DW$237, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$237, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$237, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$237, DW_AT_decl_line(0x1c8)
	.dwattr $C$DW$237, DW_AT_decl_column(0x0d)
$C$DW$238	.dwtag  DW_TAG_member
	.dwattr $C$DW$238, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$238, DW_AT_name("CH_MAP_43")
	.dwattr $C$DW$238, DW_AT_TI_symbol_name("CH_MAP_43")
	.dwattr $C$DW$238, DW_AT_bit_offset(0x04), DW_AT_bit_size(0x04)
	.dwattr $C$DW$238, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$238, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$238, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$238, DW_AT_decl_line(0x1c9)
	.dwattr $C$DW$238, DW_AT_decl_column(0x0d)
$C$DW$239	.dwtag  DW_TAG_member
	.dwattr $C$DW$239, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$239, DW_AT_name("rsvd28")
	.dwattr $C$DW$239, DW_AT_TI_symbol_name("rsvd28")
	.dwattr $C$DW$239, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x04)
	.dwattr $C$DW$239, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$239, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$239, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$239, DW_AT_decl_line(0x1ca)
	.dwattr $C$DW$239, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$65

	.dwattr $C$DW$T$65, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$65, DW_AT_decl_line(0x1c2)
	.dwattr $C$DW$T$65, DW_AT_decl_column(0x13)
$C$DW$T$192	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$192, DW_AT_type(*$C$DW$T$65)

$C$DW$T$66	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$66, DW_AT_byte_size(0x04)
$C$DW$240	.dwtag  DW_TAG_member
	.dwattr $C$DW$240, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$240, DW_AT_name("CH_MAP_44")
	.dwattr $C$DW$240, DW_AT_TI_symbol_name("CH_MAP_44")
	.dwattr $C$DW$240, DW_AT_bit_offset(0x1c), DW_AT_bit_size(0x04)
	.dwattr $C$DW$240, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$240, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$240, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$240, DW_AT_decl_line(0x1d4)
	.dwattr $C$DW$240, DW_AT_decl_column(0x0d)
$C$DW$241	.dwtag  DW_TAG_member
	.dwattr $C$DW$241, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$241, DW_AT_name("rsvd4")
	.dwattr $C$DW$241, DW_AT_TI_symbol_name("rsvd4")
	.dwattr $C$DW$241, DW_AT_bit_offset(0x18), DW_AT_bit_size(0x04)
	.dwattr $C$DW$241, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$241, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$241, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$241, DW_AT_decl_line(0x1d5)
	.dwattr $C$DW$241, DW_AT_decl_column(0x0d)
$C$DW$242	.dwtag  DW_TAG_member
	.dwattr $C$DW$242, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$242, DW_AT_name("CH_MAP_45")
	.dwattr $C$DW$242, DW_AT_TI_symbol_name("CH_MAP_45")
	.dwattr $C$DW$242, DW_AT_bit_offset(0x14), DW_AT_bit_size(0x04)
	.dwattr $C$DW$242, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$242, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$242, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$242, DW_AT_decl_line(0x1d6)
	.dwattr $C$DW$242, DW_AT_decl_column(0x0d)
$C$DW$243	.dwtag  DW_TAG_member
	.dwattr $C$DW$243, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$243, DW_AT_name("rsvd12")
	.dwattr $C$DW$243, DW_AT_TI_symbol_name("rsvd12")
	.dwattr $C$DW$243, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x04)
	.dwattr $C$DW$243, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$243, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$243, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$243, DW_AT_decl_line(0x1d7)
	.dwattr $C$DW$243, DW_AT_decl_column(0x0d)
$C$DW$244	.dwtag  DW_TAG_member
	.dwattr $C$DW$244, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$244, DW_AT_name("CH_MAP_46")
	.dwattr $C$DW$244, DW_AT_TI_symbol_name("CH_MAP_46")
	.dwattr $C$DW$244, DW_AT_bit_offset(0x0c), DW_AT_bit_size(0x04)
	.dwattr $C$DW$244, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$244, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$244, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$244, DW_AT_decl_line(0x1d8)
	.dwattr $C$DW$244, DW_AT_decl_column(0x0d)
$C$DW$245	.dwtag  DW_TAG_member
	.dwattr $C$DW$245, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$245, DW_AT_name("rsvd20")
	.dwattr $C$DW$245, DW_AT_TI_symbol_name("rsvd20")
	.dwattr $C$DW$245, DW_AT_bit_offset(0x08), DW_AT_bit_size(0x04)
	.dwattr $C$DW$245, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$245, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$245, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$245, DW_AT_decl_line(0x1d9)
	.dwattr $C$DW$245, DW_AT_decl_column(0x0d)
$C$DW$246	.dwtag  DW_TAG_member
	.dwattr $C$DW$246, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$246, DW_AT_name("CH_MAP_47")
	.dwattr $C$DW$246, DW_AT_TI_symbol_name("CH_MAP_47")
	.dwattr $C$DW$246, DW_AT_bit_offset(0x04), DW_AT_bit_size(0x04)
	.dwattr $C$DW$246, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$246, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$246, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$246, DW_AT_decl_line(0x1da)
	.dwattr $C$DW$246, DW_AT_decl_column(0x0d)
$C$DW$247	.dwtag  DW_TAG_member
	.dwattr $C$DW$247, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$247, DW_AT_name("rsvd28")
	.dwattr $C$DW$247, DW_AT_TI_symbol_name("rsvd28")
	.dwattr $C$DW$247, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x04)
	.dwattr $C$DW$247, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$247, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$247, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$247, DW_AT_decl_line(0x1db)
	.dwattr $C$DW$247, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$66

	.dwattr $C$DW$T$66, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$66, DW_AT_decl_line(0x1d3)
	.dwattr $C$DW$T$66, DW_AT_decl_column(0x13)
$C$DW$T$194	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$194, DW_AT_type(*$C$DW$T$66)

$C$DW$T$67	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$67, DW_AT_byte_size(0x04)
$C$DW$248	.dwtag  DW_TAG_member
	.dwattr $C$DW$248, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$248, DW_AT_name("CH_MAP_48")
	.dwattr $C$DW$248, DW_AT_TI_symbol_name("CH_MAP_48")
	.dwattr $C$DW$248, DW_AT_bit_offset(0x1c), DW_AT_bit_size(0x04)
	.dwattr $C$DW$248, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$248, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$248, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$248, DW_AT_decl_line(0x1e5)
	.dwattr $C$DW$248, DW_AT_decl_column(0x0d)
$C$DW$249	.dwtag  DW_TAG_member
	.dwattr $C$DW$249, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$249, DW_AT_name("rsvd4")
	.dwattr $C$DW$249, DW_AT_TI_symbol_name("rsvd4")
	.dwattr $C$DW$249, DW_AT_bit_offset(0x18), DW_AT_bit_size(0x04)
	.dwattr $C$DW$249, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$249, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$249, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$249, DW_AT_decl_line(0x1e6)
	.dwattr $C$DW$249, DW_AT_decl_column(0x0d)
$C$DW$250	.dwtag  DW_TAG_member
	.dwattr $C$DW$250, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$250, DW_AT_name("CH_MAP_49")
	.dwattr $C$DW$250, DW_AT_TI_symbol_name("CH_MAP_49")
	.dwattr $C$DW$250, DW_AT_bit_offset(0x14), DW_AT_bit_size(0x04)
	.dwattr $C$DW$250, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$250, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$250, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$250, DW_AT_decl_line(0x1e7)
	.dwattr $C$DW$250, DW_AT_decl_column(0x0d)
$C$DW$251	.dwtag  DW_TAG_member
	.dwattr $C$DW$251, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$251, DW_AT_name("rsvd12")
	.dwattr $C$DW$251, DW_AT_TI_symbol_name("rsvd12")
	.dwattr $C$DW$251, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x04)
	.dwattr $C$DW$251, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$251, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$251, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$251, DW_AT_decl_line(0x1e8)
	.dwattr $C$DW$251, DW_AT_decl_column(0x0d)
$C$DW$252	.dwtag  DW_TAG_member
	.dwattr $C$DW$252, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$252, DW_AT_name("CH_MAP_50")
	.dwattr $C$DW$252, DW_AT_TI_symbol_name("CH_MAP_50")
	.dwattr $C$DW$252, DW_AT_bit_offset(0x0c), DW_AT_bit_size(0x04)
	.dwattr $C$DW$252, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$252, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$252, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$252, DW_AT_decl_line(0x1e9)
	.dwattr $C$DW$252, DW_AT_decl_column(0x0d)
$C$DW$253	.dwtag  DW_TAG_member
	.dwattr $C$DW$253, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$253, DW_AT_name("rsvd20")
	.dwattr $C$DW$253, DW_AT_TI_symbol_name("rsvd20")
	.dwattr $C$DW$253, DW_AT_bit_offset(0x08), DW_AT_bit_size(0x04)
	.dwattr $C$DW$253, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$253, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$253, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$253, DW_AT_decl_line(0x1ea)
	.dwattr $C$DW$253, DW_AT_decl_column(0x0d)
$C$DW$254	.dwtag  DW_TAG_member
	.dwattr $C$DW$254, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$254, DW_AT_name("CH_MAP_51")
	.dwattr $C$DW$254, DW_AT_TI_symbol_name("CH_MAP_51")
	.dwattr $C$DW$254, DW_AT_bit_offset(0x04), DW_AT_bit_size(0x04)
	.dwattr $C$DW$254, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$254, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$254, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$254, DW_AT_decl_line(0x1eb)
	.dwattr $C$DW$254, DW_AT_decl_column(0x0d)
$C$DW$255	.dwtag  DW_TAG_member
	.dwattr $C$DW$255, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$255, DW_AT_name("rsvd28")
	.dwattr $C$DW$255, DW_AT_TI_symbol_name("rsvd28")
	.dwattr $C$DW$255, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x04)
	.dwattr $C$DW$255, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$255, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$255, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$255, DW_AT_decl_line(0x1ec)
	.dwattr $C$DW$255, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$67

	.dwattr $C$DW$T$67, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$67, DW_AT_decl_line(0x1e4)
	.dwattr $C$DW$T$67, DW_AT_decl_column(0x13)
$C$DW$T$196	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$196, DW_AT_type(*$C$DW$T$67)

$C$DW$T$68	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$68, DW_AT_byte_size(0x04)
$C$DW$256	.dwtag  DW_TAG_member
	.dwattr $C$DW$256, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$256, DW_AT_name("CH_MAP_52")
	.dwattr $C$DW$256, DW_AT_TI_symbol_name("CH_MAP_52")
	.dwattr $C$DW$256, DW_AT_bit_offset(0x1c), DW_AT_bit_size(0x04)
	.dwattr $C$DW$256, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$256, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$256, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$256, DW_AT_decl_line(0x1f6)
	.dwattr $C$DW$256, DW_AT_decl_column(0x0d)
$C$DW$257	.dwtag  DW_TAG_member
	.dwattr $C$DW$257, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$257, DW_AT_name("rsvd4")
	.dwattr $C$DW$257, DW_AT_TI_symbol_name("rsvd4")
	.dwattr $C$DW$257, DW_AT_bit_offset(0x18), DW_AT_bit_size(0x04)
	.dwattr $C$DW$257, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$257, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$257, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$257, DW_AT_decl_line(0x1f7)
	.dwattr $C$DW$257, DW_AT_decl_column(0x0d)
$C$DW$258	.dwtag  DW_TAG_member
	.dwattr $C$DW$258, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$258, DW_AT_name("CH_MAP_53")
	.dwattr $C$DW$258, DW_AT_TI_symbol_name("CH_MAP_53")
	.dwattr $C$DW$258, DW_AT_bit_offset(0x14), DW_AT_bit_size(0x04)
	.dwattr $C$DW$258, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$258, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$258, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$258, DW_AT_decl_line(0x1f8)
	.dwattr $C$DW$258, DW_AT_decl_column(0x0d)
$C$DW$259	.dwtag  DW_TAG_member
	.dwattr $C$DW$259, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$259, DW_AT_name("rsvd12")
	.dwattr $C$DW$259, DW_AT_TI_symbol_name("rsvd12")
	.dwattr $C$DW$259, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x04)
	.dwattr $C$DW$259, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$259, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$259, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$259, DW_AT_decl_line(0x1f9)
	.dwattr $C$DW$259, DW_AT_decl_column(0x0d)
$C$DW$260	.dwtag  DW_TAG_member
	.dwattr $C$DW$260, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$260, DW_AT_name("CH_MAP_54")
	.dwattr $C$DW$260, DW_AT_TI_symbol_name("CH_MAP_54")
	.dwattr $C$DW$260, DW_AT_bit_offset(0x0c), DW_AT_bit_size(0x04)
	.dwattr $C$DW$260, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$260, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$260, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$260, DW_AT_decl_line(0x1fa)
	.dwattr $C$DW$260, DW_AT_decl_column(0x0d)
$C$DW$261	.dwtag  DW_TAG_member
	.dwattr $C$DW$261, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$261, DW_AT_name("rsvd20")
	.dwattr $C$DW$261, DW_AT_TI_symbol_name("rsvd20")
	.dwattr $C$DW$261, DW_AT_bit_offset(0x08), DW_AT_bit_size(0x04)
	.dwattr $C$DW$261, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$261, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$261, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$261, DW_AT_decl_line(0x1fb)
	.dwattr $C$DW$261, DW_AT_decl_column(0x0d)
$C$DW$262	.dwtag  DW_TAG_member
	.dwattr $C$DW$262, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$262, DW_AT_name("CH_MAP_55")
	.dwattr $C$DW$262, DW_AT_TI_symbol_name("CH_MAP_55")
	.dwattr $C$DW$262, DW_AT_bit_offset(0x04), DW_AT_bit_size(0x04)
	.dwattr $C$DW$262, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$262, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$262, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$262, DW_AT_decl_line(0x1fc)
	.dwattr $C$DW$262, DW_AT_decl_column(0x0d)
$C$DW$263	.dwtag  DW_TAG_member
	.dwattr $C$DW$263, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$263, DW_AT_name("rsvd28")
	.dwattr $C$DW$263, DW_AT_TI_symbol_name("rsvd28")
	.dwattr $C$DW$263, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x04)
	.dwattr $C$DW$263, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$263, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$263, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$263, DW_AT_decl_line(0x1fd)
	.dwattr $C$DW$263, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$68

	.dwattr $C$DW$T$68, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$68, DW_AT_decl_line(0x1f5)
	.dwattr $C$DW$T$68, DW_AT_decl_column(0x13)
$C$DW$T$198	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$198, DW_AT_type(*$C$DW$T$68)

$C$DW$T$69	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$69, DW_AT_byte_size(0x04)
$C$DW$264	.dwtag  DW_TAG_member
	.dwattr $C$DW$264, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$264, DW_AT_name("CH_MAP_56")
	.dwattr $C$DW$264, DW_AT_TI_symbol_name("CH_MAP_56")
	.dwattr $C$DW$264, DW_AT_bit_offset(0x1c), DW_AT_bit_size(0x04)
	.dwattr $C$DW$264, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$264, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$264, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$264, DW_AT_decl_line(0x207)
	.dwattr $C$DW$264, DW_AT_decl_column(0x0d)
$C$DW$265	.dwtag  DW_TAG_member
	.dwattr $C$DW$265, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$265, DW_AT_name("rsvd4")
	.dwattr $C$DW$265, DW_AT_TI_symbol_name("rsvd4")
	.dwattr $C$DW$265, DW_AT_bit_offset(0x18), DW_AT_bit_size(0x04)
	.dwattr $C$DW$265, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$265, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$265, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$265, DW_AT_decl_line(0x208)
	.dwattr $C$DW$265, DW_AT_decl_column(0x0d)
$C$DW$266	.dwtag  DW_TAG_member
	.dwattr $C$DW$266, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$266, DW_AT_name("CH_MAP_57")
	.dwattr $C$DW$266, DW_AT_TI_symbol_name("CH_MAP_57")
	.dwattr $C$DW$266, DW_AT_bit_offset(0x14), DW_AT_bit_size(0x04)
	.dwattr $C$DW$266, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$266, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$266, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$266, DW_AT_decl_line(0x209)
	.dwattr $C$DW$266, DW_AT_decl_column(0x0d)
$C$DW$267	.dwtag  DW_TAG_member
	.dwattr $C$DW$267, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$267, DW_AT_name("rsvd12")
	.dwattr $C$DW$267, DW_AT_TI_symbol_name("rsvd12")
	.dwattr $C$DW$267, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x04)
	.dwattr $C$DW$267, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$267, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$267, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$267, DW_AT_decl_line(0x20a)
	.dwattr $C$DW$267, DW_AT_decl_column(0x0d)
$C$DW$268	.dwtag  DW_TAG_member
	.dwattr $C$DW$268, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$268, DW_AT_name("CH_MAP_58")
	.dwattr $C$DW$268, DW_AT_TI_symbol_name("CH_MAP_58")
	.dwattr $C$DW$268, DW_AT_bit_offset(0x0c), DW_AT_bit_size(0x04)
	.dwattr $C$DW$268, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$268, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$268, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$268, DW_AT_decl_line(0x20b)
	.dwattr $C$DW$268, DW_AT_decl_column(0x0d)
$C$DW$269	.dwtag  DW_TAG_member
	.dwattr $C$DW$269, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$269, DW_AT_name("rsvd20")
	.dwattr $C$DW$269, DW_AT_TI_symbol_name("rsvd20")
	.dwattr $C$DW$269, DW_AT_bit_offset(0x08), DW_AT_bit_size(0x04)
	.dwattr $C$DW$269, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$269, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$269, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$269, DW_AT_decl_line(0x20c)
	.dwattr $C$DW$269, DW_AT_decl_column(0x0d)
$C$DW$270	.dwtag  DW_TAG_member
	.dwattr $C$DW$270, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$270, DW_AT_name("CH_MAP_59")
	.dwattr $C$DW$270, DW_AT_TI_symbol_name("CH_MAP_59")
	.dwattr $C$DW$270, DW_AT_bit_offset(0x04), DW_AT_bit_size(0x04)
	.dwattr $C$DW$270, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$270, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$270, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$270, DW_AT_decl_line(0x20d)
	.dwattr $C$DW$270, DW_AT_decl_column(0x0d)
$C$DW$271	.dwtag  DW_TAG_member
	.dwattr $C$DW$271, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$271, DW_AT_name("rsvd28")
	.dwattr $C$DW$271, DW_AT_TI_symbol_name("rsvd28")
	.dwattr $C$DW$271, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x04)
	.dwattr $C$DW$271, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$271, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$271, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$271, DW_AT_decl_line(0x20e)
	.dwattr $C$DW$271, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$69

	.dwattr $C$DW$T$69, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$69, DW_AT_decl_line(0x206)
	.dwattr $C$DW$T$69, DW_AT_decl_column(0x13)
$C$DW$T$200	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$200, DW_AT_type(*$C$DW$T$69)

$C$DW$T$70	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$70, DW_AT_byte_size(0x04)
$C$DW$272	.dwtag  DW_TAG_member
	.dwattr $C$DW$272, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$272, DW_AT_name("CH_MAP_60")
	.dwattr $C$DW$272, DW_AT_TI_symbol_name("CH_MAP_60")
	.dwattr $C$DW$272, DW_AT_bit_offset(0x1c), DW_AT_bit_size(0x04)
	.dwattr $C$DW$272, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$272, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$272, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$272, DW_AT_decl_line(0x218)
	.dwattr $C$DW$272, DW_AT_decl_column(0x0d)
$C$DW$273	.dwtag  DW_TAG_member
	.dwattr $C$DW$273, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$273, DW_AT_name("rsvd4")
	.dwattr $C$DW$273, DW_AT_TI_symbol_name("rsvd4")
	.dwattr $C$DW$273, DW_AT_bit_offset(0x18), DW_AT_bit_size(0x04)
	.dwattr $C$DW$273, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$273, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$273, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$273, DW_AT_decl_line(0x219)
	.dwattr $C$DW$273, DW_AT_decl_column(0x0d)
$C$DW$274	.dwtag  DW_TAG_member
	.dwattr $C$DW$274, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$274, DW_AT_name("CH_MAP_61")
	.dwattr $C$DW$274, DW_AT_TI_symbol_name("CH_MAP_61")
	.dwattr $C$DW$274, DW_AT_bit_offset(0x14), DW_AT_bit_size(0x04)
	.dwattr $C$DW$274, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$274, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$274, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$274, DW_AT_decl_line(0x21a)
	.dwattr $C$DW$274, DW_AT_decl_column(0x0d)
$C$DW$275	.dwtag  DW_TAG_member
	.dwattr $C$DW$275, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$275, DW_AT_name("rsvd12")
	.dwattr $C$DW$275, DW_AT_TI_symbol_name("rsvd12")
	.dwattr $C$DW$275, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x04)
	.dwattr $C$DW$275, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$275, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$275, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$275, DW_AT_decl_line(0x21b)
	.dwattr $C$DW$275, DW_AT_decl_column(0x0d)
$C$DW$276	.dwtag  DW_TAG_member
	.dwattr $C$DW$276, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$276, DW_AT_name("CH_MAP_62")
	.dwattr $C$DW$276, DW_AT_TI_symbol_name("CH_MAP_62")
	.dwattr $C$DW$276, DW_AT_bit_offset(0x0c), DW_AT_bit_size(0x04)
	.dwattr $C$DW$276, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$276, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$276, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$276, DW_AT_decl_line(0x21c)
	.dwattr $C$DW$276, DW_AT_decl_column(0x0d)
$C$DW$277	.dwtag  DW_TAG_member
	.dwattr $C$DW$277, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$277, DW_AT_name("rsvd20")
	.dwattr $C$DW$277, DW_AT_TI_symbol_name("rsvd20")
	.dwattr $C$DW$277, DW_AT_bit_offset(0x08), DW_AT_bit_size(0x04)
	.dwattr $C$DW$277, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$277, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$277, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$277, DW_AT_decl_line(0x21d)
	.dwattr $C$DW$277, DW_AT_decl_column(0x0d)
$C$DW$278	.dwtag  DW_TAG_member
	.dwattr $C$DW$278, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$278, DW_AT_name("CH_MAP_63")
	.dwattr $C$DW$278, DW_AT_TI_symbol_name("CH_MAP_63")
	.dwattr $C$DW$278, DW_AT_bit_offset(0x04), DW_AT_bit_size(0x04)
	.dwattr $C$DW$278, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$278, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$278, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$278, DW_AT_decl_line(0x21e)
	.dwattr $C$DW$278, DW_AT_decl_column(0x0d)
$C$DW$279	.dwtag  DW_TAG_member
	.dwattr $C$DW$279, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$279, DW_AT_name("rsvd28")
	.dwattr $C$DW$279, DW_AT_TI_symbol_name("rsvd28")
	.dwattr $C$DW$279, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x04)
	.dwattr $C$DW$279, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$279, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$279, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$279, DW_AT_decl_line(0x21f)
	.dwattr $C$DW$279, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$70

	.dwattr $C$DW$T$70, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$70, DW_AT_decl_line(0x217)
	.dwattr $C$DW$T$70, DW_AT_decl_column(0x13)
$C$DW$T$202	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$202, DW_AT_type(*$C$DW$T$70)

$C$DW$T$71	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$71, DW_AT_byte_size(0x04)
$C$DW$280	.dwtag  DW_TAG_member
	.dwattr $C$DW$280, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$280, DW_AT_name("HINT_MAP_0")
	.dwattr $C$DW$280, DW_AT_TI_symbol_name("HINT_MAP_0")
	.dwattr $C$DW$280, DW_AT_bit_offset(0x1c), DW_AT_bit_size(0x04)
	.dwattr $C$DW$280, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$280, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$280, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$280, DW_AT_decl_line(0x22c)
	.dwattr $C$DW$280, DW_AT_decl_column(0x0d)
$C$DW$281	.dwtag  DW_TAG_member
	.dwattr $C$DW$281, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$281, DW_AT_name("rsvd4")
	.dwattr $C$DW$281, DW_AT_TI_symbol_name("rsvd4")
	.dwattr $C$DW$281, DW_AT_bit_offset(0x18), DW_AT_bit_size(0x04)
	.dwattr $C$DW$281, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$281, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$281, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$281, DW_AT_decl_line(0x22d)
	.dwattr $C$DW$281, DW_AT_decl_column(0x0d)
$C$DW$282	.dwtag  DW_TAG_member
	.dwattr $C$DW$282, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$282, DW_AT_name("HINT_MAP_1")
	.dwattr $C$DW$282, DW_AT_TI_symbol_name("HINT_MAP_1")
	.dwattr $C$DW$282, DW_AT_bit_offset(0x14), DW_AT_bit_size(0x04)
	.dwattr $C$DW$282, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$282, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$282, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$282, DW_AT_decl_line(0x22e)
	.dwattr $C$DW$282, DW_AT_decl_column(0x0d)
$C$DW$283	.dwtag  DW_TAG_member
	.dwattr $C$DW$283, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$283, DW_AT_name("rsvd12")
	.dwattr $C$DW$283, DW_AT_TI_symbol_name("rsvd12")
	.dwattr $C$DW$283, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x04)
	.dwattr $C$DW$283, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$283, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$283, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$283, DW_AT_decl_line(0x22f)
	.dwattr $C$DW$283, DW_AT_decl_column(0x0d)
$C$DW$284	.dwtag  DW_TAG_member
	.dwattr $C$DW$284, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$284, DW_AT_name("HINT_MAP_2")
	.dwattr $C$DW$284, DW_AT_TI_symbol_name("HINT_MAP_2")
	.dwattr $C$DW$284, DW_AT_bit_offset(0x0c), DW_AT_bit_size(0x04)
	.dwattr $C$DW$284, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$284, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$284, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$284, DW_AT_decl_line(0x230)
	.dwattr $C$DW$284, DW_AT_decl_column(0x0d)
$C$DW$285	.dwtag  DW_TAG_member
	.dwattr $C$DW$285, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$285, DW_AT_name("rsvd20")
	.dwattr $C$DW$285, DW_AT_TI_symbol_name("rsvd20")
	.dwattr $C$DW$285, DW_AT_bit_offset(0x08), DW_AT_bit_size(0x04)
	.dwattr $C$DW$285, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$285, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$285, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$285, DW_AT_decl_line(0x231)
	.dwattr $C$DW$285, DW_AT_decl_column(0x0d)
$C$DW$286	.dwtag  DW_TAG_member
	.dwattr $C$DW$286, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$286, DW_AT_name("HINT_MAP_3")
	.dwattr $C$DW$286, DW_AT_TI_symbol_name("HINT_MAP_3")
	.dwattr $C$DW$286, DW_AT_bit_offset(0x04), DW_AT_bit_size(0x04)
	.dwattr $C$DW$286, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$286, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$286, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$286, DW_AT_decl_line(0x232)
	.dwattr $C$DW$286, DW_AT_decl_column(0x0d)
$C$DW$287	.dwtag  DW_TAG_member
	.dwattr $C$DW$287, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$287, DW_AT_name("rsvd28")
	.dwattr $C$DW$287, DW_AT_TI_symbol_name("rsvd28")
	.dwattr $C$DW$287, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x04)
	.dwattr $C$DW$287, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$287, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$287, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$287, DW_AT_decl_line(0x233)
	.dwattr $C$DW$287, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$71

	.dwattr $C$DW$T$71, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$71, DW_AT_decl_line(0x22b)
	.dwattr $C$DW$T$71, DW_AT_decl_column(0x13)
$C$DW$T$204	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$204, DW_AT_type(*$C$DW$T$71)

$C$DW$T$72	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$72, DW_AT_byte_size(0x04)
$C$DW$288	.dwtag  DW_TAG_member
	.dwattr $C$DW$288, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$288, DW_AT_name("HINT_MAP_4")
	.dwattr $C$DW$288, DW_AT_TI_symbol_name("HINT_MAP_4")
	.dwattr $C$DW$288, DW_AT_bit_offset(0x1c), DW_AT_bit_size(0x04)
	.dwattr $C$DW$288, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$288, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$288, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$288, DW_AT_decl_line(0x23d)
	.dwattr $C$DW$288, DW_AT_decl_column(0x0d)
$C$DW$289	.dwtag  DW_TAG_member
	.dwattr $C$DW$289, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$289, DW_AT_name("rsvd4")
	.dwattr $C$DW$289, DW_AT_TI_symbol_name("rsvd4")
	.dwattr $C$DW$289, DW_AT_bit_offset(0x18), DW_AT_bit_size(0x04)
	.dwattr $C$DW$289, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$289, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$289, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$289, DW_AT_decl_line(0x23e)
	.dwattr $C$DW$289, DW_AT_decl_column(0x0d)
$C$DW$290	.dwtag  DW_TAG_member
	.dwattr $C$DW$290, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$290, DW_AT_name("HINT_MAP_5")
	.dwattr $C$DW$290, DW_AT_TI_symbol_name("HINT_MAP_5")
	.dwattr $C$DW$290, DW_AT_bit_offset(0x14), DW_AT_bit_size(0x04)
	.dwattr $C$DW$290, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$290, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$290, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$290, DW_AT_decl_line(0x23f)
	.dwattr $C$DW$290, DW_AT_decl_column(0x0d)
$C$DW$291	.dwtag  DW_TAG_member
	.dwattr $C$DW$291, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$291, DW_AT_name("rsvd12")
	.dwattr $C$DW$291, DW_AT_TI_symbol_name("rsvd12")
	.dwattr $C$DW$291, DW_AT_bit_offset(0x10), DW_AT_bit_size(0x04)
	.dwattr $C$DW$291, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$291, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$291, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$291, DW_AT_decl_line(0x240)
	.dwattr $C$DW$291, DW_AT_decl_column(0x0d)
$C$DW$292	.dwtag  DW_TAG_member
	.dwattr $C$DW$292, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$292, DW_AT_name("HINT_MAP_6")
	.dwattr $C$DW$292, DW_AT_TI_symbol_name("HINT_MAP_6")
	.dwattr $C$DW$292, DW_AT_bit_offset(0x0c), DW_AT_bit_size(0x04)
	.dwattr $C$DW$292, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$292, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$292, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$292, DW_AT_decl_line(0x241)
	.dwattr $C$DW$292, DW_AT_decl_column(0x0d)
$C$DW$293	.dwtag  DW_TAG_member
	.dwattr $C$DW$293, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$293, DW_AT_name("rsvd20")
	.dwattr $C$DW$293, DW_AT_TI_symbol_name("rsvd20")
	.dwattr $C$DW$293, DW_AT_bit_offset(0x08), DW_AT_bit_size(0x04)
	.dwattr $C$DW$293, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$293, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$293, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$293, DW_AT_decl_line(0x242)
	.dwattr $C$DW$293, DW_AT_decl_column(0x0d)
$C$DW$294	.dwtag  DW_TAG_member
	.dwattr $C$DW$294, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$294, DW_AT_name("HINT_MAP_7")
	.dwattr $C$DW$294, DW_AT_TI_symbol_name("HINT_MAP_7")
	.dwattr $C$DW$294, DW_AT_bit_offset(0x04), DW_AT_bit_size(0x04)
	.dwattr $C$DW$294, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$294, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$294, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$294, DW_AT_decl_line(0x243)
	.dwattr $C$DW$294, DW_AT_decl_column(0x0d)
$C$DW$295	.dwtag  DW_TAG_member
	.dwattr $C$DW$295, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$295, DW_AT_name("rsvd28")
	.dwattr $C$DW$295, DW_AT_TI_symbol_name("rsvd28")
	.dwattr $C$DW$295, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x04)
	.dwattr $C$DW$295, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$295, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$295, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$295, DW_AT_decl_line(0x244)
	.dwattr $C$DW$295, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$72

	.dwattr $C$DW$T$72, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$72, DW_AT_decl_line(0x23c)
	.dwattr $C$DW$T$72, DW_AT_decl_column(0x13)
$C$DW$T$206	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$206, DW_AT_type(*$C$DW$T$72)

$C$DW$T$73	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$73, DW_AT_byte_size(0x04)
$C$DW$296	.dwtag  DW_TAG_member
	.dwattr $C$DW$296, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$296, DW_AT_name("HINT_MAP_8")
	.dwattr $C$DW$296, DW_AT_TI_symbol_name("HINT_MAP_8")
	.dwattr $C$DW$296, DW_AT_bit_offset(0x1c), DW_AT_bit_size(0x04)
	.dwattr $C$DW$296, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$296, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$296, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$296, DW_AT_decl_line(0x24e)
	.dwattr $C$DW$296, DW_AT_decl_column(0x0d)
$C$DW$297	.dwtag  DW_TAG_member
	.dwattr $C$DW$297, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$297, DW_AT_name("rsvd4")
	.dwattr $C$DW$297, DW_AT_TI_symbol_name("rsvd4")
	.dwattr $C$DW$297, DW_AT_bit_offset(0x18), DW_AT_bit_size(0x04)
	.dwattr $C$DW$297, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$297, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$297, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$297, DW_AT_decl_line(0x24f)
	.dwattr $C$DW$297, DW_AT_decl_column(0x0d)
$C$DW$298	.dwtag  DW_TAG_member
	.dwattr $C$DW$298, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$298, DW_AT_name("HINT_MAP_9")
	.dwattr $C$DW$298, DW_AT_TI_symbol_name("HINT_MAP_9")
	.dwattr $C$DW$298, DW_AT_bit_offset(0x14), DW_AT_bit_size(0x04)
	.dwattr $C$DW$298, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$298, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$298, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$298, DW_AT_decl_line(0x250)
	.dwattr $C$DW$298, DW_AT_decl_column(0x0d)
$C$DW$299	.dwtag  DW_TAG_member
	.dwattr $C$DW$299, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$299, DW_AT_name("rsvd12")
	.dwattr $C$DW$299, DW_AT_TI_symbol_name("rsvd12")
	.dwattr $C$DW$299, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x14)
	.dwattr $C$DW$299, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$299, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$299, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$299, DW_AT_decl_line(0x251)
	.dwattr $C$DW$299, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$73

	.dwattr $C$DW$T$73, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$73, DW_AT_decl_line(0x24d)
	.dwattr $C$DW$T$73, DW_AT_decl_column(0x13)
$C$DW$T$208	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$208, DW_AT_type(*$C$DW$T$73)

$C$DW$T$74	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$74, DW_AT_byte_size(0x04)
$C$DW$300	.dwtag  DW_TAG_member
	.dwattr $C$DW$300, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$300, DW_AT_name("PRI_HINT_0")
	.dwattr $C$DW$300, DW_AT_TI_symbol_name("PRI_HINT_0")
	.dwattr $C$DW$300, DW_AT_bit_offset(0x16), DW_AT_bit_size(0x0a)
	.dwattr $C$DW$300, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$300, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$300, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$300, DW_AT_decl_line(0x25e)
	.dwattr $C$DW$300, DW_AT_decl_column(0x0d)
$C$DW$301	.dwtag  DW_TAG_member
	.dwattr $C$DW$301, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$301, DW_AT_name("rsvd10")
	.dwattr $C$DW$301, DW_AT_TI_symbol_name("rsvd10")
	.dwattr $C$DW$301, DW_AT_bit_offset(0x01), DW_AT_bit_size(0x15)
	.dwattr $C$DW$301, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$301, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$301, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$301, DW_AT_decl_line(0x25f)
	.dwattr $C$DW$301, DW_AT_decl_column(0x0d)
$C$DW$302	.dwtag  DW_TAG_member
	.dwattr $C$DW$302, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$302, DW_AT_name("NONE_HINT_0")
	.dwattr $C$DW$302, DW_AT_TI_symbol_name("NONE_HINT_0")
	.dwattr $C$DW$302, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x01)
	.dwattr $C$DW$302, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$302, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$302, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$302, DW_AT_decl_line(0x260)
	.dwattr $C$DW$302, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$74

	.dwattr $C$DW$T$74, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$74, DW_AT_decl_line(0x25d)
	.dwattr $C$DW$T$74, DW_AT_decl_column(0x13)
$C$DW$T$210	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$210, DW_AT_type(*$C$DW$T$74)

$C$DW$T$75	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$75, DW_AT_byte_size(0x04)
$C$DW$303	.dwtag  DW_TAG_member
	.dwattr $C$DW$303, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$303, DW_AT_name("PRI_HINT_1")
	.dwattr $C$DW$303, DW_AT_TI_symbol_name("PRI_HINT_1")
	.dwattr $C$DW$303, DW_AT_bit_offset(0x16), DW_AT_bit_size(0x0a)
	.dwattr $C$DW$303, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$303, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$303, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$303, DW_AT_decl_line(0x26a)
	.dwattr $C$DW$303, DW_AT_decl_column(0x0d)
$C$DW$304	.dwtag  DW_TAG_member
	.dwattr $C$DW$304, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$304, DW_AT_name("rsvd10")
	.dwattr $C$DW$304, DW_AT_TI_symbol_name("rsvd10")
	.dwattr $C$DW$304, DW_AT_bit_offset(0x01), DW_AT_bit_size(0x15)
	.dwattr $C$DW$304, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$304, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$304, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$304, DW_AT_decl_line(0x26b)
	.dwattr $C$DW$304, DW_AT_decl_column(0x0d)
$C$DW$305	.dwtag  DW_TAG_member
	.dwattr $C$DW$305, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$305, DW_AT_name("NONE_HINT_1")
	.dwattr $C$DW$305, DW_AT_TI_symbol_name("NONE_HINT_1")
	.dwattr $C$DW$305, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x01)
	.dwattr $C$DW$305, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$305, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$305, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$305, DW_AT_decl_line(0x26c)
	.dwattr $C$DW$305, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$75

	.dwattr $C$DW$T$75, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$75, DW_AT_decl_line(0x269)
	.dwattr $C$DW$T$75, DW_AT_decl_column(0x13)
$C$DW$T$212	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$212, DW_AT_type(*$C$DW$T$75)

$C$DW$T$76	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$76, DW_AT_byte_size(0x04)
$C$DW$306	.dwtag  DW_TAG_member
	.dwattr $C$DW$306, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$306, DW_AT_name("PRI_HINT_2")
	.dwattr $C$DW$306, DW_AT_TI_symbol_name("PRI_HINT_2")
	.dwattr $C$DW$306, DW_AT_bit_offset(0x16), DW_AT_bit_size(0x0a)
	.dwattr $C$DW$306, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$306, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$306, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$306, DW_AT_decl_line(0x276)
	.dwattr $C$DW$306, DW_AT_decl_column(0x0d)
$C$DW$307	.dwtag  DW_TAG_member
	.dwattr $C$DW$307, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$307, DW_AT_name("rsvd10")
	.dwattr $C$DW$307, DW_AT_TI_symbol_name("rsvd10")
	.dwattr $C$DW$307, DW_AT_bit_offset(0x01), DW_AT_bit_size(0x15)
	.dwattr $C$DW$307, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$307, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$307, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$307, DW_AT_decl_line(0x277)
	.dwattr $C$DW$307, DW_AT_decl_column(0x0d)
$C$DW$308	.dwtag  DW_TAG_member
	.dwattr $C$DW$308, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$308, DW_AT_name("NONE_HINT_2")
	.dwattr $C$DW$308, DW_AT_TI_symbol_name("NONE_HINT_2")
	.dwattr $C$DW$308, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x01)
	.dwattr $C$DW$308, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$308, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$308, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$308, DW_AT_decl_line(0x278)
	.dwattr $C$DW$308, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$76

	.dwattr $C$DW$T$76, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$76, DW_AT_decl_line(0x275)
	.dwattr $C$DW$T$76, DW_AT_decl_column(0x13)
$C$DW$T$214	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$214, DW_AT_type(*$C$DW$T$76)

$C$DW$T$77	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$77, DW_AT_byte_size(0x04)
$C$DW$309	.dwtag  DW_TAG_member
	.dwattr $C$DW$309, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$309, DW_AT_name("PRI_HINT_3")
	.dwattr $C$DW$309, DW_AT_TI_symbol_name("PRI_HINT_3")
	.dwattr $C$DW$309, DW_AT_bit_offset(0x16), DW_AT_bit_size(0x0a)
	.dwattr $C$DW$309, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$309, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$309, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$309, DW_AT_decl_line(0x282)
	.dwattr $C$DW$309, DW_AT_decl_column(0x0d)
$C$DW$310	.dwtag  DW_TAG_member
	.dwattr $C$DW$310, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$310, DW_AT_name("rsvd10")
	.dwattr $C$DW$310, DW_AT_TI_symbol_name("rsvd10")
	.dwattr $C$DW$310, DW_AT_bit_offset(0x01), DW_AT_bit_size(0x15)
	.dwattr $C$DW$310, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$310, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$310, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$310, DW_AT_decl_line(0x283)
	.dwattr $C$DW$310, DW_AT_decl_column(0x0d)
$C$DW$311	.dwtag  DW_TAG_member
	.dwattr $C$DW$311, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$311, DW_AT_name("NONE_HINT_3")
	.dwattr $C$DW$311, DW_AT_TI_symbol_name("NONE_HINT_3")
	.dwattr $C$DW$311, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x01)
	.dwattr $C$DW$311, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$311, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$311, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$311, DW_AT_decl_line(0x284)
	.dwattr $C$DW$311, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$77

	.dwattr $C$DW$T$77, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$77, DW_AT_decl_line(0x281)
	.dwattr $C$DW$T$77, DW_AT_decl_column(0x13)
$C$DW$T$216	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$216, DW_AT_type(*$C$DW$T$77)

$C$DW$T$78	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$78, DW_AT_byte_size(0x04)
$C$DW$312	.dwtag  DW_TAG_member
	.dwattr $C$DW$312, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$312, DW_AT_name("PRI_HINT_4")
	.dwattr $C$DW$312, DW_AT_TI_symbol_name("PRI_HINT_4")
	.dwattr $C$DW$312, DW_AT_bit_offset(0x16), DW_AT_bit_size(0x0a)
	.dwattr $C$DW$312, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$312, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$312, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$312, DW_AT_decl_line(0x28e)
	.dwattr $C$DW$312, DW_AT_decl_column(0x0d)
$C$DW$313	.dwtag  DW_TAG_member
	.dwattr $C$DW$313, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$313, DW_AT_name("rsvd10")
	.dwattr $C$DW$313, DW_AT_TI_symbol_name("rsvd10")
	.dwattr $C$DW$313, DW_AT_bit_offset(0x01), DW_AT_bit_size(0x15)
	.dwattr $C$DW$313, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$313, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$313, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$313, DW_AT_decl_line(0x28f)
	.dwattr $C$DW$313, DW_AT_decl_column(0x0d)
$C$DW$314	.dwtag  DW_TAG_member
	.dwattr $C$DW$314, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$314, DW_AT_name("NONE_HINT_4")
	.dwattr $C$DW$314, DW_AT_TI_symbol_name("NONE_HINT_4")
	.dwattr $C$DW$314, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x01)
	.dwattr $C$DW$314, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$314, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$314, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$314, DW_AT_decl_line(0x290)
	.dwattr $C$DW$314, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$78

	.dwattr $C$DW$T$78, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$78, DW_AT_decl_line(0x28d)
	.dwattr $C$DW$T$78, DW_AT_decl_column(0x13)
$C$DW$T$218	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$218, DW_AT_type(*$C$DW$T$78)

$C$DW$T$79	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$79, DW_AT_byte_size(0x04)
$C$DW$315	.dwtag  DW_TAG_member
	.dwattr $C$DW$315, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$315, DW_AT_name("PRI_HINT_5")
	.dwattr $C$DW$315, DW_AT_TI_symbol_name("PRI_HINT_5")
	.dwattr $C$DW$315, DW_AT_bit_offset(0x16), DW_AT_bit_size(0x0a)
	.dwattr $C$DW$315, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$315, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$315, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$315, DW_AT_decl_line(0x29a)
	.dwattr $C$DW$315, DW_AT_decl_column(0x0d)
$C$DW$316	.dwtag  DW_TAG_member
	.dwattr $C$DW$316, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$316, DW_AT_name("rsvd10")
	.dwattr $C$DW$316, DW_AT_TI_symbol_name("rsvd10")
	.dwattr $C$DW$316, DW_AT_bit_offset(0x01), DW_AT_bit_size(0x15)
	.dwattr $C$DW$316, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$316, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$316, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$316, DW_AT_decl_line(0x29b)
	.dwattr $C$DW$316, DW_AT_decl_column(0x0d)
$C$DW$317	.dwtag  DW_TAG_member
	.dwattr $C$DW$317, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$317, DW_AT_name("NONE_HINT_5")
	.dwattr $C$DW$317, DW_AT_TI_symbol_name("NONE_HINT_5")
	.dwattr $C$DW$317, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x01)
	.dwattr $C$DW$317, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$317, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$317, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$317, DW_AT_decl_line(0x29c)
	.dwattr $C$DW$317, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$79

	.dwattr $C$DW$T$79, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$79, DW_AT_decl_line(0x299)
	.dwattr $C$DW$T$79, DW_AT_decl_column(0x13)
$C$DW$T$220	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$220, DW_AT_type(*$C$DW$T$79)

$C$DW$T$80	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$80, DW_AT_byte_size(0x04)
$C$DW$318	.dwtag  DW_TAG_member
	.dwattr $C$DW$318, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$318, DW_AT_name("PRI_HINT_6")
	.dwattr $C$DW$318, DW_AT_TI_symbol_name("PRI_HINT_6")
	.dwattr $C$DW$318, DW_AT_bit_offset(0x16), DW_AT_bit_size(0x0a)
	.dwattr $C$DW$318, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$318, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$318, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$318, DW_AT_decl_line(0x2a6)
	.dwattr $C$DW$318, DW_AT_decl_column(0x0d)
$C$DW$319	.dwtag  DW_TAG_member
	.dwattr $C$DW$319, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$319, DW_AT_name("rsvd10")
	.dwattr $C$DW$319, DW_AT_TI_symbol_name("rsvd10")
	.dwattr $C$DW$319, DW_AT_bit_offset(0x01), DW_AT_bit_size(0x15)
	.dwattr $C$DW$319, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$319, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$319, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$319, DW_AT_decl_line(0x2a7)
	.dwattr $C$DW$319, DW_AT_decl_column(0x0d)
$C$DW$320	.dwtag  DW_TAG_member
	.dwattr $C$DW$320, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$320, DW_AT_name("NONE_HINT_6")
	.dwattr $C$DW$320, DW_AT_TI_symbol_name("NONE_HINT_6")
	.dwattr $C$DW$320, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x01)
	.dwattr $C$DW$320, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$320, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$320, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$320, DW_AT_decl_line(0x2a8)
	.dwattr $C$DW$320, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$80

	.dwattr $C$DW$T$80, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$80, DW_AT_decl_line(0x2a5)
	.dwattr $C$DW$T$80, DW_AT_decl_column(0x13)
$C$DW$T$222	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$222, DW_AT_type(*$C$DW$T$80)

$C$DW$T$81	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$81, DW_AT_byte_size(0x04)
$C$DW$321	.dwtag  DW_TAG_member
	.dwattr $C$DW$321, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$321, DW_AT_name("PRI_HINT_7")
	.dwattr $C$DW$321, DW_AT_TI_symbol_name("PRI_HINT_7")
	.dwattr $C$DW$321, DW_AT_bit_offset(0x16), DW_AT_bit_size(0x0a)
	.dwattr $C$DW$321, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$321, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$321, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$321, DW_AT_decl_line(0x2b2)
	.dwattr $C$DW$321, DW_AT_decl_column(0x0d)
$C$DW$322	.dwtag  DW_TAG_member
	.dwattr $C$DW$322, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$322, DW_AT_name("rsvd10")
	.dwattr $C$DW$322, DW_AT_TI_symbol_name("rsvd10")
	.dwattr $C$DW$322, DW_AT_bit_offset(0x01), DW_AT_bit_size(0x15)
	.dwattr $C$DW$322, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$322, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$322, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$322, DW_AT_decl_line(0x2b3)
	.dwattr $C$DW$322, DW_AT_decl_column(0x0d)
$C$DW$323	.dwtag  DW_TAG_member
	.dwattr $C$DW$323, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$323, DW_AT_name("NONE_HINT_7")
	.dwattr $C$DW$323, DW_AT_TI_symbol_name("NONE_HINT_7")
	.dwattr $C$DW$323, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x01)
	.dwattr $C$DW$323, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$323, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$323, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$323, DW_AT_decl_line(0x2b4)
	.dwattr $C$DW$323, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$81

	.dwattr $C$DW$T$81, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$81, DW_AT_decl_line(0x2b1)
	.dwattr $C$DW$T$81, DW_AT_decl_column(0x13)
$C$DW$T$224	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$224, DW_AT_type(*$C$DW$T$81)

$C$DW$T$82	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$82, DW_AT_byte_size(0x04)
$C$DW$324	.dwtag  DW_TAG_member
	.dwattr $C$DW$324, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$324, DW_AT_name("PRI_HINT_8")
	.dwattr $C$DW$324, DW_AT_TI_symbol_name("PRI_HINT_8")
	.dwattr $C$DW$324, DW_AT_bit_offset(0x16), DW_AT_bit_size(0x0a)
	.dwattr $C$DW$324, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$324, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$324, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$324, DW_AT_decl_line(0x2be)
	.dwattr $C$DW$324, DW_AT_decl_column(0x0d)
$C$DW$325	.dwtag  DW_TAG_member
	.dwattr $C$DW$325, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$325, DW_AT_name("rsvd10")
	.dwattr $C$DW$325, DW_AT_TI_symbol_name("rsvd10")
	.dwattr $C$DW$325, DW_AT_bit_offset(0x01), DW_AT_bit_size(0x15)
	.dwattr $C$DW$325, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$325, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$325, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$325, DW_AT_decl_line(0x2bf)
	.dwattr $C$DW$325, DW_AT_decl_column(0x0d)
$C$DW$326	.dwtag  DW_TAG_member
	.dwattr $C$DW$326, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$326, DW_AT_name("NONE_HINT_8")
	.dwattr $C$DW$326, DW_AT_TI_symbol_name("NONE_HINT_8")
	.dwattr $C$DW$326, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x01)
	.dwattr $C$DW$326, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$326, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$326, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$326, DW_AT_decl_line(0x2c0)
	.dwattr $C$DW$326, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$82

	.dwattr $C$DW$T$82, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$82, DW_AT_decl_line(0x2bd)
	.dwattr $C$DW$T$82, DW_AT_decl_column(0x13)
$C$DW$T$226	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$226, DW_AT_type(*$C$DW$T$82)

$C$DW$T$83	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$83, DW_AT_byte_size(0x04)
$C$DW$327	.dwtag  DW_TAG_member
	.dwattr $C$DW$327, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$327, DW_AT_name("PRI_HINT_9")
	.dwattr $C$DW$327, DW_AT_TI_symbol_name("PRI_HINT_9")
	.dwattr $C$DW$327, DW_AT_bit_offset(0x16), DW_AT_bit_size(0x0a)
	.dwattr $C$DW$327, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$327, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$327, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$327, DW_AT_decl_line(0x2ca)
	.dwattr $C$DW$327, DW_AT_decl_column(0x0d)
$C$DW$328	.dwtag  DW_TAG_member
	.dwattr $C$DW$328, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$328, DW_AT_name("rsvd10")
	.dwattr $C$DW$328, DW_AT_TI_symbol_name("rsvd10")
	.dwattr $C$DW$328, DW_AT_bit_offset(0x01), DW_AT_bit_size(0x15)
	.dwattr $C$DW$328, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$328, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$328, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$328, DW_AT_decl_line(0x2cb)
	.dwattr $C$DW$328, DW_AT_decl_column(0x0d)
$C$DW$329	.dwtag  DW_TAG_member
	.dwattr $C$DW$329, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$329, DW_AT_name("NONE_HINT_9")
	.dwattr $C$DW$329, DW_AT_TI_symbol_name("NONE_HINT_9")
	.dwattr $C$DW$329, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x01)
	.dwattr $C$DW$329, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$329, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$329, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$329, DW_AT_decl_line(0x2cc)
	.dwattr $C$DW$329, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$83

	.dwattr $C$DW$T$83, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$83, DW_AT_decl_line(0x2c9)
	.dwattr $C$DW$T$83, DW_AT_decl_column(0x13)
$C$DW$T$228	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$228, DW_AT_type(*$C$DW$T$83)

$C$DW$T$84	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$84, DW_AT_byte_size(0x04)
$C$DW$330	.dwtag  DW_TAG_member
	.dwattr $C$DW$330, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$330, DW_AT_name("POLARITY_31_0")
	.dwattr $C$DW$330, DW_AT_TI_symbol_name("POLARITY_31_0")
	.dwattr $C$DW$330, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x20)
	.dwattr $C$DW$330, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$330, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$330, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$330, DW_AT_decl_line(0x2d9)
	.dwattr $C$DW$330, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$84

	.dwattr $C$DW$T$84, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$84, DW_AT_decl_line(0x2d8)
	.dwattr $C$DW$T$84, DW_AT_decl_column(0x13)
$C$DW$T$230	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$230, DW_AT_type(*$C$DW$T$84)

$C$DW$T$85	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$85, DW_AT_byte_size(0x04)
$C$DW$331	.dwtag  DW_TAG_member
	.dwattr $C$DW$331, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$331, DW_AT_name("POLARITY_63_32")
	.dwattr $C$DW$331, DW_AT_TI_symbol_name("POLARITY_63_32")
	.dwattr $C$DW$331, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x20)
	.dwattr $C$DW$331, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$331, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$331, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$331, DW_AT_decl_line(0x2e3)
	.dwattr $C$DW$331, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$85

	.dwattr $C$DW$T$85, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$85, DW_AT_decl_line(0x2e2)
	.dwattr $C$DW$T$85, DW_AT_decl_column(0x13)
$C$DW$T$232	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$232, DW_AT_type(*$C$DW$T$85)

$C$DW$T$86	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$86, DW_AT_byte_size(0x04)
$C$DW$332	.dwtag  DW_TAG_member
	.dwattr $C$DW$332, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$332, DW_AT_name("TYPE_31_0")
	.dwattr $C$DW$332, DW_AT_TI_symbol_name("TYPE_31_0")
	.dwattr $C$DW$332, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x20)
	.dwattr $C$DW$332, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$332, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$332, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$332, DW_AT_decl_line(0x2f0)
	.dwattr $C$DW$332, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$86

	.dwattr $C$DW$T$86, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$86, DW_AT_decl_line(0x2ef)
	.dwattr $C$DW$T$86, DW_AT_decl_column(0x13)
$C$DW$T$234	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$234, DW_AT_type(*$C$DW$T$86)

$C$DW$T$87	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$87, DW_AT_byte_size(0x04)
$C$DW$333	.dwtag  DW_TAG_member
	.dwattr $C$DW$333, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$333, DW_AT_name("TYPE_63_32")
	.dwattr $C$DW$333, DW_AT_TI_symbol_name("TYPE_63_32")
	.dwattr $C$DW$333, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x20)
	.dwattr $C$DW$333, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$333, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$333, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$333, DW_AT_decl_line(0x2fa)
	.dwattr $C$DW$333, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$87

	.dwattr $C$DW$T$87, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$87, DW_AT_decl_line(0x2f9)
	.dwattr $C$DW$T$87, DW_AT_decl_column(0x13)
$C$DW$T$236	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$236, DW_AT_type(*$C$DW$T$87)

$C$DW$T$88	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$88, DW_AT_byte_size(0x04)
$C$DW$334	.dwtag  DW_TAG_member
	.dwattr $C$DW$334, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$334, DW_AT_name("NEST_HINT_0")
	.dwattr $C$DW$334, DW_AT_TI_symbol_name("NEST_HINT_0")
	.dwattr $C$DW$334, DW_AT_bit_offset(0x17), DW_AT_bit_size(0x09)
	.dwattr $C$DW$334, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$334, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$334, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$334, DW_AT_decl_line(0x307)
	.dwattr $C$DW$334, DW_AT_decl_column(0x0d)
$C$DW$335	.dwtag  DW_TAG_member
	.dwattr $C$DW$335, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$335, DW_AT_name("rsvd9")
	.dwattr $C$DW$335, DW_AT_TI_symbol_name("rsvd9")
	.dwattr $C$DW$335, DW_AT_bit_offset(0x01), DW_AT_bit_size(0x16)
	.dwattr $C$DW$335, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$335, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$335, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$335, DW_AT_decl_line(0x308)
	.dwattr $C$DW$335, DW_AT_decl_column(0x0d)
$C$DW$336	.dwtag  DW_TAG_member
	.dwattr $C$DW$336, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$336, DW_AT_name("AUTO_OVERRIDE")
	.dwattr $C$DW$336, DW_AT_TI_symbol_name("AUTO_OVERRIDE")
	.dwattr $C$DW$336, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x01)
	.dwattr $C$DW$336, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$336, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$336, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$336, DW_AT_decl_line(0x309)
	.dwattr $C$DW$336, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$88

	.dwattr $C$DW$T$88, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$88, DW_AT_decl_line(0x306)
	.dwattr $C$DW$T$88, DW_AT_decl_column(0x13)
$C$DW$T$238	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$238, DW_AT_type(*$C$DW$T$88)

$C$DW$T$89	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$89, DW_AT_byte_size(0x04)
$C$DW$337	.dwtag  DW_TAG_member
	.dwattr $C$DW$337, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$337, DW_AT_name("NEST_HINT_1")
	.dwattr $C$DW$337, DW_AT_TI_symbol_name("NEST_HINT_1")
	.dwattr $C$DW$337, DW_AT_bit_offset(0x17), DW_AT_bit_size(0x09)
	.dwattr $C$DW$337, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$337, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$337, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$337, DW_AT_decl_line(0x313)
	.dwattr $C$DW$337, DW_AT_decl_column(0x0d)
$C$DW$338	.dwtag  DW_TAG_member
	.dwattr $C$DW$338, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$338, DW_AT_name("rsvd9")
	.dwattr $C$DW$338, DW_AT_TI_symbol_name("rsvd9")
	.dwattr $C$DW$338, DW_AT_bit_offset(0x01), DW_AT_bit_size(0x16)
	.dwattr $C$DW$338, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$338, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$338, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$338, DW_AT_decl_line(0x314)
	.dwattr $C$DW$338, DW_AT_decl_column(0x0d)
$C$DW$339	.dwtag  DW_TAG_member
	.dwattr $C$DW$339, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$339, DW_AT_name("AUTO_OVERRIDE")
	.dwattr $C$DW$339, DW_AT_TI_symbol_name("AUTO_OVERRIDE")
	.dwattr $C$DW$339, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x01)
	.dwattr $C$DW$339, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$339, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$339, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$339, DW_AT_decl_line(0x315)
	.dwattr $C$DW$339, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$89

	.dwattr $C$DW$T$89, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$89, DW_AT_decl_line(0x312)
	.dwattr $C$DW$T$89, DW_AT_decl_column(0x13)
$C$DW$T$240	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$240, DW_AT_type(*$C$DW$T$89)

$C$DW$T$90	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$90, DW_AT_byte_size(0x04)
$C$DW$340	.dwtag  DW_TAG_member
	.dwattr $C$DW$340, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$340, DW_AT_name("NEST_HINT_2")
	.dwattr $C$DW$340, DW_AT_TI_symbol_name("NEST_HINT_2")
	.dwattr $C$DW$340, DW_AT_bit_offset(0x17), DW_AT_bit_size(0x09)
	.dwattr $C$DW$340, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$340, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$340, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$340, DW_AT_decl_line(0x31f)
	.dwattr $C$DW$340, DW_AT_decl_column(0x0d)
$C$DW$341	.dwtag  DW_TAG_member
	.dwattr $C$DW$341, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$341, DW_AT_name("rsvd9")
	.dwattr $C$DW$341, DW_AT_TI_symbol_name("rsvd9")
	.dwattr $C$DW$341, DW_AT_bit_offset(0x01), DW_AT_bit_size(0x16)
	.dwattr $C$DW$341, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$341, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$341, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$341, DW_AT_decl_line(0x320)
	.dwattr $C$DW$341, DW_AT_decl_column(0x0d)
$C$DW$342	.dwtag  DW_TAG_member
	.dwattr $C$DW$342, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$342, DW_AT_name("AUTO_OVERRIDE")
	.dwattr $C$DW$342, DW_AT_TI_symbol_name("AUTO_OVERRIDE")
	.dwattr $C$DW$342, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x01)
	.dwattr $C$DW$342, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$342, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$342, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$342, DW_AT_decl_line(0x321)
	.dwattr $C$DW$342, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$90

	.dwattr $C$DW$T$90, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$90, DW_AT_decl_line(0x31e)
	.dwattr $C$DW$T$90, DW_AT_decl_column(0x13)
$C$DW$T$242	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$242, DW_AT_type(*$C$DW$T$90)

$C$DW$T$91	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$91, DW_AT_byte_size(0x04)
$C$DW$343	.dwtag  DW_TAG_member
	.dwattr $C$DW$343, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$343, DW_AT_name("NEST_HINT_3")
	.dwattr $C$DW$343, DW_AT_TI_symbol_name("NEST_HINT_3")
	.dwattr $C$DW$343, DW_AT_bit_offset(0x17), DW_AT_bit_size(0x09)
	.dwattr $C$DW$343, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$343, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$343, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$343, DW_AT_decl_line(0x32b)
	.dwattr $C$DW$343, DW_AT_decl_column(0x0d)
$C$DW$344	.dwtag  DW_TAG_member
	.dwattr $C$DW$344, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$344, DW_AT_name("rsvd9")
	.dwattr $C$DW$344, DW_AT_TI_symbol_name("rsvd9")
	.dwattr $C$DW$344, DW_AT_bit_offset(0x01), DW_AT_bit_size(0x16)
	.dwattr $C$DW$344, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$344, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$344, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$344, DW_AT_decl_line(0x32c)
	.dwattr $C$DW$344, DW_AT_decl_column(0x0d)
$C$DW$345	.dwtag  DW_TAG_member
	.dwattr $C$DW$345, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$345, DW_AT_name("AUTO_OVERRIDE")
	.dwattr $C$DW$345, DW_AT_TI_symbol_name("AUTO_OVERRIDE")
	.dwattr $C$DW$345, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x01)
	.dwattr $C$DW$345, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$345, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$345, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$345, DW_AT_decl_line(0x32d)
	.dwattr $C$DW$345, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$91

	.dwattr $C$DW$T$91, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$91, DW_AT_decl_line(0x32a)
	.dwattr $C$DW$T$91, DW_AT_decl_column(0x13)
$C$DW$T$244	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$244, DW_AT_type(*$C$DW$T$91)

$C$DW$T$92	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$92, DW_AT_byte_size(0x04)
$C$DW$346	.dwtag  DW_TAG_member
	.dwattr $C$DW$346, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$346, DW_AT_name("NEST_HINT_4")
	.dwattr $C$DW$346, DW_AT_TI_symbol_name("NEST_HINT_4")
	.dwattr $C$DW$346, DW_AT_bit_offset(0x17), DW_AT_bit_size(0x09)
	.dwattr $C$DW$346, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$346, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$346, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$346, DW_AT_decl_line(0x337)
	.dwattr $C$DW$346, DW_AT_decl_column(0x0d)
$C$DW$347	.dwtag  DW_TAG_member
	.dwattr $C$DW$347, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$347, DW_AT_name("rsvd9")
	.dwattr $C$DW$347, DW_AT_TI_symbol_name("rsvd9")
	.dwattr $C$DW$347, DW_AT_bit_offset(0x01), DW_AT_bit_size(0x16)
	.dwattr $C$DW$347, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$347, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$347, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$347, DW_AT_decl_line(0x338)
	.dwattr $C$DW$347, DW_AT_decl_column(0x0d)
$C$DW$348	.dwtag  DW_TAG_member
	.dwattr $C$DW$348, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$348, DW_AT_name("AUTO_OVERRIDE")
	.dwattr $C$DW$348, DW_AT_TI_symbol_name("AUTO_OVERRIDE")
	.dwattr $C$DW$348, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x01)
	.dwattr $C$DW$348, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$348, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$348, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$348, DW_AT_decl_line(0x339)
	.dwattr $C$DW$348, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$92

	.dwattr $C$DW$T$92, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$92, DW_AT_decl_line(0x336)
	.dwattr $C$DW$T$92, DW_AT_decl_column(0x13)
$C$DW$T$246	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$246, DW_AT_type(*$C$DW$T$92)

$C$DW$T$93	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$93, DW_AT_byte_size(0x04)
$C$DW$349	.dwtag  DW_TAG_member
	.dwattr $C$DW$349, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$349, DW_AT_name("NEST_HINT_5")
	.dwattr $C$DW$349, DW_AT_TI_symbol_name("NEST_HINT_5")
	.dwattr $C$DW$349, DW_AT_bit_offset(0x17), DW_AT_bit_size(0x09)
	.dwattr $C$DW$349, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$349, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$349, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$349, DW_AT_decl_line(0x343)
	.dwattr $C$DW$349, DW_AT_decl_column(0x0d)
$C$DW$350	.dwtag  DW_TAG_member
	.dwattr $C$DW$350, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$350, DW_AT_name("rsvd9")
	.dwattr $C$DW$350, DW_AT_TI_symbol_name("rsvd9")
	.dwattr $C$DW$350, DW_AT_bit_offset(0x01), DW_AT_bit_size(0x16)
	.dwattr $C$DW$350, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$350, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$350, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$350, DW_AT_decl_line(0x344)
	.dwattr $C$DW$350, DW_AT_decl_column(0x0d)
$C$DW$351	.dwtag  DW_TAG_member
	.dwattr $C$DW$351, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$351, DW_AT_name("AUTO_OVERRIDE")
	.dwattr $C$DW$351, DW_AT_TI_symbol_name("AUTO_OVERRIDE")
	.dwattr $C$DW$351, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x01)
	.dwattr $C$DW$351, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$351, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$351, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$351, DW_AT_decl_line(0x345)
	.dwattr $C$DW$351, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$93

	.dwattr $C$DW$T$93, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$93, DW_AT_decl_line(0x342)
	.dwattr $C$DW$T$93, DW_AT_decl_column(0x13)
$C$DW$T$248	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$248, DW_AT_type(*$C$DW$T$93)

$C$DW$T$94	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$94, DW_AT_byte_size(0x04)
$C$DW$352	.dwtag  DW_TAG_member
	.dwattr $C$DW$352, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$352, DW_AT_name("NEST_HINT_6")
	.dwattr $C$DW$352, DW_AT_TI_symbol_name("NEST_HINT_6")
	.dwattr $C$DW$352, DW_AT_bit_offset(0x17), DW_AT_bit_size(0x09)
	.dwattr $C$DW$352, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$352, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$352, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$352, DW_AT_decl_line(0x34f)
	.dwattr $C$DW$352, DW_AT_decl_column(0x0d)
$C$DW$353	.dwtag  DW_TAG_member
	.dwattr $C$DW$353, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$353, DW_AT_name("rsvd9")
	.dwattr $C$DW$353, DW_AT_TI_symbol_name("rsvd9")
	.dwattr $C$DW$353, DW_AT_bit_offset(0x01), DW_AT_bit_size(0x16)
	.dwattr $C$DW$353, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$353, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$353, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$353, DW_AT_decl_line(0x350)
	.dwattr $C$DW$353, DW_AT_decl_column(0x0d)
$C$DW$354	.dwtag  DW_TAG_member
	.dwattr $C$DW$354, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$354, DW_AT_name("AUTO_OVERRIDE")
	.dwattr $C$DW$354, DW_AT_TI_symbol_name("AUTO_OVERRIDE")
	.dwattr $C$DW$354, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x01)
	.dwattr $C$DW$354, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$354, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$354, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$354, DW_AT_decl_line(0x351)
	.dwattr $C$DW$354, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$94

	.dwattr $C$DW$T$94, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$94, DW_AT_decl_line(0x34e)
	.dwattr $C$DW$T$94, DW_AT_decl_column(0x13)
$C$DW$T$250	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$250, DW_AT_type(*$C$DW$T$94)

$C$DW$T$95	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$95, DW_AT_byte_size(0x04)
$C$DW$355	.dwtag  DW_TAG_member
	.dwattr $C$DW$355, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$355, DW_AT_name("NEST_HINT_7")
	.dwattr $C$DW$355, DW_AT_TI_symbol_name("NEST_HINT_7")
	.dwattr $C$DW$355, DW_AT_bit_offset(0x17), DW_AT_bit_size(0x09)
	.dwattr $C$DW$355, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$355, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$355, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$355, DW_AT_decl_line(0x35b)
	.dwattr $C$DW$355, DW_AT_decl_column(0x0d)
$C$DW$356	.dwtag  DW_TAG_member
	.dwattr $C$DW$356, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$356, DW_AT_name("rsvd9")
	.dwattr $C$DW$356, DW_AT_TI_symbol_name("rsvd9")
	.dwattr $C$DW$356, DW_AT_bit_offset(0x01), DW_AT_bit_size(0x16)
	.dwattr $C$DW$356, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$356, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$356, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$356, DW_AT_decl_line(0x35c)
	.dwattr $C$DW$356, DW_AT_decl_column(0x0d)
$C$DW$357	.dwtag  DW_TAG_member
	.dwattr $C$DW$357, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$357, DW_AT_name("AUTO_OVERRIDE")
	.dwattr $C$DW$357, DW_AT_TI_symbol_name("AUTO_OVERRIDE")
	.dwattr $C$DW$357, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x01)
	.dwattr $C$DW$357, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$357, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$357, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$357, DW_AT_decl_line(0x35d)
	.dwattr $C$DW$357, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$95

	.dwattr $C$DW$T$95, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$95, DW_AT_decl_line(0x35a)
	.dwattr $C$DW$T$95, DW_AT_decl_column(0x13)
$C$DW$T$252	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$252, DW_AT_type(*$C$DW$T$95)

$C$DW$T$96	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$96, DW_AT_byte_size(0x04)
$C$DW$358	.dwtag  DW_TAG_member
	.dwattr $C$DW$358, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$358, DW_AT_name("NEST_HINT_8")
	.dwattr $C$DW$358, DW_AT_TI_symbol_name("NEST_HINT_8")
	.dwattr $C$DW$358, DW_AT_bit_offset(0x17), DW_AT_bit_size(0x09)
	.dwattr $C$DW$358, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$358, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$358, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$358, DW_AT_decl_line(0x367)
	.dwattr $C$DW$358, DW_AT_decl_column(0x0d)
$C$DW$359	.dwtag  DW_TAG_member
	.dwattr $C$DW$359, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$359, DW_AT_name("rsvd9")
	.dwattr $C$DW$359, DW_AT_TI_symbol_name("rsvd9")
	.dwattr $C$DW$359, DW_AT_bit_offset(0x01), DW_AT_bit_size(0x16)
	.dwattr $C$DW$359, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$359, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$359, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$359, DW_AT_decl_line(0x368)
	.dwattr $C$DW$359, DW_AT_decl_column(0x0d)
$C$DW$360	.dwtag  DW_TAG_member
	.dwattr $C$DW$360, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$360, DW_AT_name("AUTO_OVERRIDE")
	.dwattr $C$DW$360, DW_AT_TI_symbol_name("AUTO_OVERRIDE")
	.dwattr $C$DW$360, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x01)
	.dwattr $C$DW$360, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$360, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$360, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$360, DW_AT_decl_line(0x369)
	.dwattr $C$DW$360, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$96

	.dwattr $C$DW$T$96, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$96, DW_AT_decl_line(0x366)
	.dwattr $C$DW$T$96, DW_AT_decl_column(0x13)
$C$DW$T$254	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$254, DW_AT_type(*$C$DW$T$96)

$C$DW$T$97	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$97, DW_AT_byte_size(0x04)
$C$DW$361	.dwtag  DW_TAG_member
	.dwattr $C$DW$361, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$361, DW_AT_name("NEST_HINT_9")
	.dwattr $C$DW$361, DW_AT_TI_symbol_name("NEST_HINT_9")
	.dwattr $C$DW$361, DW_AT_bit_offset(0x17), DW_AT_bit_size(0x09)
	.dwattr $C$DW$361, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$361, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$361, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$361, DW_AT_decl_line(0x373)
	.dwattr $C$DW$361, DW_AT_decl_column(0x0d)
$C$DW$362	.dwtag  DW_TAG_member
	.dwattr $C$DW$362, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$362, DW_AT_name("rsvd9")
	.dwattr $C$DW$362, DW_AT_TI_symbol_name("rsvd9")
	.dwattr $C$DW$362, DW_AT_bit_offset(0x01), DW_AT_bit_size(0x16)
	.dwattr $C$DW$362, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$362, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$362, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$362, DW_AT_decl_line(0x374)
	.dwattr $C$DW$362, DW_AT_decl_column(0x0d)
$C$DW$363	.dwtag  DW_TAG_member
	.dwattr $C$DW$363, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$363, DW_AT_name("AUTO_OVERRIDE")
	.dwattr $C$DW$363, DW_AT_TI_symbol_name("AUTO_OVERRIDE")
	.dwattr $C$DW$363, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x01)
	.dwattr $C$DW$363, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$363, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$363, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$363, DW_AT_decl_line(0x375)
	.dwattr $C$DW$363, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$97

	.dwattr $C$DW$T$97, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$97, DW_AT_decl_line(0x372)
	.dwattr $C$DW$T$97, DW_AT_decl_column(0x13)
$C$DW$T$256	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$256, DW_AT_type(*$C$DW$T$97)

$C$DW$T$98	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$98, DW_AT_byte_size(0x04)
$C$DW$364	.dwtag  DW_TAG_member
	.dwattr $C$DW$364, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$364, DW_AT_name("EN_HINT")
	.dwattr $C$DW$364, DW_AT_TI_symbol_name("EN_HINT")
	.dwattr $C$DW$364, DW_AT_bit_offset(0x16), DW_AT_bit_size(0x0a)
	.dwattr $C$DW$364, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$364, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$364, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$364, DW_AT_decl_line(0x382)
	.dwattr $C$DW$364, DW_AT_decl_column(0x0d)
$C$DW$365	.dwtag  DW_TAG_member
	.dwattr $C$DW$365, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$365, DW_AT_name("rsvd9")
	.dwattr $C$DW$365, DW_AT_TI_symbol_name("rsvd9")
	.dwattr $C$DW$365, DW_AT_bit_offset(0x00), DW_AT_bit_size(0x16)
	.dwattr $C$DW$365, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$365, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$365, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$365, DW_AT_decl_line(0x383)
	.dwattr $C$DW$365, DW_AT_decl_column(0x0d)
	.dwendtag $C$DW$T$98

	.dwattr $C$DW$T$98, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$98, DW_AT_decl_line(0x381)
	.dwattr $C$DW$T$98, DW_AT_decl_column(0x13)
$C$DW$T$258	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$258, DW_AT_type(*$C$DW$T$98)

$C$DW$T$106	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$106, DW_AT_byte_size(0x1504)
$C$DW$366	.dwtag  DW_TAG_member
	.dwattr $C$DW$366, DW_AT_type(*$C$DW$T$135)
	.dwattr $C$DW$366, DW_AT_name("$P$T13")
	.dwattr $C$DW$366, DW_AT_TI_symbol_name("$P$T13")
	.dwattr $C$DW$366, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$366, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$366, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$366, DW_AT_decl_line(0x29)
	.dwattr $C$DW$366, DW_AT_decl_column(0x02)
$C$DW$367	.dwtag  DW_TAG_member
	.dwattr $C$DW$367, DW_AT_type(*$C$DW$T$137)
	.dwattr $C$DW$367, DW_AT_name("$P$T14")
	.dwattr $C$DW$367, DW_AT_TI_symbol_name("$P$T14")
	.dwattr $C$DW$367, DW_AT_data_member_location[DW_OP_plus_uconst 0x4]
	.dwattr $C$DW$367, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$367, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$367, DW_AT_decl_line(0x39)
	.dwattr $C$DW$367, DW_AT_decl_column(0x02)
$C$DW$368	.dwtag  DW_TAG_member
	.dwattr $C$DW$368, DW_AT_type(*$C$DW$T$34)
	.dwattr $C$DW$368, DW_AT_name("rsvd8")
	.dwattr $C$DW$368, DW_AT_TI_symbol_name("rsvd8")
	.dwattr $C$DW$368, DW_AT_data_member_location[DW_OP_plus_uconst 0x8]
	.dwattr $C$DW$368, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$368, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$368, DW_AT_decl_line(0x44)
	.dwattr $C$DW$368, DW_AT_decl_column(0x0b)
$C$DW$369	.dwtag  DW_TAG_member
	.dwattr $C$DW$369, DW_AT_type(*$C$DW$T$139)
	.dwattr $C$DW$369, DW_AT_name("$P$T15")
	.dwattr $C$DW$369, DW_AT_TI_symbol_name("$P$T15")
	.dwattr $C$DW$369, DW_AT_data_member_location[DW_OP_plus_uconst 0x10]
	.dwattr $C$DW$369, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$369, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$369, DW_AT_decl_line(0x48)
	.dwattr $C$DW$369, DW_AT_decl_column(0x02)
$C$DW$370	.dwtag  DW_TAG_member
	.dwattr $C$DW$370, DW_AT_type(*$C$DW$T$34)
	.dwattr $C$DW$370, DW_AT_name("rsvd14")
	.dwattr $C$DW$370, DW_AT_TI_symbol_name("rsvd14")
	.dwattr $C$DW$370, DW_AT_data_member_location[DW_OP_plus_uconst 0x14]
	.dwattr $C$DW$370, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$370, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$370, DW_AT_decl_line(0x52)
	.dwattr $C$DW$370, DW_AT_decl_column(0x0b)
$C$DW$371	.dwtag  DW_TAG_member
	.dwattr $C$DW$371, DW_AT_type(*$C$DW$T$141)
	.dwattr $C$DW$371, DW_AT_name("$P$T16")
	.dwattr $C$DW$371, DW_AT_TI_symbol_name("$P$T16")
	.dwattr $C$DW$371, DW_AT_data_member_location[DW_OP_plus_uconst 0x1c]
	.dwattr $C$DW$371, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$371, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$371, DW_AT_decl_line(0x56)
	.dwattr $C$DW$371, DW_AT_decl_column(0x02)
$C$DW$372	.dwtag  DW_TAG_member
	.dwattr $C$DW$372, DW_AT_type(*$C$DW$T$143)
	.dwattr $C$DW$372, DW_AT_name("$P$T17")
	.dwattr $C$DW$372, DW_AT_TI_symbol_name("$P$T17")
	.dwattr $C$DW$372, DW_AT_data_member_location[DW_OP_plus_uconst 0x20]
	.dwattr $C$DW$372, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$372, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$372, DW_AT_decl_line(0x62)
	.dwattr $C$DW$372, DW_AT_decl_column(0x02)
$C$DW$373	.dwtag  DW_TAG_member
	.dwattr $C$DW$373, DW_AT_type(*$C$DW$T$145)
	.dwattr $C$DW$373, DW_AT_name("$P$T18")
	.dwattr $C$DW$373, DW_AT_TI_symbol_name("$P$T18")
	.dwattr $C$DW$373, DW_AT_data_member_location[DW_OP_plus_uconst 0x24]
	.dwattr $C$DW$373, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$373, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$373, DW_AT_decl_line(0x6d)
	.dwattr $C$DW$373, DW_AT_decl_column(0x02)
$C$DW$374	.dwtag  DW_TAG_member
	.dwattr $C$DW$374, DW_AT_type(*$C$DW$T$147)
	.dwattr $C$DW$374, DW_AT_name("$P$T19")
	.dwattr $C$DW$374, DW_AT_TI_symbol_name("$P$T19")
	.dwattr $C$DW$374, DW_AT_data_member_location[DW_OP_plus_uconst 0x28]
	.dwattr $C$DW$374, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$374, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$374, DW_AT_decl_line(0x78)
	.dwattr $C$DW$374, DW_AT_decl_column(0x02)
$C$DW$375	.dwtag  DW_TAG_member
	.dwattr $C$DW$375, DW_AT_type(*$C$DW$T$149)
	.dwattr $C$DW$375, DW_AT_name("$P$T20")
	.dwattr $C$DW$375, DW_AT_TI_symbol_name("$P$T20")
	.dwattr $C$DW$375, DW_AT_data_member_location[DW_OP_plus_uconst 0x2c]
	.dwattr $C$DW$375, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$375, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$375, DW_AT_decl_line(0x83)
	.dwattr $C$DW$375, DW_AT_decl_column(0x02)
$C$DW$376	.dwtag  DW_TAG_member
	.dwattr $C$DW$376, DW_AT_type(*$C$DW$T$32)
	.dwattr $C$DW$376, DW_AT_name("rsvd30")
	.dwattr $C$DW$376, DW_AT_TI_symbol_name("rsvd30")
	.dwattr $C$DW$376, DW_AT_data_member_location[DW_OP_plus_uconst 0x30]
	.dwattr $C$DW$376, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$376, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$376, DW_AT_decl_line(0x8d)
	.dwattr $C$DW$376, DW_AT_decl_column(0x0b)
$C$DW$377	.dwtag  DW_TAG_member
	.dwattr $C$DW$377, DW_AT_type(*$C$DW$T$151)
	.dwattr $C$DW$377, DW_AT_name("$P$T21")
	.dwattr $C$DW$377, DW_AT_TI_symbol_name("$P$T21")
	.dwattr $C$DW$377, DW_AT_data_member_location[DW_OP_plus_uconst 0x34]
	.dwattr $C$DW$377, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$377, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$377, DW_AT_decl_line(0x91)
	.dwattr $C$DW$377, DW_AT_decl_column(0x02)
$C$DW$378	.dwtag  DW_TAG_member
	.dwattr $C$DW$378, DW_AT_type(*$C$DW$T$153)
	.dwattr $C$DW$378, DW_AT_name("$P$T22")
	.dwattr $C$DW$378, DW_AT_TI_symbol_name("$P$T22")
	.dwattr $C$DW$378, DW_AT_data_member_location[DW_OP_plus_uconst 0x38]
	.dwattr $C$DW$378, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$378, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$378, DW_AT_decl_line(0x9c)
	.dwattr $C$DW$378, DW_AT_decl_column(0x02)
$C$DW$379	.dwtag  DW_TAG_member
	.dwattr $C$DW$379, DW_AT_type(*$C$DW$T$99)
	.dwattr $C$DW$379, DW_AT_name("rsvd3C")
	.dwattr $C$DW$379, DW_AT_TI_symbol_name("rsvd3C")
	.dwattr $C$DW$379, DW_AT_data_member_location[DW_OP_plus_uconst 0x3c]
	.dwattr $C$DW$379, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$379, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$379, DW_AT_decl_line(0xa6)
	.dwattr $C$DW$379, DW_AT_decl_column(0x0b)
$C$DW$380	.dwtag  DW_TAG_member
	.dwattr $C$DW$380, DW_AT_type(*$C$DW$T$155)
	.dwattr $C$DW$380, DW_AT_name("$P$T23")
	.dwattr $C$DW$380, DW_AT_TI_symbol_name("$P$T23")
	.dwattr $C$DW$380, DW_AT_data_member_location[DW_OP_plus_uconst 0x80]
	.dwattr $C$DW$380, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$380, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$380, DW_AT_decl_line(0xaa)
	.dwattr $C$DW$380, DW_AT_decl_column(0x02)
$C$DW$381	.dwtag  DW_TAG_member
	.dwattr $C$DW$381, DW_AT_type(*$C$DW$T$100)
	.dwattr $C$DW$381, DW_AT_name("rsvd84")
	.dwattr $C$DW$381, DW_AT_TI_symbol_name("rsvd84")
	.dwattr $C$DW$381, DW_AT_data_member_location[DW_OP_plus_uconst 0x84]
	.dwattr $C$DW$381, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$381, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$381, DW_AT_decl_line(0xb5)
	.dwattr $C$DW$381, DW_AT_decl_column(0x0b)
$C$DW$382	.dwtag  DW_TAG_member
	.dwattr $C$DW$382, DW_AT_type(*$C$DW$T$157)
	.dwattr $C$DW$382, DW_AT_name("$P$T24")
	.dwattr $C$DW$382, DW_AT_TI_symbol_name("$P$T24")
	.dwattr $C$DW$382, DW_AT_data_member_location[DW_OP_plus_uconst 0x200]
	.dwattr $C$DW$382, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$382, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$382, DW_AT_decl_line(0xb9)
	.dwattr $C$DW$382, DW_AT_decl_column(0x02)
$C$DW$383	.dwtag  DW_TAG_member
	.dwattr $C$DW$383, DW_AT_type(*$C$DW$T$159)
	.dwattr $C$DW$383, DW_AT_name("$P$T25")
	.dwattr $C$DW$383, DW_AT_TI_symbol_name("$P$T25")
	.dwattr $C$DW$383, DW_AT_data_member_location[DW_OP_plus_uconst 0x204]
	.dwattr $C$DW$383, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$383, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$383, DW_AT_decl_line(0xc3)
	.dwattr $C$DW$383, DW_AT_decl_column(0x02)
$C$DW$384	.dwtag  DW_TAG_member
	.dwattr $C$DW$384, DW_AT_type(*$C$DW$T$101)
	.dwattr $C$DW$384, DW_AT_name("rsvd208")
	.dwattr $C$DW$384, DW_AT_TI_symbol_name("rsvd208")
	.dwattr $C$DW$384, DW_AT_data_member_location[DW_OP_plus_uconst 0x208]
	.dwattr $C$DW$384, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$384, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$384, DW_AT_decl_line(0xcc)
	.dwattr $C$DW$384, DW_AT_decl_column(0x0b)
$C$DW$385	.dwtag  DW_TAG_member
	.dwattr $C$DW$385, DW_AT_type(*$C$DW$T$161)
	.dwattr $C$DW$385, DW_AT_name("$P$T26")
	.dwattr $C$DW$385, DW_AT_TI_symbol_name("$P$T26")
	.dwattr $C$DW$385, DW_AT_data_member_location[DW_OP_plus_uconst 0x280]
	.dwattr $C$DW$385, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$385, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$385, DW_AT_decl_line(0xd0)
	.dwattr $C$DW$385, DW_AT_decl_column(0x02)
$C$DW$386	.dwtag  DW_TAG_member
	.dwattr $C$DW$386, DW_AT_type(*$C$DW$T$163)
	.dwattr $C$DW$386, DW_AT_name("$P$T27")
	.dwattr $C$DW$386, DW_AT_TI_symbol_name("$P$T27")
	.dwattr $C$DW$386, DW_AT_data_member_location[DW_OP_plus_uconst 0x284]
	.dwattr $C$DW$386, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$386, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$386, DW_AT_decl_line(0xda)
	.dwattr $C$DW$386, DW_AT_decl_column(0x02)
$C$DW$387	.dwtag  DW_TAG_member
	.dwattr $C$DW$387, DW_AT_type(*$C$DW$T$101)
	.dwattr $C$DW$387, DW_AT_name("rsvd288")
	.dwattr $C$DW$387, DW_AT_TI_symbol_name("rsvd288")
	.dwattr $C$DW$387, DW_AT_data_member_location[DW_OP_plus_uconst 0x288]
	.dwattr $C$DW$387, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$387, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$387, DW_AT_decl_line(0xe3)
	.dwattr $C$DW$387, DW_AT_decl_column(0x0b)
$C$DW$388	.dwtag  DW_TAG_member
	.dwattr $C$DW$388, DW_AT_type(*$C$DW$T$165)
	.dwattr $C$DW$388, DW_AT_name("$P$T28")
	.dwattr $C$DW$388, DW_AT_TI_symbol_name("$P$T28")
	.dwattr $C$DW$388, DW_AT_data_member_location[DW_OP_plus_uconst 0x300]
	.dwattr $C$DW$388, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$388, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$388, DW_AT_decl_line(0xe7)
	.dwattr $C$DW$388, DW_AT_decl_column(0x02)
$C$DW$389	.dwtag  DW_TAG_member
	.dwattr $C$DW$389, DW_AT_type(*$C$DW$T$167)
	.dwattr $C$DW$389, DW_AT_name("$P$T29")
	.dwattr $C$DW$389, DW_AT_TI_symbol_name("$P$T29")
	.dwattr $C$DW$389, DW_AT_data_member_location[DW_OP_plus_uconst 0x304]
	.dwattr $C$DW$389, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$389, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$389, DW_AT_decl_line(0xf1)
	.dwattr $C$DW$389, DW_AT_decl_column(0x02)
$C$DW$390	.dwtag  DW_TAG_member
	.dwattr $C$DW$390, DW_AT_type(*$C$DW$T$101)
	.dwattr $C$DW$390, DW_AT_name("rsvd308")
	.dwattr $C$DW$390, DW_AT_TI_symbol_name("rsvd308")
	.dwattr $C$DW$390, DW_AT_data_member_location[DW_OP_plus_uconst 0x308]
	.dwattr $C$DW$390, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$390, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$390, DW_AT_decl_line(0xfa)
	.dwattr $C$DW$390, DW_AT_decl_column(0x0b)
$C$DW$391	.dwtag  DW_TAG_member
	.dwattr $C$DW$391, DW_AT_type(*$C$DW$T$169)
	.dwattr $C$DW$391, DW_AT_name("$P$T30")
	.dwattr $C$DW$391, DW_AT_TI_symbol_name("$P$T30")
	.dwattr $C$DW$391, DW_AT_data_member_location[DW_OP_plus_uconst 0x380]
	.dwattr $C$DW$391, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$391, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$391, DW_AT_decl_line(0xfe)
	.dwattr $C$DW$391, DW_AT_decl_column(0x02)
$C$DW$392	.dwtag  DW_TAG_member
	.dwattr $C$DW$392, DW_AT_type(*$C$DW$T$171)
	.dwattr $C$DW$392, DW_AT_name("$P$T31")
	.dwattr $C$DW$392, DW_AT_TI_symbol_name("$P$T31")
	.dwattr $C$DW$392, DW_AT_data_member_location[DW_OP_plus_uconst 0x384]
	.dwattr $C$DW$392, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$392, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$392, DW_AT_decl_line(0x108)
	.dwattr $C$DW$392, DW_AT_decl_column(0x02)
$C$DW$393	.dwtag  DW_TAG_member
	.dwattr $C$DW$393, DW_AT_type(*$C$DW$T$101)
	.dwattr $C$DW$393, DW_AT_name("rsvd388")
	.dwattr $C$DW$393, DW_AT_TI_symbol_name("rsvd388")
	.dwattr $C$DW$393, DW_AT_data_member_location[DW_OP_plus_uconst 0x388]
	.dwattr $C$DW$393, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$393, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$393, DW_AT_decl_line(0x111)
	.dwattr $C$DW$393, DW_AT_decl_column(0x0b)
$C$DW$394	.dwtag  DW_TAG_member
	.dwattr $C$DW$394, DW_AT_type(*$C$DW$T$173)
	.dwattr $C$DW$394, DW_AT_name("$P$T32")
	.dwattr $C$DW$394, DW_AT_TI_symbol_name("$P$T32")
	.dwattr $C$DW$394, DW_AT_data_member_location[DW_OP_plus_uconst 0x400]
	.dwattr $C$DW$394, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$394, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$394, DW_AT_decl_line(0x115)
	.dwattr $C$DW$394, DW_AT_decl_column(0x02)
$C$DW$395	.dwtag  DW_TAG_member
	.dwattr $C$DW$395, DW_AT_type(*$C$DW$T$175)
	.dwattr $C$DW$395, DW_AT_name("$P$T33")
	.dwattr $C$DW$395, DW_AT_TI_symbol_name("$P$T33")
	.dwattr $C$DW$395, DW_AT_data_member_location[DW_OP_plus_uconst 0x404]
	.dwattr $C$DW$395, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$395, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$395, DW_AT_decl_line(0x126)
	.dwattr $C$DW$395, DW_AT_decl_column(0x02)
$C$DW$396	.dwtag  DW_TAG_member
	.dwattr $C$DW$396, DW_AT_type(*$C$DW$T$177)
	.dwattr $C$DW$396, DW_AT_name("$P$T34")
	.dwattr $C$DW$396, DW_AT_TI_symbol_name("$P$T34")
	.dwattr $C$DW$396, DW_AT_data_member_location[DW_OP_plus_uconst 0x408]
	.dwattr $C$DW$396, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$396, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$396, DW_AT_decl_line(0x137)
	.dwattr $C$DW$396, DW_AT_decl_column(0x02)
$C$DW$397	.dwtag  DW_TAG_member
	.dwattr $C$DW$397, DW_AT_type(*$C$DW$T$179)
	.dwattr $C$DW$397, DW_AT_name("$P$T35")
	.dwattr $C$DW$397, DW_AT_TI_symbol_name("$P$T35")
	.dwattr $C$DW$397, DW_AT_data_member_location[DW_OP_plus_uconst 0x40c]
	.dwattr $C$DW$397, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$397, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$397, DW_AT_decl_line(0x148)
	.dwattr $C$DW$397, DW_AT_decl_column(0x02)
$C$DW$398	.dwtag  DW_TAG_member
	.dwattr $C$DW$398, DW_AT_type(*$C$DW$T$181)
	.dwattr $C$DW$398, DW_AT_name("$P$T36")
	.dwattr $C$DW$398, DW_AT_TI_symbol_name("$P$T36")
	.dwattr $C$DW$398, DW_AT_data_member_location[DW_OP_plus_uconst 0x410]
	.dwattr $C$DW$398, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$398, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$398, DW_AT_decl_line(0x159)
	.dwattr $C$DW$398, DW_AT_decl_column(0x02)
$C$DW$399	.dwtag  DW_TAG_member
	.dwattr $C$DW$399, DW_AT_type(*$C$DW$T$183)
	.dwattr $C$DW$399, DW_AT_name("$P$T37")
	.dwattr $C$DW$399, DW_AT_TI_symbol_name("$P$T37")
	.dwattr $C$DW$399, DW_AT_data_member_location[DW_OP_plus_uconst 0x414]
	.dwattr $C$DW$399, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$399, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$399, DW_AT_decl_line(0x16a)
	.dwattr $C$DW$399, DW_AT_decl_column(0x02)
$C$DW$400	.dwtag  DW_TAG_member
	.dwattr $C$DW$400, DW_AT_type(*$C$DW$T$185)
	.dwattr $C$DW$400, DW_AT_name("$P$T38")
	.dwattr $C$DW$400, DW_AT_TI_symbol_name("$P$T38")
	.dwattr $C$DW$400, DW_AT_data_member_location[DW_OP_plus_uconst 0x418]
	.dwattr $C$DW$400, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$400, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$400, DW_AT_decl_line(0x17b)
	.dwattr $C$DW$400, DW_AT_decl_column(0x02)
$C$DW$401	.dwtag  DW_TAG_member
	.dwattr $C$DW$401, DW_AT_type(*$C$DW$T$187)
	.dwattr $C$DW$401, DW_AT_name("$P$T39")
	.dwattr $C$DW$401, DW_AT_TI_symbol_name("$P$T39")
	.dwattr $C$DW$401, DW_AT_data_member_location[DW_OP_plus_uconst 0x41c]
	.dwattr $C$DW$401, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$401, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$401, DW_AT_decl_line(0x18c)
	.dwattr $C$DW$401, DW_AT_decl_column(0x02)
$C$DW$402	.dwtag  DW_TAG_member
	.dwattr $C$DW$402, DW_AT_type(*$C$DW$T$189)
	.dwattr $C$DW$402, DW_AT_name("$P$T40")
	.dwattr $C$DW$402, DW_AT_TI_symbol_name("$P$T40")
	.dwattr $C$DW$402, DW_AT_data_member_location[DW_OP_plus_uconst 0x420]
	.dwattr $C$DW$402, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$402, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$402, DW_AT_decl_line(0x19d)
	.dwattr $C$DW$402, DW_AT_decl_column(0x02)
$C$DW$403	.dwtag  DW_TAG_member
	.dwattr $C$DW$403, DW_AT_type(*$C$DW$T$191)
	.dwattr $C$DW$403, DW_AT_name("$P$T41")
	.dwattr $C$DW$403, DW_AT_TI_symbol_name("$P$T41")
	.dwattr $C$DW$403, DW_AT_data_member_location[DW_OP_plus_uconst 0x424]
	.dwattr $C$DW$403, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$403, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$403, DW_AT_decl_line(0x1ae)
	.dwattr $C$DW$403, DW_AT_decl_column(0x02)
$C$DW$404	.dwtag  DW_TAG_member
	.dwattr $C$DW$404, DW_AT_type(*$C$DW$T$193)
	.dwattr $C$DW$404, DW_AT_name("$P$T42")
	.dwattr $C$DW$404, DW_AT_TI_symbol_name("$P$T42")
	.dwattr $C$DW$404, DW_AT_data_member_location[DW_OP_plus_uconst 0x428]
	.dwattr $C$DW$404, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$404, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$404, DW_AT_decl_line(0x1bf)
	.dwattr $C$DW$404, DW_AT_decl_column(0x02)
$C$DW$405	.dwtag  DW_TAG_member
	.dwattr $C$DW$405, DW_AT_type(*$C$DW$T$195)
	.dwattr $C$DW$405, DW_AT_name("$P$T43")
	.dwattr $C$DW$405, DW_AT_TI_symbol_name("$P$T43")
	.dwattr $C$DW$405, DW_AT_data_member_location[DW_OP_plus_uconst 0x42c]
	.dwattr $C$DW$405, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$405, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$405, DW_AT_decl_line(0x1d0)
	.dwattr $C$DW$405, DW_AT_decl_column(0x02)
$C$DW$406	.dwtag  DW_TAG_member
	.dwattr $C$DW$406, DW_AT_type(*$C$DW$T$197)
	.dwattr $C$DW$406, DW_AT_name("$P$T44")
	.dwattr $C$DW$406, DW_AT_TI_symbol_name("$P$T44")
	.dwattr $C$DW$406, DW_AT_data_member_location[DW_OP_plus_uconst 0x430]
	.dwattr $C$DW$406, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$406, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$406, DW_AT_decl_line(0x1e1)
	.dwattr $C$DW$406, DW_AT_decl_column(0x02)
$C$DW$407	.dwtag  DW_TAG_member
	.dwattr $C$DW$407, DW_AT_type(*$C$DW$T$199)
	.dwattr $C$DW$407, DW_AT_name("$P$T45")
	.dwattr $C$DW$407, DW_AT_TI_symbol_name("$P$T45")
	.dwattr $C$DW$407, DW_AT_data_member_location[DW_OP_plus_uconst 0x434]
	.dwattr $C$DW$407, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$407, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$407, DW_AT_decl_line(0x1f2)
	.dwattr $C$DW$407, DW_AT_decl_column(0x02)
$C$DW$408	.dwtag  DW_TAG_member
	.dwattr $C$DW$408, DW_AT_type(*$C$DW$T$201)
	.dwattr $C$DW$408, DW_AT_name("$P$T46")
	.dwattr $C$DW$408, DW_AT_TI_symbol_name("$P$T46")
	.dwattr $C$DW$408, DW_AT_data_member_location[DW_OP_plus_uconst 0x438]
	.dwattr $C$DW$408, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$408, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$408, DW_AT_decl_line(0x203)
	.dwattr $C$DW$408, DW_AT_decl_column(0x02)
$C$DW$409	.dwtag  DW_TAG_member
	.dwattr $C$DW$409, DW_AT_type(*$C$DW$T$203)
	.dwattr $C$DW$409, DW_AT_name("$P$T47")
	.dwattr $C$DW$409, DW_AT_TI_symbol_name("$P$T47")
	.dwattr $C$DW$409, DW_AT_data_member_location[DW_OP_plus_uconst 0x43c]
	.dwattr $C$DW$409, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$409, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$409, DW_AT_decl_line(0x214)
	.dwattr $C$DW$409, DW_AT_decl_column(0x02)
$C$DW$410	.dwtag  DW_TAG_member
	.dwattr $C$DW$410, DW_AT_type(*$C$DW$T$102)
	.dwattr $C$DW$410, DW_AT_name("rsvd440")
	.dwattr $C$DW$410, DW_AT_TI_symbol_name("rsvd440")
	.dwattr $C$DW$410, DW_AT_data_member_location[DW_OP_plus_uconst 0x440]
	.dwattr $C$DW$410, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$410, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$410, DW_AT_decl_line(0x224)
	.dwattr $C$DW$410, DW_AT_decl_column(0x0b)
$C$DW$411	.dwtag  DW_TAG_member
	.dwattr $C$DW$411, DW_AT_type(*$C$DW$T$205)
	.dwattr $C$DW$411, DW_AT_name("$P$T48")
	.dwattr $C$DW$411, DW_AT_TI_symbol_name("$P$T48")
	.dwattr $C$DW$411, DW_AT_data_member_location[DW_OP_plus_uconst 0x800]
	.dwattr $C$DW$411, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$411, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$411, DW_AT_decl_line(0x228)
	.dwattr $C$DW$411, DW_AT_decl_column(0x02)
$C$DW$412	.dwtag  DW_TAG_member
	.dwattr $C$DW$412, DW_AT_type(*$C$DW$T$207)
	.dwattr $C$DW$412, DW_AT_name("$P$T49")
	.dwattr $C$DW$412, DW_AT_TI_symbol_name("$P$T49")
	.dwattr $C$DW$412, DW_AT_data_member_location[DW_OP_plus_uconst 0x804]
	.dwattr $C$DW$412, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$412, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$412, DW_AT_decl_line(0x239)
	.dwattr $C$DW$412, DW_AT_decl_column(0x02)
$C$DW$413	.dwtag  DW_TAG_member
	.dwattr $C$DW$413, DW_AT_type(*$C$DW$T$209)
	.dwattr $C$DW$413, DW_AT_name("$P$T50")
	.dwattr $C$DW$413, DW_AT_TI_symbol_name("$P$T50")
	.dwattr $C$DW$413, DW_AT_data_member_location[DW_OP_plus_uconst 0x808]
	.dwattr $C$DW$413, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$413, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$413, DW_AT_decl_line(0x24a)
	.dwattr $C$DW$413, DW_AT_decl_column(0x02)
$C$DW$414	.dwtag  DW_TAG_member
	.dwattr $C$DW$414, DW_AT_type(*$C$DW$T$103)
	.dwattr $C$DW$414, DW_AT_name("rsvd80C")
	.dwattr $C$DW$414, DW_AT_TI_symbol_name("rsvd80C")
	.dwattr $C$DW$414, DW_AT_data_member_location[DW_OP_plus_uconst 0x80c]
	.dwattr $C$DW$414, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$414, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$414, DW_AT_decl_line(0x256)
	.dwattr $C$DW$414, DW_AT_decl_column(0x0b)
$C$DW$415	.dwtag  DW_TAG_member
	.dwattr $C$DW$415, DW_AT_type(*$C$DW$T$211)
	.dwattr $C$DW$415, DW_AT_name("$P$T51")
	.dwattr $C$DW$415, DW_AT_TI_symbol_name("$P$T51")
	.dwattr $C$DW$415, DW_AT_data_member_location[DW_OP_plus_uconst 0x900]
	.dwattr $C$DW$415, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$415, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$415, DW_AT_decl_line(0x25a)
	.dwattr $C$DW$415, DW_AT_decl_column(0x02)
$C$DW$416	.dwtag  DW_TAG_member
	.dwattr $C$DW$416, DW_AT_type(*$C$DW$T$213)
	.dwattr $C$DW$416, DW_AT_name("$P$T52")
	.dwattr $C$DW$416, DW_AT_TI_symbol_name("$P$T52")
	.dwattr $C$DW$416, DW_AT_data_member_location[DW_OP_plus_uconst 0x904]
	.dwattr $C$DW$416, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$416, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$416, DW_AT_decl_line(0x266)
	.dwattr $C$DW$416, DW_AT_decl_column(0x02)
$C$DW$417	.dwtag  DW_TAG_member
	.dwattr $C$DW$417, DW_AT_type(*$C$DW$T$215)
	.dwattr $C$DW$417, DW_AT_name("$P$T53")
	.dwattr $C$DW$417, DW_AT_TI_symbol_name("$P$T53")
	.dwattr $C$DW$417, DW_AT_data_member_location[DW_OP_plus_uconst 0x908]
	.dwattr $C$DW$417, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$417, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$417, DW_AT_decl_line(0x272)
	.dwattr $C$DW$417, DW_AT_decl_column(0x02)
$C$DW$418	.dwtag  DW_TAG_member
	.dwattr $C$DW$418, DW_AT_type(*$C$DW$T$217)
	.dwattr $C$DW$418, DW_AT_name("$P$T54")
	.dwattr $C$DW$418, DW_AT_TI_symbol_name("$P$T54")
	.dwattr $C$DW$418, DW_AT_data_member_location[DW_OP_plus_uconst 0x90c]
	.dwattr $C$DW$418, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$418, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$418, DW_AT_decl_line(0x27e)
	.dwattr $C$DW$418, DW_AT_decl_column(0x02)
$C$DW$419	.dwtag  DW_TAG_member
	.dwattr $C$DW$419, DW_AT_type(*$C$DW$T$219)
	.dwattr $C$DW$419, DW_AT_name("$P$T55")
	.dwattr $C$DW$419, DW_AT_TI_symbol_name("$P$T55")
	.dwattr $C$DW$419, DW_AT_data_member_location[DW_OP_plus_uconst 0x910]
	.dwattr $C$DW$419, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$419, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$419, DW_AT_decl_line(0x28a)
	.dwattr $C$DW$419, DW_AT_decl_column(0x02)
$C$DW$420	.dwtag  DW_TAG_member
	.dwattr $C$DW$420, DW_AT_type(*$C$DW$T$221)
	.dwattr $C$DW$420, DW_AT_name("$P$T56")
	.dwattr $C$DW$420, DW_AT_TI_symbol_name("$P$T56")
	.dwattr $C$DW$420, DW_AT_data_member_location[DW_OP_plus_uconst 0x914]
	.dwattr $C$DW$420, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$420, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$420, DW_AT_decl_line(0x296)
	.dwattr $C$DW$420, DW_AT_decl_column(0x02)
$C$DW$421	.dwtag  DW_TAG_member
	.dwattr $C$DW$421, DW_AT_type(*$C$DW$T$223)
	.dwattr $C$DW$421, DW_AT_name("$P$T57")
	.dwattr $C$DW$421, DW_AT_TI_symbol_name("$P$T57")
	.dwattr $C$DW$421, DW_AT_data_member_location[DW_OP_plus_uconst 0x918]
	.dwattr $C$DW$421, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$421, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$421, DW_AT_decl_line(0x2a2)
	.dwattr $C$DW$421, DW_AT_decl_column(0x02)
$C$DW$422	.dwtag  DW_TAG_member
	.dwattr $C$DW$422, DW_AT_type(*$C$DW$T$225)
	.dwattr $C$DW$422, DW_AT_name("$P$T58")
	.dwattr $C$DW$422, DW_AT_TI_symbol_name("$P$T58")
	.dwattr $C$DW$422, DW_AT_data_member_location[DW_OP_plus_uconst 0x91c]
	.dwattr $C$DW$422, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$422, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$422, DW_AT_decl_line(0x2ae)
	.dwattr $C$DW$422, DW_AT_decl_column(0x02)
$C$DW$423	.dwtag  DW_TAG_member
	.dwattr $C$DW$423, DW_AT_type(*$C$DW$T$227)
	.dwattr $C$DW$423, DW_AT_name("$P$T59")
	.dwattr $C$DW$423, DW_AT_TI_symbol_name("$P$T59")
	.dwattr $C$DW$423, DW_AT_data_member_location[DW_OP_plus_uconst 0x920]
	.dwattr $C$DW$423, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$423, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$423, DW_AT_decl_line(0x2ba)
	.dwattr $C$DW$423, DW_AT_decl_column(0x02)
$C$DW$424	.dwtag  DW_TAG_member
	.dwattr $C$DW$424, DW_AT_type(*$C$DW$T$229)
	.dwattr $C$DW$424, DW_AT_name("$P$T60")
	.dwattr $C$DW$424, DW_AT_TI_symbol_name("$P$T60")
	.dwattr $C$DW$424, DW_AT_data_member_location[DW_OP_plus_uconst 0x924]
	.dwattr $C$DW$424, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$424, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$424, DW_AT_decl_line(0x2c6)
	.dwattr $C$DW$424, DW_AT_decl_column(0x02)
$C$DW$425	.dwtag  DW_TAG_member
	.dwattr $C$DW$425, DW_AT_type(*$C$DW$T$104)
	.dwattr $C$DW$425, DW_AT_name("rsvd928")
	.dwattr $C$DW$425, DW_AT_TI_symbol_name("rsvd928")
	.dwattr $C$DW$425, DW_AT_data_member_location[DW_OP_plus_uconst 0x928]
	.dwattr $C$DW$425, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$425, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$425, DW_AT_decl_line(0x2d1)
	.dwattr $C$DW$425, DW_AT_decl_column(0x0b)
$C$DW$426	.dwtag  DW_TAG_member
	.dwattr $C$DW$426, DW_AT_type(*$C$DW$T$231)
	.dwattr $C$DW$426, DW_AT_name("$P$T61")
	.dwattr $C$DW$426, DW_AT_TI_symbol_name("$P$T61")
	.dwattr $C$DW$426, DW_AT_data_member_location[DW_OP_plus_uconst 0xd00]
	.dwattr $C$DW$426, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$426, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$426, DW_AT_decl_line(0x2d5)
	.dwattr $C$DW$426, DW_AT_decl_column(0x02)
$C$DW$427	.dwtag  DW_TAG_member
	.dwattr $C$DW$427, DW_AT_type(*$C$DW$T$233)
	.dwattr $C$DW$427, DW_AT_name("$P$T62")
	.dwattr $C$DW$427, DW_AT_TI_symbol_name("$P$T62")
	.dwattr $C$DW$427, DW_AT_data_member_location[DW_OP_plus_uconst 0xd04]
	.dwattr $C$DW$427, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$427, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$427, DW_AT_decl_line(0x2df)
	.dwattr $C$DW$427, DW_AT_decl_column(0x02)
$C$DW$428	.dwtag  DW_TAG_member
	.dwattr $C$DW$428, DW_AT_type(*$C$DW$T$101)
	.dwattr $C$DW$428, DW_AT_name("rsvdD08")
	.dwattr $C$DW$428, DW_AT_TI_symbol_name("rsvdD08")
	.dwattr $C$DW$428, DW_AT_data_member_location[DW_OP_plus_uconst 0xd08]
	.dwattr $C$DW$428, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$428, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$428, DW_AT_decl_line(0x2e8)
	.dwattr $C$DW$428, DW_AT_decl_column(0x0b)
$C$DW$429	.dwtag  DW_TAG_member
	.dwattr $C$DW$429, DW_AT_type(*$C$DW$T$235)
	.dwattr $C$DW$429, DW_AT_name("$P$T63")
	.dwattr $C$DW$429, DW_AT_TI_symbol_name("$P$T63")
	.dwattr $C$DW$429, DW_AT_data_member_location[DW_OP_plus_uconst 0xd80]
	.dwattr $C$DW$429, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$429, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$429, DW_AT_decl_line(0x2ec)
	.dwattr $C$DW$429, DW_AT_decl_column(0x02)
$C$DW$430	.dwtag  DW_TAG_member
	.dwattr $C$DW$430, DW_AT_type(*$C$DW$T$237)
	.dwattr $C$DW$430, DW_AT_name("$P$T64")
	.dwattr $C$DW$430, DW_AT_TI_symbol_name("$P$T64")
	.dwattr $C$DW$430, DW_AT_data_member_location[DW_OP_plus_uconst 0xd84]
	.dwattr $C$DW$430, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$430, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$430, DW_AT_decl_line(0x2f6)
	.dwattr $C$DW$430, DW_AT_decl_column(0x02)
$C$DW$431	.dwtag  DW_TAG_member
	.dwattr $C$DW$431, DW_AT_type(*$C$DW$T$105)
	.dwattr $C$DW$431, DW_AT_name("rsvdD84")
	.dwattr $C$DW$431, DW_AT_TI_symbol_name("rsvdD84")
	.dwattr $C$DW$431, DW_AT_data_member_location[DW_OP_plus_uconst 0xd88]
	.dwattr $C$DW$431, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$431, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$431, DW_AT_decl_line(0x2ff)
	.dwattr $C$DW$431, DW_AT_decl_column(0x0b)
$C$DW$432	.dwtag  DW_TAG_member
	.dwattr $C$DW$432, DW_AT_type(*$C$DW$T$239)
	.dwattr $C$DW$432, DW_AT_name("$P$T65")
	.dwattr $C$DW$432, DW_AT_TI_symbol_name("$P$T65")
	.dwattr $C$DW$432, DW_AT_data_member_location[DW_OP_plus_uconst 0x1100]
	.dwattr $C$DW$432, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$432, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$432, DW_AT_decl_line(0x303)
	.dwattr $C$DW$432, DW_AT_decl_column(0x02)
$C$DW$433	.dwtag  DW_TAG_member
	.dwattr $C$DW$433, DW_AT_type(*$C$DW$T$241)
	.dwattr $C$DW$433, DW_AT_name("$P$T66")
	.dwattr $C$DW$433, DW_AT_TI_symbol_name("$P$T66")
	.dwattr $C$DW$433, DW_AT_data_member_location[DW_OP_plus_uconst 0x1104]
	.dwattr $C$DW$433, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$433, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$433, DW_AT_decl_line(0x30f)
	.dwattr $C$DW$433, DW_AT_decl_column(0x02)
$C$DW$434	.dwtag  DW_TAG_member
	.dwattr $C$DW$434, DW_AT_type(*$C$DW$T$243)
	.dwattr $C$DW$434, DW_AT_name("$P$T67")
	.dwattr $C$DW$434, DW_AT_TI_symbol_name("$P$T67")
	.dwattr $C$DW$434, DW_AT_data_member_location[DW_OP_plus_uconst 0x1108]
	.dwattr $C$DW$434, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$434, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$434, DW_AT_decl_line(0x31b)
	.dwattr $C$DW$434, DW_AT_decl_column(0x02)
$C$DW$435	.dwtag  DW_TAG_member
	.dwattr $C$DW$435, DW_AT_type(*$C$DW$T$245)
	.dwattr $C$DW$435, DW_AT_name("$P$T68")
	.dwattr $C$DW$435, DW_AT_TI_symbol_name("$P$T68")
	.dwattr $C$DW$435, DW_AT_data_member_location[DW_OP_plus_uconst 0x110c]
	.dwattr $C$DW$435, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$435, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$435, DW_AT_decl_line(0x327)
	.dwattr $C$DW$435, DW_AT_decl_column(0x02)
$C$DW$436	.dwtag  DW_TAG_member
	.dwattr $C$DW$436, DW_AT_type(*$C$DW$T$247)
	.dwattr $C$DW$436, DW_AT_name("$P$T69")
	.dwattr $C$DW$436, DW_AT_TI_symbol_name("$P$T69")
	.dwattr $C$DW$436, DW_AT_data_member_location[DW_OP_plus_uconst 0x1110]
	.dwattr $C$DW$436, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$436, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$436, DW_AT_decl_line(0x333)
	.dwattr $C$DW$436, DW_AT_decl_column(0x02)
$C$DW$437	.dwtag  DW_TAG_member
	.dwattr $C$DW$437, DW_AT_type(*$C$DW$T$249)
	.dwattr $C$DW$437, DW_AT_name("$P$T70")
	.dwattr $C$DW$437, DW_AT_TI_symbol_name("$P$T70")
	.dwattr $C$DW$437, DW_AT_data_member_location[DW_OP_plus_uconst 0x1114]
	.dwattr $C$DW$437, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$437, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$437, DW_AT_decl_line(0x33f)
	.dwattr $C$DW$437, DW_AT_decl_column(0x02)
$C$DW$438	.dwtag  DW_TAG_member
	.dwattr $C$DW$438, DW_AT_type(*$C$DW$T$251)
	.dwattr $C$DW$438, DW_AT_name("$P$T71")
	.dwattr $C$DW$438, DW_AT_TI_symbol_name("$P$T71")
	.dwattr $C$DW$438, DW_AT_data_member_location[DW_OP_plus_uconst 0x1118]
	.dwattr $C$DW$438, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$438, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$438, DW_AT_decl_line(0x34b)
	.dwattr $C$DW$438, DW_AT_decl_column(0x02)
$C$DW$439	.dwtag  DW_TAG_member
	.dwattr $C$DW$439, DW_AT_type(*$C$DW$T$253)
	.dwattr $C$DW$439, DW_AT_name("$P$T72")
	.dwattr $C$DW$439, DW_AT_TI_symbol_name("$P$T72")
	.dwattr $C$DW$439, DW_AT_data_member_location[DW_OP_plus_uconst 0x111c]
	.dwattr $C$DW$439, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$439, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$439, DW_AT_decl_line(0x357)
	.dwattr $C$DW$439, DW_AT_decl_column(0x02)
$C$DW$440	.dwtag  DW_TAG_member
	.dwattr $C$DW$440, DW_AT_type(*$C$DW$T$255)
	.dwattr $C$DW$440, DW_AT_name("$P$T73")
	.dwattr $C$DW$440, DW_AT_TI_symbol_name("$P$T73")
	.dwattr $C$DW$440, DW_AT_data_member_location[DW_OP_plus_uconst 0x1120]
	.dwattr $C$DW$440, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$440, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$440, DW_AT_decl_line(0x363)
	.dwattr $C$DW$440, DW_AT_decl_column(0x02)
$C$DW$441	.dwtag  DW_TAG_member
	.dwattr $C$DW$441, DW_AT_type(*$C$DW$T$257)
	.dwattr $C$DW$441, DW_AT_name("$P$T74")
	.dwattr $C$DW$441, DW_AT_TI_symbol_name("$P$T74")
	.dwattr $C$DW$441, DW_AT_data_member_location[DW_OP_plus_uconst 0x1124]
	.dwattr $C$DW$441, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$441, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$441, DW_AT_decl_line(0x36f)
	.dwattr $C$DW$441, DW_AT_decl_column(0x02)
$C$DW$442	.dwtag  DW_TAG_member
	.dwattr $C$DW$442, DW_AT_type(*$C$DW$T$104)
	.dwattr $C$DW$442, DW_AT_name("rsvd1128")
	.dwattr $C$DW$442, DW_AT_TI_symbol_name("rsvd1128")
	.dwattr $C$DW$442, DW_AT_data_member_location[DW_OP_plus_uconst 0x1128]
	.dwattr $C$DW$442, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$442, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$442, DW_AT_decl_line(0x37a)
	.dwattr $C$DW$442, DW_AT_decl_column(0x0b)
$C$DW$443	.dwtag  DW_TAG_member
	.dwattr $C$DW$443, DW_AT_type(*$C$DW$T$259)
	.dwattr $C$DW$443, DW_AT_name("$P$T75")
	.dwattr $C$DW$443, DW_AT_TI_symbol_name("$P$T75")
	.dwattr $C$DW$443, DW_AT_data_member_location[DW_OP_plus_uconst 0x1500]
	.dwattr $C$DW$443, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$443, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$443, DW_AT_decl_line(0x37e)
	.dwattr $C$DW$443, DW_AT_decl_column(0x02)
	.dwendtag $C$DW$T$106

	.dwattr $C$DW$T$106, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$106, DW_AT_decl_line(0x26)
	.dwattr $C$DW$T$106, DW_AT_decl_column(0x10)
$C$DW$T$276	.dwtag  DW_TAG_typedef, DW_AT_name("pruIntc")
	.dwattr $C$DW$T$276, DW_AT_type(*$C$DW$T$106)
	.dwattr $C$DW$T$276, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$276, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$276, DW_AT_decl_line(0x387)
	.dwattr $C$DW$T$276, DW_AT_decl_column(0x03)
$C$DW$T$277	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$277, DW_AT_type(*$C$DW$T$276)

$C$DW$T$109	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$109, DW_AT_byte_size(0x04)
$C$DW$444	.dwtag  DW_TAG_member
	.dwattr $C$DW$444, DW_AT_type(*$C$DW$T$107)
	.dwattr $C$DW$444, DW_AT_name("REVID")
	.dwattr $C$DW$444, DW_AT_TI_symbol_name("REVID")
	.dwattr $C$DW$444, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$444, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$444, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$444, DW_AT_decl_line(0x2a)
	.dwattr $C$DW$444, DW_AT_decl_column(0x15)
$C$DW$445	.dwtag  DW_TAG_member
	.dwattr $C$DW$445, DW_AT_type(*$C$DW$T$108)
	.dwattr $C$DW$445, DW_AT_name("REVID_bit")
	.dwattr $C$DW$445, DW_AT_TI_symbol_name("REVID_bit")
	.dwattr $C$DW$445, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$445, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$445, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$445, DW_AT_decl_line(0x2e)
	.dwattr $C$DW$445, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$109

	.dwattr $C$DW$T$109, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$109, DW_AT_decl_line(0x29)
	.dwattr $C$DW$T$109, DW_AT_decl_column(0x08)

$C$DW$T$111	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$111, DW_AT_byte_size(0x04)
$C$DW$446	.dwtag  DW_TAG_member
	.dwattr $C$DW$446, DW_AT_type(*$C$DW$T$107)
	.dwattr $C$DW$446, DW_AT_name("SYSCFG")
	.dwattr $C$DW$446, DW_AT_TI_symbol_name("SYSCFG")
	.dwattr $C$DW$446, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$446, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$446, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$446, DW_AT_decl_line(0x34)
	.dwattr $C$DW$446, DW_AT_decl_column(0x15)
$C$DW$447	.dwtag  DW_TAG_member
	.dwattr $C$DW$447, DW_AT_type(*$C$DW$T$110)
	.dwattr $C$DW$447, DW_AT_name("SYSCFG_bit")
	.dwattr $C$DW$447, DW_AT_TI_symbol_name("SYSCFG_bit")
	.dwattr $C$DW$447, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$447, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$447, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$447, DW_AT_decl_line(0x3c)
	.dwattr $C$DW$447, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$111

	.dwattr $C$DW$T$111, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$111, DW_AT_decl_line(0x33)
	.dwattr $C$DW$T$111, DW_AT_decl_column(0x08)

$C$DW$T$113	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$113, DW_AT_byte_size(0x04)
$C$DW$448	.dwtag  DW_TAG_member
	.dwattr $C$DW$448, DW_AT_type(*$C$DW$T$107)
	.dwattr $C$DW$448, DW_AT_name("GPCFG0")
	.dwattr $C$DW$448, DW_AT_TI_symbol_name("GPCFG0")
	.dwattr $C$DW$448, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$448, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$448, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$448, DW_AT_decl_line(0x42)
	.dwattr $C$DW$448, DW_AT_decl_column(0x15)
$C$DW$449	.dwtag  DW_TAG_member
	.dwattr $C$DW$449, DW_AT_type(*$C$DW$T$112)
	.dwattr $C$DW$449, DW_AT_name("GPCFG0_bit")
	.dwattr $C$DW$449, DW_AT_TI_symbol_name("GPCFG0_bit")
	.dwattr $C$DW$449, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$449, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$449, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$449, DW_AT_decl_line(0x4f)
	.dwattr $C$DW$449, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$113

	.dwattr $C$DW$T$113, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$113, DW_AT_decl_line(0x41)
	.dwattr $C$DW$T$113, DW_AT_decl_column(0x08)

$C$DW$T$115	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$115, DW_AT_byte_size(0x04)
$C$DW$450	.dwtag  DW_TAG_member
	.dwattr $C$DW$450, DW_AT_type(*$C$DW$T$107)
	.dwattr $C$DW$450, DW_AT_name("GPCFG1")
	.dwattr $C$DW$450, DW_AT_TI_symbol_name("GPCFG1")
	.dwattr $C$DW$450, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$450, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$450, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$450, DW_AT_decl_line(0x55)
	.dwattr $C$DW$450, DW_AT_decl_column(0x15)
$C$DW$451	.dwtag  DW_TAG_member
	.dwattr $C$DW$451, DW_AT_type(*$C$DW$T$114)
	.dwattr $C$DW$451, DW_AT_name("GPCFG1_bit")
	.dwattr $C$DW$451, DW_AT_TI_symbol_name("GPCFG1_bit")
	.dwattr $C$DW$451, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$451, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$451, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$451, DW_AT_decl_line(0x62)
	.dwattr $C$DW$451, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$115

	.dwattr $C$DW$T$115, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$115, DW_AT_decl_line(0x54)
	.dwattr $C$DW$T$115, DW_AT_decl_column(0x08)

$C$DW$T$117	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$117, DW_AT_byte_size(0x04)
$C$DW$452	.dwtag  DW_TAG_member
	.dwattr $C$DW$452, DW_AT_type(*$C$DW$T$107)
	.dwattr $C$DW$452, DW_AT_name("CGR")
	.dwattr $C$DW$452, DW_AT_TI_symbol_name("CGR")
	.dwattr $C$DW$452, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$452, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$452, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$452, DW_AT_decl_line(0x68)
	.dwattr $C$DW$452, DW_AT_decl_column(0x15)
$C$DW$453	.dwtag  DW_TAG_member
	.dwattr $C$DW$453, DW_AT_type(*$C$DW$T$116)
	.dwattr $C$DW$453, DW_AT_name("CGR_bit")
	.dwattr $C$DW$453, DW_AT_TI_symbol_name("CGR_bit")
	.dwattr $C$DW$453, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$453, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$453, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$453, DW_AT_decl_line(0x7e)
	.dwattr $C$DW$453, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$117

	.dwattr $C$DW$T$117, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$117, DW_AT_decl_line(0x67)
	.dwattr $C$DW$T$117, DW_AT_decl_column(0x08)

$C$DW$T$119	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$119, DW_AT_byte_size(0x04)
$C$DW$454	.dwtag  DW_TAG_member
	.dwattr $C$DW$454, DW_AT_type(*$C$DW$T$107)
	.dwattr $C$DW$454, DW_AT_name("ISRP")
	.dwattr $C$DW$454, DW_AT_TI_symbol_name("ISRP")
	.dwattr $C$DW$454, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$454, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$454, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$454, DW_AT_decl_line(0x84)
	.dwattr $C$DW$454, DW_AT_decl_column(0x15)
$C$DW$455	.dwtag  DW_TAG_member
	.dwattr $C$DW$455, DW_AT_type(*$C$DW$T$118)
	.dwattr $C$DW$455, DW_AT_name("ISRP_bit")
	.dwattr $C$DW$455, DW_AT_TI_symbol_name("ISRP_bit")
	.dwattr $C$DW$455, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$455, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$455, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$455, DW_AT_decl_line(0x8d)
	.dwattr $C$DW$455, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$119

	.dwattr $C$DW$T$119, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$119, DW_AT_decl_line(0x83)
	.dwattr $C$DW$T$119, DW_AT_decl_column(0x08)

$C$DW$T$121	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$121, DW_AT_byte_size(0x04)
$C$DW$456	.dwtag  DW_TAG_member
	.dwattr $C$DW$456, DW_AT_type(*$C$DW$T$107)
	.dwattr $C$DW$456, DW_AT_name("ISP")
	.dwattr $C$DW$456, DW_AT_TI_symbol_name("ISP")
	.dwattr $C$DW$456, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$456, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$456, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$456, DW_AT_decl_line(0x93)
	.dwattr $C$DW$456, DW_AT_decl_column(0x15)
$C$DW$457	.dwtag  DW_TAG_member
	.dwattr $C$DW$457, DW_AT_type(*$C$DW$T$120)
	.dwattr $C$DW$457, DW_AT_name("ISP_bit")
	.dwattr $C$DW$457, DW_AT_TI_symbol_name("ISP_bit")
	.dwattr $C$DW$457, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$457, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$457, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$457, DW_AT_decl_line(0x9c)
	.dwattr $C$DW$457, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$121

	.dwattr $C$DW$T$121, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$121, DW_AT_decl_line(0x92)
	.dwattr $C$DW$T$121, DW_AT_decl_column(0x08)

$C$DW$T$123	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$123, DW_AT_byte_size(0x04)
$C$DW$458	.dwtag  DW_TAG_member
	.dwattr $C$DW$458, DW_AT_type(*$C$DW$T$107)
	.dwattr $C$DW$458, DW_AT_name("IESP")
	.dwattr $C$DW$458, DW_AT_TI_symbol_name("IESP")
	.dwattr $C$DW$458, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$458, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$458, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$458, DW_AT_decl_line(0xa1)
	.dwattr $C$DW$458, DW_AT_decl_column(0x15)
$C$DW$459	.dwtag  DW_TAG_member
	.dwattr $C$DW$459, DW_AT_type(*$C$DW$T$122)
	.dwattr $C$DW$459, DW_AT_name("IESP_bit")
	.dwattr $C$DW$459, DW_AT_TI_symbol_name("IESP_bit")
	.dwattr $C$DW$459, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$459, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$459, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$459, DW_AT_decl_line(0xaa)
	.dwattr $C$DW$459, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$123

	.dwattr $C$DW$T$123, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$123, DW_AT_decl_line(0xa0)
	.dwattr $C$DW$T$123, DW_AT_decl_column(0x08)

$C$DW$T$125	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$125, DW_AT_byte_size(0x04)
$C$DW$460	.dwtag  DW_TAG_member
	.dwattr $C$DW$460, DW_AT_type(*$C$DW$T$107)
	.dwattr $C$DW$460, DW_AT_name("IECP")
	.dwattr $C$DW$460, DW_AT_TI_symbol_name("IECP")
	.dwattr $C$DW$460, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$460, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$460, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$460, DW_AT_decl_line(0xb0)
	.dwattr $C$DW$460, DW_AT_decl_column(0x15)
$C$DW$461	.dwtag  DW_TAG_member
	.dwattr $C$DW$461, DW_AT_type(*$C$DW$T$124)
	.dwattr $C$DW$461, DW_AT_name("IECP_bit")
	.dwattr $C$DW$461, DW_AT_TI_symbol_name("IECP_bit")
	.dwattr $C$DW$461, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$461, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$461, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$461, DW_AT_decl_line(0xb8)
	.dwattr $C$DW$461, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$125

	.dwattr $C$DW$T$125, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$125, DW_AT_decl_line(0xaf)
	.dwattr $C$DW$T$125, DW_AT_decl_column(0x08)

$C$DW$T$127	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$127, DW_AT_byte_size(0x04)
$C$DW$462	.dwtag  DW_TAG_member
	.dwattr $C$DW$462, DW_AT_type(*$C$DW$T$107)
	.dwattr $C$DW$462, DW_AT_name("PMAO")
	.dwattr $C$DW$462, DW_AT_TI_symbol_name("PMAO")
	.dwattr $C$DW$462, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$462, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$462, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$462, DW_AT_decl_line(0xc1)
	.dwattr $C$DW$462, DW_AT_decl_column(0x15)
$C$DW$463	.dwtag  DW_TAG_member
	.dwattr $C$DW$463, DW_AT_type(*$C$DW$T$126)
	.dwattr $C$DW$463, DW_AT_name("PMAO_bit")
	.dwattr $C$DW$463, DW_AT_TI_symbol_name("PMAO_bit")
	.dwattr $C$DW$463, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$463, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$463, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$463, DW_AT_decl_line(0xc7)
	.dwattr $C$DW$463, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$127

	.dwattr $C$DW$T$127, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$127, DW_AT_decl_line(0xc0)
	.dwattr $C$DW$T$127, DW_AT_decl_column(0x08)

$C$DW$T$129	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$129, DW_AT_byte_size(0x04)
$C$DW$464	.dwtag  DW_TAG_member
	.dwattr $C$DW$464, DW_AT_type(*$C$DW$T$107)
	.dwattr $C$DW$464, DW_AT_name("IEPCLK")
	.dwattr $C$DW$464, DW_AT_TI_symbol_name("IEPCLK")
	.dwattr $C$DW$464, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$464, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$464, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$464, DW_AT_decl_line(0xd0)
	.dwattr $C$DW$464, DW_AT_decl_column(0x15)
$C$DW$465	.dwtag  DW_TAG_member
	.dwattr $C$DW$465, DW_AT_type(*$C$DW$T$128)
	.dwattr $C$DW$465, DW_AT_name("IEPCLK_bit")
	.dwattr $C$DW$465, DW_AT_TI_symbol_name("IEPCLK_bit")
	.dwattr $C$DW$465, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$465, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$465, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$465, DW_AT_decl_line(0xd5)
	.dwattr $C$DW$465, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$129

	.dwattr $C$DW$T$129, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$129, DW_AT_decl_line(0xcf)
	.dwattr $C$DW$T$129, DW_AT_decl_column(0x08)

$C$DW$T$131	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$131, DW_AT_byte_size(0x04)
$C$DW$466	.dwtag  DW_TAG_member
	.dwattr $C$DW$466, DW_AT_type(*$C$DW$T$107)
	.dwattr $C$DW$466, DW_AT_name("SPP")
	.dwattr $C$DW$466, DW_AT_TI_symbol_name("SPP")
	.dwattr $C$DW$466, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$466, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$466, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$466, DW_AT_decl_line(0xdb)
	.dwattr $C$DW$466, DW_AT_decl_column(0x15)
$C$DW$467	.dwtag  DW_TAG_member
	.dwattr $C$DW$467, DW_AT_type(*$C$DW$T$130)
	.dwattr $C$DW$467, DW_AT_name("SPP_bit")
	.dwattr $C$DW$467, DW_AT_TI_symbol_name("SPP_bit")
	.dwattr $C$DW$467, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$467, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$467, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$467, DW_AT_decl_line(0xe1)
	.dwattr $C$DW$467, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$131

	.dwattr $C$DW$T$131, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$131, DW_AT_decl_line(0xda)
	.dwattr $C$DW$T$131, DW_AT_decl_column(0x08)

$C$DW$T$133	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$133, DW_AT_byte_size(0x04)
$C$DW$468	.dwtag  DW_TAG_member
	.dwattr $C$DW$468, DW_AT_type(*$C$DW$T$107)
	.dwattr $C$DW$468, DW_AT_name("PIN_MX")
	.dwattr $C$DW$468, DW_AT_TI_symbol_name("PIN_MX")
	.dwattr $C$DW$468, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$468, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$468, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$468, DW_AT_decl_line(0xe9)
	.dwattr $C$DW$468, DW_AT_decl_column(0x15)
$C$DW$469	.dwtag  DW_TAG_member
	.dwattr $C$DW$469, DW_AT_type(*$C$DW$T$132)
	.dwattr $C$DW$469, DW_AT_name("PIN_MX_bit")
	.dwattr $C$DW$469, DW_AT_TI_symbol_name("PIN_MX_bit")
	.dwattr $C$DW$469, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$469, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$469, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$469, DW_AT_decl_line(0xee)
	.dwattr $C$DW$469, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$133

	.dwattr $C$DW$T$133, DW_AT_decl_file("include/am335x/pru_cfg.h")
	.dwattr $C$DW$T$133, DW_AT_decl_line(0xe8)
	.dwattr $C$DW$T$133, DW_AT_decl_column(0x08)

$C$DW$T$135	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$135, DW_AT_byte_size(0x04)
$C$DW$470	.dwtag  DW_TAG_member
	.dwattr $C$DW$470, DW_AT_type(*$C$DW$T$107)
	.dwattr $C$DW$470, DW_AT_name("REVID")
	.dwattr $C$DW$470, DW_AT_TI_symbol_name("REVID")
	.dwattr $C$DW$470, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$470, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$470, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$470, DW_AT_decl_line(0x2a)
	.dwattr $C$DW$470, DW_AT_decl_column(0x15)
$C$DW$471	.dwtag  DW_TAG_member
	.dwattr $C$DW$471, DW_AT_type(*$C$DW$T$134)
	.dwattr $C$DW$471, DW_AT_name("REVID_bit")
	.dwattr $C$DW$471, DW_AT_TI_symbol_name("REVID_bit")
	.dwattr $C$DW$471, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$471, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$471, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$471, DW_AT_decl_line(0x34)
	.dwattr $C$DW$471, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$135

	.dwattr $C$DW$T$135, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$135, DW_AT_decl_line(0x29)
	.dwattr $C$DW$T$135, DW_AT_decl_column(0x08)

$C$DW$T$137	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$137, DW_AT_byte_size(0x04)
$C$DW$472	.dwtag  DW_TAG_member
	.dwattr $C$DW$472, DW_AT_type(*$C$DW$T$107)
	.dwattr $C$DW$472, DW_AT_name("CR")
	.dwattr $C$DW$472, DW_AT_TI_symbol_name("CR")
	.dwattr $C$DW$472, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$472, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$472, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$472, DW_AT_decl_line(0x3a)
	.dwattr $C$DW$472, DW_AT_decl_column(0x15)
$C$DW$473	.dwtag  DW_TAG_member
	.dwattr $C$DW$473, DW_AT_type(*$C$DW$T$136)
	.dwattr $C$DW$473, DW_AT_name("CR_bit")
	.dwattr $C$DW$473, DW_AT_TI_symbol_name("CR_bit")
	.dwattr $C$DW$473, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$473, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$473, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$473, DW_AT_decl_line(0x40)
	.dwattr $C$DW$473, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$137

	.dwattr $C$DW$T$137, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$137, DW_AT_decl_line(0x39)
	.dwattr $C$DW$T$137, DW_AT_decl_column(0x08)

$C$DW$T$139	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$139, DW_AT_byte_size(0x04)
$C$DW$474	.dwtag  DW_TAG_member
	.dwattr $C$DW$474, DW_AT_type(*$C$DW$T$107)
	.dwattr $C$DW$474, DW_AT_name("GER")
	.dwattr $C$DW$474, DW_AT_TI_symbol_name("GER")
	.dwattr $C$DW$474, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$474, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$474, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$474, DW_AT_decl_line(0x49)
	.dwattr $C$DW$474, DW_AT_decl_column(0x15)
$C$DW$475	.dwtag  DW_TAG_member
	.dwattr $C$DW$475, DW_AT_type(*$C$DW$T$138)
	.dwattr $C$DW$475, DW_AT_name("GER_bit")
	.dwattr $C$DW$475, DW_AT_TI_symbol_name("GER_bit")
	.dwattr $C$DW$475, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$475, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$475, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$475, DW_AT_decl_line(0x4e)
	.dwattr $C$DW$475, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$139

	.dwattr $C$DW$T$139, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$139, DW_AT_decl_line(0x48)
	.dwattr $C$DW$T$139, DW_AT_decl_column(0x08)

$C$DW$T$141	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$141, DW_AT_byte_size(0x04)
$C$DW$476	.dwtag  DW_TAG_member
	.dwattr $C$DW$476, DW_AT_type(*$C$DW$T$107)
	.dwattr $C$DW$476, DW_AT_name("GNLR")
	.dwattr $C$DW$476, DW_AT_TI_symbol_name("GNLR")
	.dwattr $C$DW$476, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$476, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$476, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$476, DW_AT_decl_line(0x57)
	.dwattr $C$DW$476, DW_AT_decl_column(0x15)
$C$DW$477	.dwtag  DW_TAG_member
	.dwattr $C$DW$477, DW_AT_type(*$C$DW$T$140)
	.dwattr $C$DW$477, DW_AT_name("GNLR_bit")
	.dwattr $C$DW$477, DW_AT_TI_symbol_name("GNLR_bit")
	.dwattr $C$DW$477, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$477, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$477, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$477, DW_AT_decl_line(0x5d)
	.dwattr $C$DW$477, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$141

	.dwattr $C$DW$T$141, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$141, DW_AT_decl_line(0x56)
	.dwattr $C$DW$T$141, DW_AT_decl_column(0x08)

$C$DW$T$143	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$143, DW_AT_byte_size(0x04)
$C$DW$478	.dwtag  DW_TAG_member
	.dwattr $C$DW$478, DW_AT_type(*$C$DW$T$107)
	.dwattr $C$DW$478, DW_AT_name("SISR")
	.dwattr $C$DW$478, DW_AT_TI_symbol_name("SISR")
	.dwattr $C$DW$478, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$478, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$478, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$478, DW_AT_decl_line(0x63)
	.dwattr $C$DW$478, DW_AT_decl_column(0x15)
$C$DW$479	.dwtag  DW_TAG_member
	.dwattr $C$DW$479, DW_AT_type(*$C$DW$T$142)
	.dwattr $C$DW$479, DW_AT_name("SISR_bit")
	.dwattr $C$DW$479, DW_AT_TI_symbol_name("SISR_bit")
	.dwattr $C$DW$479, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$479, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$479, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$479, DW_AT_decl_line(0x68)
	.dwattr $C$DW$479, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$143

	.dwattr $C$DW$T$143, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$143, DW_AT_decl_line(0x62)
	.dwattr $C$DW$T$143, DW_AT_decl_column(0x08)

$C$DW$T$145	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$145, DW_AT_byte_size(0x04)
$C$DW$480	.dwtag  DW_TAG_member
	.dwattr $C$DW$480, DW_AT_type(*$C$DW$T$107)
	.dwattr $C$DW$480, DW_AT_name("SICR")
	.dwattr $C$DW$480, DW_AT_TI_symbol_name("SICR")
	.dwattr $C$DW$480, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$480, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$480, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$480, DW_AT_decl_line(0x6e)
	.dwattr $C$DW$480, DW_AT_decl_column(0x15)
$C$DW$481	.dwtag  DW_TAG_member
	.dwattr $C$DW$481, DW_AT_type(*$C$DW$T$144)
	.dwattr $C$DW$481, DW_AT_name("SICR_bit")
	.dwattr $C$DW$481, DW_AT_TI_symbol_name("SICR_bit")
	.dwattr $C$DW$481, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$481, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$481, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$481, DW_AT_decl_line(0x73)
	.dwattr $C$DW$481, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$145

	.dwattr $C$DW$T$145, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$145, DW_AT_decl_line(0x6d)
	.dwattr $C$DW$T$145, DW_AT_decl_column(0x08)

$C$DW$T$147	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$147, DW_AT_byte_size(0x04)
$C$DW$482	.dwtag  DW_TAG_member
	.dwattr $C$DW$482, DW_AT_type(*$C$DW$T$107)
	.dwattr $C$DW$482, DW_AT_name("EISR")
	.dwattr $C$DW$482, DW_AT_TI_symbol_name("EISR")
	.dwattr $C$DW$482, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$482, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$482, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$482, DW_AT_decl_line(0x79)
	.dwattr $C$DW$482, DW_AT_decl_column(0x15)
$C$DW$483	.dwtag  DW_TAG_member
	.dwattr $C$DW$483, DW_AT_type(*$C$DW$T$146)
	.dwattr $C$DW$483, DW_AT_name("EISR_bit")
	.dwattr $C$DW$483, DW_AT_TI_symbol_name("EISR_bit")
	.dwattr $C$DW$483, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$483, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$483, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$483, DW_AT_decl_line(0x7e)
	.dwattr $C$DW$483, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$147

	.dwattr $C$DW$T$147, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$147, DW_AT_decl_line(0x78)
	.dwattr $C$DW$T$147, DW_AT_decl_column(0x08)

$C$DW$T$149	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$149, DW_AT_byte_size(0x04)
$C$DW$484	.dwtag  DW_TAG_member
	.dwattr $C$DW$484, DW_AT_type(*$C$DW$T$107)
	.dwattr $C$DW$484, DW_AT_name("EICR")
	.dwattr $C$DW$484, DW_AT_TI_symbol_name("EICR")
	.dwattr $C$DW$484, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$484, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$484, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$484, DW_AT_decl_line(0x84)
	.dwattr $C$DW$484, DW_AT_decl_column(0x15)
$C$DW$485	.dwtag  DW_TAG_member
	.dwattr $C$DW$485, DW_AT_type(*$C$DW$T$148)
	.dwattr $C$DW$485, DW_AT_name("EICR_bit")
	.dwattr $C$DW$485, DW_AT_TI_symbol_name("EICR_bit")
	.dwattr $C$DW$485, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$485, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$485, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$485, DW_AT_decl_line(0x89)
	.dwattr $C$DW$485, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$149

	.dwattr $C$DW$T$149, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$149, DW_AT_decl_line(0x83)
	.dwattr $C$DW$T$149, DW_AT_decl_column(0x08)

$C$DW$T$151	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$151, DW_AT_byte_size(0x04)
$C$DW$486	.dwtag  DW_TAG_member
	.dwattr $C$DW$486, DW_AT_type(*$C$DW$T$107)
	.dwattr $C$DW$486, DW_AT_name("HIEISR")
	.dwattr $C$DW$486, DW_AT_TI_symbol_name("HIEISR")
	.dwattr $C$DW$486, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$486, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$486, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$486, DW_AT_decl_line(0x92)
	.dwattr $C$DW$486, DW_AT_decl_column(0x15)
$C$DW$487	.dwtag  DW_TAG_member
	.dwattr $C$DW$487, DW_AT_type(*$C$DW$T$150)
	.dwattr $C$DW$487, DW_AT_name("HIEISR_bit")
	.dwattr $C$DW$487, DW_AT_TI_symbol_name("HIEISR_bit")
	.dwattr $C$DW$487, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$487, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$487, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$487, DW_AT_decl_line(0x97)
	.dwattr $C$DW$487, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$151

	.dwattr $C$DW$T$151, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$151, DW_AT_decl_line(0x91)
	.dwattr $C$DW$T$151, DW_AT_decl_column(0x08)

$C$DW$T$153	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$153, DW_AT_byte_size(0x04)
$C$DW$488	.dwtag  DW_TAG_member
	.dwattr $C$DW$488, DW_AT_type(*$C$DW$T$107)
	.dwattr $C$DW$488, DW_AT_name("HIDISR")
	.dwattr $C$DW$488, DW_AT_TI_symbol_name("HIDISR")
	.dwattr $C$DW$488, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$488, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$488, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$488, DW_AT_decl_line(0x9d)
	.dwattr $C$DW$488, DW_AT_decl_column(0x15)
$C$DW$489	.dwtag  DW_TAG_member
	.dwattr $C$DW$489, DW_AT_type(*$C$DW$T$152)
	.dwattr $C$DW$489, DW_AT_name("HIDISR_bit")
	.dwattr $C$DW$489, DW_AT_TI_symbol_name("HIDISR_bit")
	.dwattr $C$DW$489, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$489, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$489, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$489, DW_AT_decl_line(0xa2)
	.dwattr $C$DW$489, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$153

	.dwattr $C$DW$T$153, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$153, DW_AT_decl_line(0x9c)
	.dwattr $C$DW$T$153, DW_AT_decl_column(0x08)

$C$DW$T$155	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$155, DW_AT_byte_size(0x04)
$C$DW$490	.dwtag  DW_TAG_member
	.dwattr $C$DW$490, DW_AT_type(*$C$DW$T$107)
	.dwattr $C$DW$490, DW_AT_name("GPIR")
	.dwattr $C$DW$490, DW_AT_TI_symbol_name("GPIR")
	.dwattr $C$DW$490, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$490, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$490, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$490, DW_AT_decl_line(0xab)
	.dwattr $C$DW$490, DW_AT_decl_column(0x15)
$C$DW$491	.dwtag  DW_TAG_member
	.dwattr $C$DW$491, DW_AT_type(*$C$DW$T$154)
	.dwattr $C$DW$491, DW_AT_name("GPIR_bit")
	.dwattr $C$DW$491, DW_AT_TI_symbol_name("GPIR_bit")
	.dwattr $C$DW$491, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$491, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$491, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$491, DW_AT_decl_line(0xb1)
	.dwattr $C$DW$491, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$155

	.dwattr $C$DW$T$155, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$155, DW_AT_decl_line(0xaa)
	.dwattr $C$DW$T$155, DW_AT_decl_column(0x08)

$C$DW$T$157	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$157, DW_AT_byte_size(0x04)
$C$DW$492	.dwtag  DW_TAG_member
	.dwattr $C$DW$492, DW_AT_type(*$C$DW$T$107)
	.dwattr $C$DW$492, DW_AT_name("SRSR0")
	.dwattr $C$DW$492, DW_AT_TI_symbol_name("SRSR0")
	.dwattr $C$DW$492, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$492, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$492, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$492, DW_AT_decl_line(0xba)
	.dwattr $C$DW$492, DW_AT_decl_column(0x15)
$C$DW$493	.dwtag  DW_TAG_member
	.dwattr $C$DW$493, DW_AT_type(*$C$DW$T$156)
	.dwattr $C$DW$493, DW_AT_name("SRSR0_bit")
	.dwattr $C$DW$493, DW_AT_TI_symbol_name("SRSR0_bit")
	.dwattr $C$DW$493, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$493, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$493, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$493, DW_AT_decl_line(0xbe)
	.dwattr $C$DW$493, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$157

	.dwattr $C$DW$T$157, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$157, DW_AT_decl_line(0xb9)
	.dwattr $C$DW$T$157, DW_AT_decl_column(0x08)

$C$DW$T$159	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$159, DW_AT_byte_size(0x04)
$C$DW$494	.dwtag  DW_TAG_member
	.dwattr $C$DW$494, DW_AT_type(*$C$DW$T$107)
	.dwattr $C$DW$494, DW_AT_name("SRSR1")
	.dwattr $C$DW$494, DW_AT_TI_symbol_name("SRSR1")
	.dwattr $C$DW$494, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$494, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$494, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$494, DW_AT_decl_line(0xc4)
	.dwattr $C$DW$494, DW_AT_decl_column(0x15)
$C$DW$495	.dwtag  DW_TAG_member
	.dwattr $C$DW$495, DW_AT_type(*$C$DW$T$158)
	.dwattr $C$DW$495, DW_AT_name("SRSR1_bit")
	.dwattr $C$DW$495, DW_AT_TI_symbol_name("SRSR1_bit")
	.dwattr $C$DW$495, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$495, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$495, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$495, DW_AT_decl_line(0xc8)
	.dwattr $C$DW$495, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$159

	.dwattr $C$DW$T$159, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$159, DW_AT_decl_line(0xc3)
	.dwattr $C$DW$T$159, DW_AT_decl_column(0x08)

$C$DW$T$161	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$161, DW_AT_byte_size(0x04)
$C$DW$496	.dwtag  DW_TAG_member
	.dwattr $C$DW$496, DW_AT_type(*$C$DW$T$107)
	.dwattr $C$DW$496, DW_AT_name("SECR0")
	.dwattr $C$DW$496, DW_AT_TI_symbol_name("SECR0")
	.dwattr $C$DW$496, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$496, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$496, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$496, DW_AT_decl_line(0xd1)
	.dwattr $C$DW$496, DW_AT_decl_column(0x15)
$C$DW$497	.dwtag  DW_TAG_member
	.dwattr $C$DW$497, DW_AT_type(*$C$DW$T$160)
	.dwattr $C$DW$497, DW_AT_name("SECR0_bit")
	.dwattr $C$DW$497, DW_AT_TI_symbol_name("SECR0_bit")
	.dwattr $C$DW$497, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$497, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$497, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$497, DW_AT_decl_line(0xd5)
	.dwattr $C$DW$497, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$161

	.dwattr $C$DW$T$161, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$161, DW_AT_decl_line(0xd0)
	.dwattr $C$DW$T$161, DW_AT_decl_column(0x08)

$C$DW$T$163	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$163, DW_AT_byte_size(0x04)
$C$DW$498	.dwtag  DW_TAG_member
	.dwattr $C$DW$498, DW_AT_type(*$C$DW$T$107)
	.dwattr $C$DW$498, DW_AT_name("SECR1")
	.dwattr $C$DW$498, DW_AT_TI_symbol_name("SECR1")
	.dwattr $C$DW$498, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$498, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$498, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$498, DW_AT_decl_line(0xdb)
	.dwattr $C$DW$498, DW_AT_decl_column(0x15)
$C$DW$499	.dwtag  DW_TAG_member
	.dwattr $C$DW$499, DW_AT_type(*$C$DW$T$162)
	.dwattr $C$DW$499, DW_AT_name("SECR1_bit")
	.dwattr $C$DW$499, DW_AT_TI_symbol_name("SECR1_bit")
	.dwattr $C$DW$499, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$499, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$499, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$499, DW_AT_decl_line(0xdf)
	.dwattr $C$DW$499, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$163

	.dwattr $C$DW$T$163, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$163, DW_AT_decl_line(0xda)
	.dwattr $C$DW$T$163, DW_AT_decl_column(0x08)

$C$DW$T$165	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$165, DW_AT_byte_size(0x04)
$C$DW$500	.dwtag  DW_TAG_member
	.dwattr $C$DW$500, DW_AT_type(*$C$DW$T$107)
	.dwattr $C$DW$500, DW_AT_name("ESR0")
	.dwattr $C$DW$500, DW_AT_TI_symbol_name("ESR0")
	.dwattr $C$DW$500, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$500, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$500, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$500, DW_AT_decl_line(0xe8)
	.dwattr $C$DW$500, DW_AT_decl_column(0x15)
$C$DW$501	.dwtag  DW_TAG_member
	.dwattr $C$DW$501, DW_AT_type(*$C$DW$T$164)
	.dwattr $C$DW$501, DW_AT_name("ESR0_bit")
	.dwattr $C$DW$501, DW_AT_TI_symbol_name("ESR0_bit")
	.dwattr $C$DW$501, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$501, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$501, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$501, DW_AT_decl_line(0xec)
	.dwattr $C$DW$501, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$165

	.dwattr $C$DW$T$165, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$165, DW_AT_decl_line(0xe7)
	.dwattr $C$DW$T$165, DW_AT_decl_column(0x08)

$C$DW$T$167	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$167, DW_AT_byte_size(0x04)
$C$DW$502	.dwtag  DW_TAG_member
	.dwattr $C$DW$502, DW_AT_type(*$C$DW$T$107)
	.dwattr $C$DW$502, DW_AT_name("ESR1")
	.dwattr $C$DW$502, DW_AT_TI_symbol_name("ESR1")
	.dwattr $C$DW$502, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$502, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$502, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$502, DW_AT_decl_line(0xf2)
	.dwattr $C$DW$502, DW_AT_decl_column(0x15)
$C$DW$503	.dwtag  DW_TAG_member
	.dwattr $C$DW$503, DW_AT_type(*$C$DW$T$166)
	.dwattr $C$DW$503, DW_AT_name("ESR1_bit")
	.dwattr $C$DW$503, DW_AT_TI_symbol_name("ESR1_bit")
	.dwattr $C$DW$503, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$503, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$503, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$503, DW_AT_decl_line(0xf6)
	.dwattr $C$DW$503, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$167

	.dwattr $C$DW$T$167, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$167, DW_AT_decl_line(0xf1)
	.dwattr $C$DW$T$167, DW_AT_decl_column(0x08)

$C$DW$T$169	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$169, DW_AT_byte_size(0x04)
$C$DW$504	.dwtag  DW_TAG_member
	.dwattr $C$DW$504, DW_AT_type(*$C$DW$T$107)
	.dwattr $C$DW$504, DW_AT_name("ECR0")
	.dwattr $C$DW$504, DW_AT_TI_symbol_name("ECR0")
	.dwattr $C$DW$504, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$504, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$504, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$504, DW_AT_decl_line(0xff)
	.dwattr $C$DW$504, DW_AT_decl_column(0x15)
$C$DW$505	.dwtag  DW_TAG_member
	.dwattr $C$DW$505, DW_AT_type(*$C$DW$T$168)
	.dwattr $C$DW$505, DW_AT_name("ECR0_bit")
	.dwattr $C$DW$505, DW_AT_TI_symbol_name("ECR0_bit")
	.dwattr $C$DW$505, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$505, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$505, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$505, DW_AT_decl_line(0x103)
	.dwattr $C$DW$505, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$169

	.dwattr $C$DW$T$169, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$169, DW_AT_decl_line(0xfe)
	.dwattr $C$DW$T$169, DW_AT_decl_column(0x08)

$C$DW$T$171	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$171, DW_AT_byte_size(0x04)
$C$DW$506	.dwtag  DW_TAG_member
	.dwattr $C$DW$506, DW_AT_type(*$C$DW$T$107)
	.dwattr $C$DW$506, DW_AT_name("ECR1")
	.dwattr $C$DW$506, DW_AT_TI_symbol_name("ECR1")
	.dwattr $C$DW$506, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$506, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$506, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$506, DW_AT_decl_line(0x109)
	.dwattr $C$DW$506, DW_AT_decl_column(0x15)
$C$DW$507	.dwtag  DW_TAG_member
	.dwattr $C$DW$507, DW_AT_type(*$C$DW$T$170)
	.dwattr $C$DW$507, DW_AT_name("ECR1_bit")
	.dwattr $C$DW$507, DW_AT_TI_symbol_name("ECR1_bit")
	.dwattr $C$DW$507, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$507, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$507, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$507, DW_AT_decl_line(0x10d)
	.dwattr $C$DW$507, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$171

	.dwattr $C$DW$T$171, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$171, DW_AT_decl_line(0x108)
	.dwattr $C$DW$T$171, DW_AT_decl_column(0x08)

$C$DW$T$173	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$173, DW_AT_byte_size(0x04)
$C$DW$508	.dwtag  DW_TAG_member
	.dwattr $C$DW$508, DW_AT_type(*$C$DW$T$107)
	.dwattr $C$DW$508, DW_AT_name("CMR0")
	.dwattr $C$DW$508, DW_AT_TI_symbol_name("CMR0")
	.dwattr $C$DW$508, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$508, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$508, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$508, DW_AT_decl_line(0x116)
	.dwattr $C$DW$508, DW_AT_decl_column(0x15)
$C$DW$509	.dwtag  DW_TAG_member
	.dwattr $C$DW$509, DW_AT_type(*$C$DW$T$172)
	.dwattr $C$DW$509, DW_AT_name("CMR0_bit")
	.dwattr $C$DW$509, DW_AT_TI_symbol_name("CMR0_bit")
	.dwattr $C$DW$509, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$509, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$509, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$509, DW_AT_decl_line(0x121)
	.dwattr $C$DW$509, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$173

	.dwattr $C$DW$T$173, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$173, DW_AT_decl_line(0x115)
	.dwattr $C$DW$T$173, DW_AT_decl_column(0x08)

$C$DW$T$175	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$175, DW_AT_byte_size(0x04)
$C$DW$510	.dwtag  DW_TAG_member
	.dwattr $C$DW$510, DW_AT_type(*$C$DW$T$107)
	.dwattr $C$DW$510, DW_AT_name("CMR1")
	.dwattr $C$DW$510, DW_AT_TI_symbol_name("CMR1")
	.dwattr $C$DW$510, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$510, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$510, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$510, DW_AT_decl_line(0x127)
	.dwattr $C$DW$510, DW_AT_decl_column(0x15)
$C$DW$511	.dwtag  DW_TAG_member
	.dwattr $C$DW$511, DW_AT_type(*$C$DW$T$174)
	.dwattr $C$DW$511, DW_AT_name("CMR1_bit")
	.dwattr $C$DW$511, DW_AT_TI_symbol_name("CMR1_bit")
	.dwattr $C$DW$511, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$511, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$511, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$511, DW_AT_decl_line(0x132)
	.dwattr $C$DW$511, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$175

	.dwattr $C$DW$T$175, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$175, DW_AT_decl_line(0x126)
	.dwattr $C$DW$T$175, DW_AT_decl_column(0x08)

$C$DW$T$177	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$177, DW_AT_byte_size(0x04)
$C$DW$512	.dwtag  DW_TAG_member
	.dwattr $C$DW$512, DW_AT_type(*$C$DW$T$107)
	.dwattr $C$DW$512, DW_AT_name("CMR2")
	.dwattr $C$DW$512, DW_AT_TI_symbol_name("CMR2")
	.dwattr $C$DW$512, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$512, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$512, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$512, DW_AT_decl_line(0x138)
	.dwattr $C$DW$512, DW_AT_decl_column(0x15)
$C$DW$513	.dwtag  DW_TAG_member
	.dwattr $C$DW$513, DW_AT_type(*$C$DW$T$176)
	.dwattr $C$DW$513, DW_AT_name("CMR2_bit")
	.dwattr $C$DW$513, DW_AT_TI_symbol_name("CMR2_bit")
	.dwattr $C$DW$513, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$513, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$513, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$513, DW_AT_decl_line(0x143)
	.dwattr $C$DW$513, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$177

	.dwattr $C$DW$T$177, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$177, DW_AT_decl_line(0x137)
	.dwattr $C$DW$T$177, DW_AT_decl_column(0x08)

$C$DW$T$179	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$179, DW_AT_byte_size(0x04)
$C$DW$514	.dwtag  DW_TAG_member
	.dwattr $C$DW$514, DW_AT_type(*$C$DW$T$107)
	.dwattr $C$DW$514, DW_AT_name("CMR3")
	.dwattr $C$DW$514, DW_AT_TI_symbol_name("CMR3")
	.dwattr $C$DW$514, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$514, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$514, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$514, DW_AT_decl_line(0x149)
	.dwattr $C$DW$514, DW_AT_decl_column(0x15)
$C$DW$515	.dwtag  DW_TAG_member
	.dwattr $C$DW$515, DW_AT_type(*$C$DW$T$178)
	.dwattr $C$DW$515, DW_AT_name("CMR3_bit")
	.dwattr $C$DW$515, DW_AT_TI_symbol_name("CMR3_bit")
	.dwattr $C$DW$515, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$515, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$515, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$515, DW_AT_decl_line(0x154)
	.dwattr $C$DW$515, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$179

	.dwattr $C$DW$T$179, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$179, DW_AT_decl_line(0x148)
	.dwattr $C$DW$T$179, DW_AT_decl_column(0x08)

$C$DW$T$181	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$181, DW_AT_byte_size(0x04)
$C$DW$516	.dwtag  DW_TAG_member
	.dwattr $C$DW$516, DW_AT_type(*$C$DW$T$107)
	.dwattr $C$DW$516, DW_AT_name("CMR4")
	.dwattr $C$DW$516, DW_AT_TI_symbol_name("CMR4")
	.dwattr $C$DW$516, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$516, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$516, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$516, DW_AT_decl_line(0x15a)
	.dwattr $C$DW$516, DW_AT_decl_column(0x15)
$C$DW$517	.dwtag  DW_TAG_member
	.dwattr $C$DW$517, DW_AT_type(*$C$DW$T$180)
	.dwattr $C$DW$517, DW_AT_name("CMR4_bit")
	.dwattr $C$DW$517, DW_AT_TI_symbol_name("CMR4_bit")
	.dwattr $C$DW$517, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$517, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$517, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$517, DW_AT_decl_line(0x165)
	.dwattr $C$DW$517, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$181

	.dwattr $C$DW$T$181, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$181, DW_AT_decl_line(0x159)
	.dwattr $C$DW$T$181, DW_AT_decl_column(0x08)

$C$DW$T$183	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$183, DW_AT_byte_size(0x04)
$C$DW$518	.dwtag  DW_TAG_member
	.dwattr $C$DW$518, DW_AT_type(*$C$DW$T$107)
	.dwattr $C$DW$518, DW_AT_name("CMR5")
	.dwattr $C$DW$518, DW_AT_TI_symbol_name("CMR5")
	.dwattr $C$DW$518, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$518, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$518, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$518, DW_AT_decl_line(0x16b)
	.dwattr $C$DW$518, DW_AT_decl_column(0x15)
$C$DW$519	.dwtag  DW_TAG_member
	.dwattr $C$DW$519, DW_AT_type(*$C$DW$T$182)
	.dwattr $C$DW$519, DW_AT_name("CMR5_bit")
	.dwattr $C$DW$519, DW_AT_TI_symbol_name("CMR5_bit")
	.dwattr $C$DW$519, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$519, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$519, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$519, DW_AT_decl_line(0x176)
	.dwattr $C$DW$519, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$183

	.dwattr $C$DW$T$183, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$183, DW_AT_decl_line(0x16a)
	.dwattr $C$DW$T$183, DW_AT_decl_column(0x08)

$C$DW$T$185	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$185, DW_AT_byte_size(0x04)
$C$DW$520	.dwtag  DW_TAG_member
	.dwattr $C$DW$520, DW_AT_type(*$C$DW$T$107)
	.dwattr $C$DW$520, DW_AT_name("CMR6")
	.dwattr $C$DW$520, DW_AT_TI_symbol_name("CMR6")
	.dwattr $C$DW$520, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$520, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$520, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$520, DW_AT_decl_line(0x17c)
	.dwattr $C$DW$520, DW_AT_decl_column(0x15)
$C$DW$521	.dwtag  DW_TAG_member
	.dwattr $C$DW$521, DW_AT_type(*$C$DW$T$184)
	.dwattr $C$DW$521, DW_AT_name("CMR6_bit")
	.dwattr $C$DW$521, DW_AT_TI_symbol_name("CMR6_bit")
	.dwattr $C$DW$521, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$521, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$521, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$521, DW_AT_decl_line(0x187)
	.dwattr $C$DW$521, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$185

	.dwattr $C$DW$T$185, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$185, DW_AT_decl_line(0x17b)
	.dwattr $C$DW$T$185, DW_AT_decl_column(0x08)

$C$DW$T$187	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$187, DW_AT_byte_size(0x04)
$C$DW$522	.dwtag  DW_TAG_member
	.dwattr $C$DW$522, DW_AT_type(*$C$DW$T$107)
	.dwattr $C$DW$522, DW_AT_name("CMR7")
	.dwattr $C$DW$522, DW_AT_TI_symbol_name("CMR7")
	.dwattr $C$DW$522, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$522, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$522, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$522, DW_AT_decl_line(0x18d)
	.dwattr $C$DW$522, DW_AT_decl_column(0x15)
$C$DW$523	.dwtag  DW_TAG_member
	.dwattr $C$DW$523, DW_AT_type(*$C$DW$T$186)
	.dwattr $C$DW$523, DW_AT_name("CMR7_bit")
	.dwattr $C$DW$523, DW_AT_TI_symbol_name("CMR7_bit")
	.dwattr $C$DW$523, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$523, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$523, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$523, DW_AT_decl_line(0x198)
	.dwattr $C$DW$523, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$187

	.dwattr $C$DW$T$187, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$187, DW_AT_decl_line(0x18c)
	.dwattr $C$DW$T$187, DW_AT_decl_column(0x08)

$C$DW$T$189	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$189, DW_AT_byte_size(0x04)
$C$DW$524	.dwtag  DW_TAG_member
	.dwattr $C$DW$524, DW_AT_type(*$C$DW$T$107)
	.dwattr $C$DW$524, DW_AT_name("CMR8")
	.dwattr $C$DW$524, DW_AT_TI_symbol_name("CMR8")
	.dwattr $C$DW$524, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$524, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$524, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$524, DW_AT_decl_line(0x19e)
	.dwattr $C$DW$524, DW_AT_decl_column(0x15)
$C$DW$525	.dwtag  DW_TAG_member
	.dwattr $C$DW$525, DW_AT_type(*$C$DW$T$188)
	.dwattr $C$DW$525, DW_AT_name("CMR8_bit")
	.dwattr $C$DW$525, DW_AT_TI_symbol_name("CMR8_bit")
	.dwattr $C$DW$525, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$525, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$525, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$525, DW_AT_decl_line(0x1a9)
	.dwattr $C$DW$525, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$189

	.dwattr $C$DW$T$189, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$189, DW_AT_decl_line(0x19d)
	.dwattr $C$DW$T$189, DW_AT_decl_column(0x08)

$C$DW$T$191	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$191, DW_AT_byte_size(0x04)
$C$DW$526	.dwtag  DW_TAG_member
	.dwattr $C$DW$526, DW_AT_type(*$C$DW$T$107)
	.dwattr $C$DW$526, DW_AT_name("CMR9")
	.dwattr $C$DW$526, DW_AT_TI_symbol_name("CMR9")
	.dwattr $C$DW$526, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$526, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$526, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$526, DW_AT_decl_line(0x1af)
	.dwattr $C$DW$526, DW_AT_decl_column(0x15)
$C$DW$527	.dwtag  DW_TAG_member
	.dwattr $C$DW$527, DW_AT_type(*$C$DW$T$190)
	.dwattr $C$DW$527, DW_AT_name("CMR9_bit")
	.dwattr $C$DW$527, DW_AT_TI_symbol_name("CMR9_bit")
	.dwattr $C$DW$527, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$527, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$527, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$527, DW_AT_decl_line(0x1ba)
	.dwattr $C$DW$527, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$191

	.dwattr $C$DW$T$191, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$191, DW_AT_decl_line(0x1ae)
	.dwattr $C$DW$T$191, DW_AT_decl_column(0x08)

$C$DW$T$193	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$193, DW_AT_byte_size(0x04)
$C$DW$528	.dwtag  DW_TAG_member
	.dwattr $C$DW$528, DW_AT_type(*$C$DW$T$107)
	.dwattr $C$DW$528, DW_AT_name("CMR10")
	.dwattr $C$DW$528, DW_AT_TI_symbol_name("CMR10")
	.dwattr $C$DW$528, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$528, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$528, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$528, DW_AT_decl_line(0x1c0)
	.dwattr $C$DW$528, DW_AT_decl_column(0x15)
$C$DW$529	.dwtag  DW_TAG_member
	.dwattr $C$DW$529, DW_AT_type(*$C$DW$T$192)
	.dwattr $C$DW$529, DW_AT_name("CMR10_bit")
	.dwattr $C$DW$529, DW_AT_TI_symbol_name("CMR10_bit")
	.dwattr $C$DW$529, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$529, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$529, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$529, DW_AT_decl_line(0x1cb)
	.dwattr $C$DW$529, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$193

	.dwattr $C$DW$T$193, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$193, DW_AT_decl_line(0x1bf)
	.dwattr $C$DW$T$193, DW_AT_decl_column(0x08)

$C$DW$T$195	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$195, DW_AT_byte_size(0x04)
$C$DW$530	.dwtag  DW_TAG_member
	.dwattr $C$DW$530, DW_AT_type(*$C$DW$T$107)
	.dwattr $C$DW$530, DW_AT_name("CMR11")
	.dwattr $C$DW$530, DW_AT_TI_symbol_name("CMR11")
	.dwattr $C$DW$530, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$530, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$530, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$530, DW_AT_decl_line(0x1d1)
	.dwattr $C$DW$530, DW_AT_decl_column(0x15)
$C$DW$531	.dwtag  DW_TAG_member
	.dwattr $C$DW$531, DW_AT_type(*$C$DW$T$194)
	.dwattr $C$DW$531, DW_AT_name("CMR11_bit")
	.dwattr $C$DW$531, DW_AT_TI_symbol_name("CMR11_bit")
	.dwattr $C$DW$531, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$531, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$531, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$531, DW_AT_decl_line(0x1dc)
	.dwattr $C$DW$531, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$195

	.dwattr $C$DW$T$195, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$195, DW_AT_decl_line(0x1d0)
	.dwattr $C$DW$T$195, DW_AT_decl_column(0x08)

$C$DW$T$197	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$197, DW_AT_byte_size(0x04)
$C$DW$532	.dwtag  DW_TAG_member
	.dwattr $C$DW$532, DW_AT_type(*$C$DW$T$107)
	.dwattr $C$DW$532, DW_AT_name("CMR12")
	.dwattr $C$DW$532, DW_AT_TI_symbol_name("CMR12")
	.dwattr $C$DW$532, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$532, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$532, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$532, DW_AT_decl_line(0x1e2)
	.dwattr $C$DW$532, DW_AT_decl_column(0x15)
$C$DW$533	.dwtag  DW_TAG_member
	.dwattr $C$DW$533, DW_AT_type(*$C$DW$T$196)
	.dwattr $C$DW$533, DW_AT_name("CMR12_bit")
	.dwattr $C$DW$533, DW_AT_TI_symbol_name("CMR12_bit")
	.dwattr $C$DW$533, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$533, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$533, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$533, DW_AT_decl_line(0x1ed)
	.dwattr $C$DW$533, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$197

	.dwattr $C$DW$T$197, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$197, DW_AT_decl_line(0x1e1)
	.dwattr $C$DW$T$197, DW_AT_decl_column(0x08)

$C$DW$T$199	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$199, DW_AT_byte_size(0x04)
$C$DW$534	.dwtag  DW_TAG_member
	.dwattr $C$DW$534, DW_AT_type(*$C$DW$T$107)
	.dwattr $C$DW$534, DW_AT_name("CMR13")
	.dwattr $C$DW$534, DW_AT_TI_symbol_name("CMR13")
	.dwattr $C$DW$534, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$534, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$534, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$534, DW_AT_decl_line(0x1f3)
	.dwattr $C$DW$534, DW_AT_decl_column(0x15)
$C$DW$535	.dwtag  DW_TAG_member
	.dwattr $C$DW$535, DW_AT_type(*$C$DW$T$198)
	.dwattr $C$DW$535, DW_AT_name("CMR13_bit")
	.dwattr $C$DW$535, DW_AT_TI_symbol_name("CMR13_bit")
	.dwattr $C$DW$535, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$535, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$535, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$535, DW_AT_decl_line(0x1fe)
	.dwattr $C$DW$535, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$199

	.dwattr $C$DW$T$199, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$199, DW_AT_decl_line(0x1f2)
	.dwattr $C$DW$T$199, DW_AT_decl_column(0x08)

$C$DW$T$201	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$201, DW_AT_byte_size(0x04)
$C$DW$536	.dwtag  DW_TAG_member
	.dwattr $C$DW$536, DW_AT_type(*$C$DW$T$107)
	.dwattr $C$DW$536, DW_AT_name("CMR14")
	.dwattr $C$DW$536, DW_AT_TI_symbol_name("CMR14")
	.dwattr $C$DW$536, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$536, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$536, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$536, DW_AT_decl_line(0x204)
	.dwattr $C$DW$536, DW_AT_decl_column(0x15)
$C$DW$537	.dwtag  DW_TAG_member
	.dwattr $C$DW$537, DW_AT_type(*$C$DW$T$200)
	.dwattr $C$DW$537, DW_AT_name("CMR14_bit")
	.dwattr $C$DW$537, DW_AT_TI_symbol_name("CMR14_bit")
	.dwattr $C$DW$537, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$537, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$537, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$537, DW_AT_decl_line(0x20f)
	.dwattr $C$DW$537, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$201

	.dwattr $C$DW$T$201, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$201, DW_AT_decl_line(0x203)
	.dwattr $C$DW$T$201, DW_AT_decl_column(0x08)

$C$DW$T$203	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$203, DW_AT_byte_size(0x04)
$C$DW$538	.dwtag  DW_TAG_member
	.dwattr $C$DW$538, DW_AT_type(*$C$DW$T$107)
	.dwattr $C$DW$538, DW_AT_name("CMR15")
	.dwattr $C$DW$538, DW_AT_TI_symbol_name("CMR15")
	.dwattr $C$DW$538, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$538, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$538, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$538, DW_AT_decl_line(0x215)
	.dwattr $C$DW$538, DW_AT_decl_column(0x15)
$C$DW$539	.dwtag  DW_TAG_member
	.dwattr $C$DW$539, DW_AT_type(*$C$DW$T$202)
	.dwattr $C$DW$539, DW_AT_name("CMR15_bit")
	.dwattr $C$DW$539, DW_AT_TI_symbol_name("CMR15_bit")
	.dwattr $C$DW$539, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$539, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$539, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$539, DW_AT_decl_line(0x220)
	.dwattr $C$DW$539, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$203

	.dwattr $C$DW$T$203, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$203, DW_AT_decl_line(0x214)
	.dwattr $C$DW$T$203, DW_AT_decl_column(0x08)

$C$DW$T$205	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$205, DW_AT_byte_size(0x04)
$C$DW$540	.dwtag  DW_TAG_member
	.dwattr $C$DW$540, DW_AT_type(*$C$DW$T$107)
	.dwattr $C$DW$540, DW_AT_name("HMR0")
	.dwattr $C$DW$540, DW_AT_TI_symbol_name("HMR0")
	.dwattr $C$DW$540, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$540, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$540, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$540, DW_AT_decl_line(0x229)
	.dwattr $C$DW$540, DW_AT_decl_column(0x15)
$C$DW$541	.dwtag  DW_TAG_member
	.dwattr $C$DW$541, DW_AT_type(*$C$DW$T$204)
	.dwattr $C$DW$541, DW_AT_name("HMR0_bit")
	.dwattr $C$DW$541, DW_AT_TI_symbol_name("HMR0_bit")
	.dwattr $C$DW$541, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$541, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$541, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$541, DW_AT_decl_line(0x234)
	.dwattr $C$DW$541, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$205

	.dwattr $C$DW$T$205, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$205, DW_AT_decl_line(0x228)
	.dwattr $C$DW$T$205, DW_AT_decl_column(0x08)

$C$DW$T$207	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$207, DW_AT_byte_size(0x04)
$C$DW$542	.dwtag  DW_TAG_member
	.dwattr $C$DW$542, DW_AT_type(*$C$DW$T$107)
	.dwattr $C$DW$542, DW_AT_name("HMR1")
	.dwattr $C$DW$542, DW_AT_TI_symbol_name("HMR1")
	.dwattr $C$DW$542, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$542, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$542, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$542, DW_AT_decl_line(0x23a)
	.dwattr $C$DW$542, DW_AT_decl_column(0x15)
$C$DW$543	.dwtag  DW_TAG_member
	.dwattr $C$DW$543, DW_AT_type(*$C$DW$T$206)
	.dwattr $C$DW$543, DW_AT_name("HMR1_bit")
	.dwattr $C$DW$543, DW_AT_TI_symbol_name("HMR1_bit")
	.dwattr $C$DW$543, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$543, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$543, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$543, DW_AT_decl_line(0x245)
	.dwattr $C$DW$543, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$207

	.dwattr $C$DW$T$207, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$207, DW_AT_decl_line(0x239)
	.dwattr $C$DW$T$207, DW_AT_decl_column(0x08)

$C$DW$T$209	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$209, DW_AT_byte_size(0x04)
$C$DW$544	.dwtag  DW_TAG_member
	.dwattr $C$DW$544, DW_AT_type(*$C$DW$T$107)
	.dwattr $C$DW$544, DW_AT_name("HMR2")
	.dwattr $C$DW$544, DW_AT_TI_symbol_name("HMR2")
	.dwattr $C$DW$544, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$544, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$544, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$544, DW_AT_decl_line(0x24b)
	.dwattr $C$DW$544, DW_AT_decl_column(0x15)
$C$DW$545	.dwtag  DW_TAG_member
	.dwattr $C$DW$545, DW_AT_type(*$C$DW$T$208)
	.dwattr $C$DW$545, DW_AT_name("HMR2_bit")
	.dwattr $C$DW$545, DW_AT_TI_symbol_name("HMR2_bit")
	.dwattr $C$DW$545, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$545, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$545, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$545, DW_AT_decl_line(0x252)
	.dwattr $C$DW$545, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$209

	.dwattr $C$DW$T$209, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$209, DW_AT_decl_line(0x24a)
	.dwattr $C$DW$T$209, DW_AT_decl_column(0x08)

$C$DW$T$211	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$211, DW_AT_byte_size(0x04)
$C$DW$546	.dwtag  DW_TAG_member
	.dwattr $C$DW$546, DW_AT_type(*$C$DW$T$107)
	.dwattr $C$DW$546, DW_AT_name("HIPIR0")
	.dwattr $C$DW$546, DW_AT_TI_symbol_name("HIPIR0")
	.dwattr $C$DW$546, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$546, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$546, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$546, DW_AT_decl_line(0x25b)
	.dwattr $C$DW$546, DW_AT_decl_column(0x15)
$C$DW$547	.dwtag  DW_TAG_member
	.dwattr $C$DW$547, DW_AT_type(*$C$DW$T$210)
	.dwattr $C$DW$547, DW_AT_name("HIPIR0_bit")
	.dwattr $C$DW$547, DW_AT_TI_symbol_name("HIPIR0_bit")
	.dwattr $C$DW$547, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$547, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$547, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$547, DW_AT_decl_line(0x261)
	.dwattr $C$DW$547, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$211

	.dwattr $C$DW$T$211, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$211, DW_AT_decl_line(0x25a)
	.dwattr $C$DW$T$211, DW_AT_decl_column(0x08)

$C$DW$T$213	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$213, DW_AT_byte_size(0x04)
$C$DW$548	.dwtag  DW_TAG_member
	.dwattr $C$DW$548, DW_AT_type(*$C$DW$T$107)
	.dwattr $C$DW$548, DW_AT_name("HIPIR1")
	.dwattr $C$DW$548, DW_AT_TI_symbol_name("HIPIR1")
	.dwattr $C$DW$548, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$548, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$548, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$548, DW_AT_decl_line(0x267)
	.dwattr $C$DW$548, DW_AT_decl_column(0x15)
$C$DW$549	.dwtag  DW_TAG_member
	.dwattr $C$DW$549, DW_AT_type(*$C$DW$T$212)
	.dwattr $C$DW$549, DW_AT_name("HIPIR1_bit")
	.dwattr $C$DW$549, DW_AT_TI_symbol_name("HIPIR1_bit")
	.dwattr $C$DW$549, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$549, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$549, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$549, DW_AT_decl_line(0x26d)
	.dwattr $C$DW$549, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$213

	.dwattr $C$DW$T$213, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$213, DW_AT_decl_line(0x266)
	.dwattr $C$DW$T$213, DW_AT_decl_column(0x08)

$C$DW$T$215	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$215, DW_AT_byte_size(0x04)
$C$DW$550	.dwtag  DW_TAG_member
	.dwattr $C$DW$550, DW_AT_type(*$C$DW$T$107)
	.dwattr $C$DW$550, DW_AT_name("HIPIR2")
	.dwattr $C$DW$550, DW_AT_TI_symbol_name("HIPIR2")
	.dwattr $C$DW$550, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$550, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$550, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$550, DW_AT_decl_line(0x273)
	.dwattr $C$DW$550, DW_AT_decl_column(0x15)
$C$DW$551	.dwtag  DW_TAG_member
	.dwattr $C$DW$551, DW_AT_type(*$C$DW$T$214)
	.dwattr $C$DW$551, DW_AT_name("HIPIR2_bit")
	.dwattr $C$DW$551, DW_AT_TI_symbol_name("HIPIR2_bit")
	.dwattr $C$DW$551, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$551, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$551, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$551, DW_AT_decl_line(0x279)
	.dwattr $C$DW$551, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$215

	.dwattr $C$DW$T$215, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$215, DW_AT_decl_line(0x272)
	.dwattr $C$DW$T$215, DW_AT_decl_column(0x08)

$C$DW$T$217	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$217, DW_AT_byte_size(0x04)
$C$DW$552	.dwtag  DW_TAG_member
	.dwattr $C$DW$552, DW_AT_type(*$C$DW$T$107)
	.dwattr $C$DW$552, DW_AT_name("HIPIR3")
	.dwattr $C$DW$552, DW_AT_TI_symbol_name("HIPIR3")
	.dwattr $C$DW$552, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$552, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$552, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$552, DW_AT_decl_line(0x27f)
	.dwattr $C$DW$552, DW_AT_decl_column(0x15)
$C$DW$553	.dwtag  DW_TAG_member
	.dwattr $C$DW$553, DW_AT_type(*$C$DW$T$216)
	.dwattr $C$DW$553, DW_AT_name("HIPIR3_bit")
	.dwattr $C$DW$553, DW_AT_TI_symbol_name("HIPIR3_bit")
	.dwattr $C$DW$553, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$553, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$553, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$553, DW_AT_decl_line(0x285)
	.dwattr $C$DW$553, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$217

	.dwattr $C$DW$T$217, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$217, DW_AT_decl_line(0x27e)
	.dwattr $C$DW$T$217, DW_AT_decl_column(0x08)

$C$DW$T$219	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$219, DW_AT_byte_size(0x04)
$C$DW$554	.dwtag  DW_TAG_member
	.dwattr $C$DW$554, DW_AT_type(*$C$DW$T$107)
	.dwattr $C$DW$554, DW_AT_name("HIPIR4")
	.dwattr $C$DW$554, DW_AT_TI_symbol_name("HIPIR4")
	.dwattr $C$DW$554, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$554, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$554, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$554, DW_AT_decl_line(0x28b)
	.dwattr $C$DW$554, DW_AT_decl_column(0x15)
$C$DW$555	.dwtag  DW_TAG_member
	.dwattr $C$DW$555, DW_AT_type(*$C$DW$T$218)
	.dwattr $C$DW$555, DW_AT_name("HIPIR4_bit")
	.dwattr $C$DW$555, DW_AT_TI_symbol_name("HIPIR4_bit")
	.dwattr $C$DW$555, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$555, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$555, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$555, DW_AT_decl_line(0x291)
	.dwattr $C$DW$555, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$219

	.dwattr $C$DW$T$219, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$219, DW_AT_decl_line(0x28a)
	.dwattr $C$DW$T$219, DW_AT_decl_column(0x08)

$C$DW$T$221	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$221, DW_AT_byte_size(0x04)
$C$DW$556	.dwtag  DW_TAG_member
	.dwattr $C$DW$556, DW_AT_type(*$C$DW$T$107)
	.dwattr $C$DW$556, DW_AT_name("HIPIR5")
	.dwattr $C$DW$556, DW_AT_TI_symbol_name("HIPIR5")
	.dwattr $C$DW$556, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$556, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$556, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$556, DW_AT_decl_line(0x297)
	.dwattr $C$DW$556, DW_AT_decl_column(0x15)
$C$DW$557	.dwtag  DW_TAG_member
	.dwattr $C$DW$557, DW_AT_type(*$C$DW$T$220)
	.dwattr $C$DW$557, DW_AT_name("HIPIR5_bit")
	.dwattr $C$DW$557, DW_AT_TI_symbol_name("HIPIR5_bit")
	.dwattr $C$DW$557, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$557, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$557, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$557, DW_AT_decl_line(0x29d)
	.dwattr $C$DW$557, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$221

	.dwattr $C$DW$T$221, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$221, DW_AT_decl_line(0x296)
	.dwattr $C$DW$T$221, DW_AT_decl_column(0x08)

$C$DW$T$223	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$223, DW_AT_byte_size(0x04)
$C$DW$558	.dwtag  DW_TAG_member
	.dwattr $C$DW$558, DW_AT_type(*$C$DW$T$107)
	.dwattr $C$DW$558, DW_AT_name("HIPIR6")
	.dwattr $C$DW$558, DW_AT_TI_symbol_name("HIPIR6")
	.dwattr $C$DW$558, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$558, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$558, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$558, DW_AT_decl_line(0x2a3)
	.dwattr $C$DW$558, DW_AT_decl_column(0x15)
$C$DW$559	.dwtag  DW_TAG_member
	.dwattr $C$DW$559, DW_AT_type(*$C$DW$T$222)
	.dwattr $C$DW$559, DW_AT_name("HIPIR6_bit")
	.dwattr $C$DW$559, DW_AT_TI_symbol_name("HIPIR6_bit")
	.dwattr $C$DW$559, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$559, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$559, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$559, DW_AT_decl_line(0x2a9)
	.dwattr $C$DW$559, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$223

	.dwattr $C$DW$T$223, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$223, DW_AT_decl_line(0x2a2)
	.dwattr $C$DW$T$223, DW_AT_decl_column(0x08)

$C$DW$T$225	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$225, DW_AT_byte_size(0x04)
$C$DW$560	.dwtag  DW_TAG_member
	.dwattr $C$DW$560, DW_AT_type(*$C$DW$T$107)
	.dwattr $C$DW$560, DW_AT_name("HIPIR7")
	.dwattr $C$DW$560, DW_AT_TI_symbol_name("HIPIR7")
	.dwattr $C$DW$560, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$560, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$560, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$560, DW_AT_decl_line(0x2af)
	.dwattr $C$DW$560, DW_AT_decl_column(0x15)
$C$DW$561	.dwtag  DW_TAG_member
	.dwattr $C$DW$561, DW_AT_type(*$C$DW$T$224)
	.dwattr $C$DW$561, DW_AT_name("HIPIR7_bit")
	.dwattr $C$DW$561, DW_AT_TI_symbol_name("HIPIR7_bit")
	.dwattr $C$DW$561, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$561, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$561, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$561, DW_AT_decl_line(0x2b5)
	.dwattr $C$DW$561, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$225

	.dwattr $C$DW$T$225, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$225, DW_AT_decl_line(0x2ae)
	.dwattr $C$DW$T$225, DW_AT_decl_column(0x08)

$C$DW$T$227	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$227, DW_AT_byte_size(0x04)
$C$DW$562	.dwtag  DW_TAG_member
	.dwattr $C$DW$562, DW_AT_type(*$C$DW$T$107)
	.dwattr $C$DW$562, DW_AT_name("HIPIR8")
	.dwattr $C$DW$562, DW_AT_TI_symbol_name("HIPIR8")
	.dwattr $C$DW$562, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$562, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$562, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$562, DW_AT_decl_line(0x2bb)
	.dwattr $C$DW$562, DW_AT_decl_column(0x15)
$C$DW$563	.dwtag  DW_TAG_member
	.dwattr $C$DW$563, DW_AT_type(*$C$DW$T$226)
	.dwattr $C$DW$563, DW_AT_name("HIPIR8_bit")
	.dwattr $C$DW$563, DW_AT_TI_symbol_name("HIPIR8_bit")
	.dwattr $C$DW$563, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$563, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$563, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$563, DW_AT_decl_line(0x2c1)
	.dwattr $C$DW$563, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$227

	.dwattr $C$DW$T$227, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$227, DW_AT_decl_line(0x2ba)
	.dwattr $C$DW$T$227, DW_AT_decl_column(0x08)

$C$DW$T$229	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$229, DW_AT_byte_size(0x04)
$C$DW$564	.dwtag  DW_TAG_member
	.dwattr $C$DW$564, DW_AT_type(*$C$DW$T$107)
	.dwattr $C$DW$564, DW_AT_name("HIPIR9")
	.dwattr $C$DW$564, DW_AT_TI_symbol_name("HIPIR9")
	.dwattr $C$DW$564, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$564, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$564, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$564, DW_AT_decl_line(0x2c7)
	.dwattr $C$DW$564, DW_AT_decl_column(0x15)
$C$DW$565	.dwtag  DW_TAG_member
	.dwattr $C$DW$565, DW_AT_type(*$C$DW$T$228)
	.dwattr $C$DW$565, DW_AT_name("HIPIR9_bit")
	.dwattr $C$DW$565, DW_AT_TI_symbol_name("HIPIR9_bit")
	.dwattr $C$DW$565, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$565, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$565, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$565, DW_AT_decl_line(0x2cd)
	.dwattr $C$DW$565, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$229

	.dwattr $C$DW$T$229, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$229, DW_AT_decl_line(0x2c6)
	.dwattr $C$DW$T$229, DW_AT_decl_column(0x08)

$C$DW$T$231	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$231, DW_AT_byte_size(0x04)
$C$DW$566	.dwtag  DW_TAG_member
	.dwattr $C$DW$566, DW_AT_type(*$C$DW$T$107)
	.dwattr $C$DW$566, DW_AT_name("SIPR0")
	.dwattr $C$DW$566, DW_AT_TI_symbol_name("SIPR0")
	.dwattr $C$DW$566, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$566, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$566, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$566, DW_AT_decl_line(0x2d6)
	.dwattr $C$DW$566, DW_AT_decl_column(0x15)
$C$DW$567	.dwtag  DW_TAG_member
	.dwattr $C$DW$567, DW_AT_type(*$C$DW$T$230)
	.dwattr $C$DW$567, DW_AT_name("SIPR0_bit")
	.dwattr $C$DW$567, DW_AT_TI_symbol_name("SIPR0_bit")
	.dwattr $C$DW$567, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$567, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$567, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$567, DW_AT_decl_line(0x2da)
	.dwattr $C$DW$567, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$231

	.dwattr $C$DW$T$231, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$231, DW_AT_decl_line(0x2d5)
	.dwattr $C$DW$T$231, DW_AT_decl_column(0x08)

$C$DW$T$233	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$233, DW_AT_byte_size(0x04)
$C$DW$568	.dwtag  DW_TAG_member
	.dwattr $C$DW$568, DW_AT_type(*$C$DW$T$107)
	.dwattr $C$DW$568, DW_AT_name("SIPR1")
	.dwattr $C$DW$568, DW_AT_TI_symbol_name("SIPR1")
	.dwattr $C$DW$568, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$568, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$568, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$568, DW_AT_decl_line(0x2e0)
	.dwattr $C$DW$568, DW_AT_decl_column(0x15)
$C$DW$569	.dwtag  DW_TAG_member
	.dwattr $C$DW$569, DW_AT_type(*$C$DW$T$232)
	.dwattr $C$DW$569, DW_AT_name("SIPR1_bit")
	.dwattr $C$DW$569, DW_AT_TI_symbol_name("SIPR1_bit")
	.dwattr $C$DW$569, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$569, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$569, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$569, DW_AT_decl_line(0x2e4)
	.dwattr $C$DW$569, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$233

	.dwattr $C$DW$T$233, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$233, DW_AT_decl_line(0x2df)
	.dwattr $C$DW$T$233, DW_AT_decl_column(0x08)

$C$DW$T$235	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$235, DW_AT_byte_size(0x04)
$C$DW$570	.dwtag  DW_TAG_member
	.dwattr $C$DW$570, DW_AT_type(*$C$DW$T$107)
	.dwattr $C$DW$570, DW_AT_name("SITR0")
	.dwattr $C$DW$570, DW_AT_TI_symbol_name("SITR0")
	.dwattr $C$DW$570, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$570, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$570, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$570, DW_AT_decl_line(0x2ed)
	.dwattr $C$DW$570, DW_AT_decl_column(0x15)
$C$DW$571	.dwtag  DW_TAG_member
	.dwattr $C$DW$571, DW_AT_type(*$C$DW$T$234)
	.dwattr $C$DW$571, DW_AT_name("SITR0_bit")
	.dwattr $C$DW$571, DW_AT_TI_symbol_name("SITR0_bit")
	.dwattr $C$DW$571, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$571, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$571, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$571, DW_AT_decl_line(0x2f1)
	.dwattr $C$DW$571, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$235

	.dwattr $C$DW$T$235, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$235, DW_AT_decl_line(0x2ec)
	.dwattr $C$DW$T$235, DW_AT_decl_column(0x08)

$C$DW$T$237	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$237, DW_AT_byte_size(0x04)
$C$DW$572	.dwtag  DW_TAG_member
	.dwattr $C$DW$572, DW_AT_type(*$C$DW$T$107)
	.dwattr $C$DW$572, DW_AT_name("SITR1")
	.dwattr $C$DW$572, DW_AT_TI_symbol_name("SITR1")
	.dwattr $C$DW$572, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$572, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$572, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$572, DW_AT_decl_line(0x2f7)
	.dwattr $C$DW$572, DW_AT_decl_column(0x15)
$C$DW$573	.dwtag  DW_TAG_member
	.dwattr $C$DW$573, DW_AT_type(*$C$DW$T$236)
	.dwattr $C$DW$573, DW_AT_name("SITR1_bit")
	.dwattr $C$DW$573, DW_AT_TI_symbol_name("SITR1_bit")
	.dwattr $C$DW$573, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$573, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$573, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$573, DW_AT_decl_line(0x2fb)
	.dwattr $C$DW$573, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$237

	.dwattr $C$DW$T$237, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$237, DW_AT_decl_line(0x2f6)
	.dwattr $C$DW$T$237, DW_AT_decl_column(0x08)

$C$DW$T$239	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$239, DW_AT_byte_size(0x04)
$C$DW$574	.dwtag  DW_TAG_member
	.dwattr $C$DW$574, DW_AT_type(*$C$DW$T$107)
	.dwattr $C$DW$574, DW_AT_name("HINLR0")
	.dwattr $C$DW$574, DW_AT_TI_symbol_name("HINLR0")
	.dwattr $C$DW$574, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$574, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$574, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$574, DW_AT_decl_line(0x304)
	.dwattr $C$DW$574, DW_AT_decl_column(0x15)
$C$DW$575	.dwtag  DW_TAG_member
	.dwattr $C$DW$575, DW_AT_type(*$C$DW$T$238)
	.dwattr $C$DW$575, DW_AT_name("HINLR0_bit")
	.dwattr $C$DW$575, DW_AT_TI_symbol_name("HINLR0_bit")
	.dwattr $C$DW$575, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$575, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$575, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$575, DW_AT_decl_line(0x30a)
	.dwattr $C$DW$575, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$239

	.dwattr $C$DW$T$239, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$239, DW_AT_decl_line(0x303)
	.dwattr $C$DW$T$239, DW_AT_decl_column(0x08)

$C$DW$T$241	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$241, DW_AT_byte_size(0x04)
$C$DW$576	.dwtag  DW_TAG_member
	.dwattr $C$DW$576, DW_AT_type(*$C$DW$T$107)
	.dwattr $C$DW$576, DW_AT_name("HINLR1")
	.dwattr $C$DW$576, DW_AT_TI_symbol_name("HINLR1")
	.dwattr $C$DW$576, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$576, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$576, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$576, DW_AT_decl_line(0x310)
	.dwattr $C$DW$576, DW_AT_decl_column(0x15)
$C$DW$577	.dwtag  DW_TAG_member
	.dwattr $C$DW$577, DW_AT_type(*$C$DW$T$240)
	.dwattr $C$DW$577, DW_AT_name("HINLR1_bit")
	.dwattr $C$DW$577, DW_AT_TI_symbol_name("HINLR1_bit")
	.dwattr $C$DW$577, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$577, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$577, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$577, DW_AT_decl_line(0x316)
	.dwattr $C$DW$577, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$241

	.dwattr $C$DW$T$241, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$241, DW_AT_decl_line(0x30f)
	.dwattr $C$DW$T$241, DW_AT_decl_column(0x08)

$C$DW$T$243	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$243, DW_AT_byte_size(0x04)
$C$DW$578	.dwtag  DW_TAG_member
	.dwattr $C$DW$578, DW_AT_type(*$C$DW$T$107)
	.dwattr $C$DW$578, DW_AT_name("HINLR2")
	.dwattr $C$DW$578, DW_AT_TI_symbol_name("HINLR2")
	.dwattr $C$DW$578, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$578, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$578, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$578, DW_AT_decl_line(0x31c)
	.dwattr $C$DW$578, DW_AT_decl_column(0x15)
$C$DW$579	.dwtag  DW_TAG_member
	.dwattr $C$DW$579, DW_AT_type(*$C$DW$T$242)
	.dwattr $C$DW$579, DW_AT_name("HINLR2_bit")
	.dwattr $C$DW$579, DW_AT_TI_symbol_name("HINLR2_bit")
	.dwattr $C$DW$579, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$579, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$579, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$579, DW_AT_decl_line(0x322)
	.dwattr $C$DW$579, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$243

	.dwattr $C$DW$T$243, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$243, DW_AT_decl_line(0x31b)
	.dwattr $C$DW$T$243, DW_AT_decl_column(0x08)

$C$DW$T$245	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$245, DW_AT_byte_size(0x04)
$C$DW$580	.dwtag  DW_TAG_member
	.dwattr $C$DW$580, DW_AT_type(*$C$DW$T$107)
	.dwattr $C$DW$580, DW_AT_name("HINLR3")
	.dwattr $C$DW$580, DW_AT_TI_symbol_name("HINLR3")
	.dwattr $C$DW$580, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$580, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$580, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$580, DW_AT_decl_line(0x328)
	.dwattr $C$DW$580, DW_AT_decl_column(0x15)
$C$DW$581	.dwtag  DW_TAG_member
	.dwattr $C$DW$581, DW_AT_type(*$C$DW$T$244)
	.dwattr $C$DW$581, DW_AT_name("HINLR3_bit")
	.dwattr $C$DW$581, DW_AT_TI_symbol_name("HINLR3_bit")
	.dwattr $C$DW$581, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$581, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$581, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$581, DW_AT_decl_line(0x32e)
	.dwattr $C$DW$581, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$245

	.dwattr $C$DW$T$245, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$245, DW_AT_decl_line(0x327)
	.dwattr $C$DW$T$245, DW_AT_decl_column(0x08)

$C$DW$T$247	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$247, DW_AT_byte_size(0x04)
$C$DW$582	.dwtag  DW_TAG_member
	.dwattr $C$DW$582, DW_AT_type(*$C$DW$T$107)
	.dwattr $C$DW$582, DW_AT_name("HINLR4")
	.dwattr $C$DW$582, DW_AT_TI_symbol_name("HINLR4")
	.dwattr $C$DW$582, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$582, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$582, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$582, DW_AT_decl_line(0x334)
	.dwattr $C$DW$582, DW_AT_decl_column(0x15)
$C$DW$583	.dwtag  DW_TAG_member
	.dwattr $C$DW$583, DW_AT_type(*$C$DW$T$246)
	.dwattr $C$DW$583, DW_AT_name("HINLR4_bit")
	.dwattr $C$DW$583, DW_AT_TI_symbol_name("HINLR4_bit")
	.dwattr $C$DW$583, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$583, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$583, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$583, DW_AT_decl_line(0x33a)
	.dwattr $C$DW$583, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$247

	.dwattr $C$DW$T$247, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$247, DW_AT_decl_line(0x333)
	.dwattr $C$DW$T$247, DW_AT_decl_column(0x08)

$C$DW$T$249	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$249, DW_AT_byte_size(0x04)
$C$DW$584	.dwtag  DW_TAG_member
	.dwattr $C$DW$584, DW_AT_type(*$C$DW$T$107)
	.dwattr $C$DW$584, DW_AT_name("HINLR5")
	.dwattr $C$DW$584, DW_AT_TI_symbol_name("HINLR5")
	.dwattr $C$DW$584, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$584, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$584, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$584, DW_AT_decl_line(0x340)
	.dwattr $C$DW$584, DW_AT_decl_column(0x15)
$C$DW$585	.dwtag  DW_TAG_member
	.dwattr $C$DW$585, DW_AT_type(*$C$DW$T$248)
	.dwattr $C$DW$585, DW_AT_name("HINLR5_bit")
	.dwattr $C$DW$585, DW_AT_TI_symbol_name("HINLR5_bit")
	.dwattr $C$DW$585, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$585, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$585, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$585, DW_AT_decl_line(0x346)
	.dwattr $C$DW$585, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$249

	.dwattr $C$DW$T$249, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$249, DW_AT_decl_line(0x33f)
	.dwattr $C$DW$T$249, DW_AT_decl_column(0x08)

$C$DW$T$251	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$251, DW_AT_byte_size(0x04)
$C$DW$586	.dwtag  DW_TAG_member
	.dwattr $C$DW$586, DW_AT_type(*$C$DW$T$107)
	.dwattr $C$DW$586, DW_AT_name("HINLR6")
	.dwattr $C$DW$586, DW_AT_TI_symbol_name("HINLR6")
	.dwattr $C$DW$586, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$586, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$586, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$586, DW_AT_decl_line(0x34c)
	.dwattr $C$DW$586, DW_AT_decl_column(0x15)
$C$DW$587	.dwtag  DW_TAG_member
	.dwattr $C$DW$587, DW_AT_type(*$C$DW$T$250)
	.dwattr $C$DW$587, DW_AT_name("HINLR6_bit")
	.dwattr $C$DW$587, DW_AT_TI_symbol_name("HINLR6_bit")
	.dwattr $C$DW$587, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$587, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$587, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$587, DW_AT_decl_line(0x352)
	.dwattr $C$DW$587, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$251

	.dwattr $C$DW$T$251, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$251, DW_AT_decl_line(0x34b)
	.dwattr $C$DW$T$251, DW_AT_decl_column(0x08)

$C$DW$T$253	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$253, DW_AT_byte_size(0x04)
$C$DW$588	.dwtag  DW_TAG_member
	.dwattr $C$DW$588, DW_AT_type(*$C$DW$T$107)
	.dwattr $C$DW$588, DW_AT_name("HINLR7")
	.dwattr $C$DW$588, DW_AT_TI_symbol_name("HINLR7")
	.dwattr $C$DW$588, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$588, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$588, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$588, DW_AT_decl_line(0x358)
	.dwattr $C$DW$588, DW_AT_decl_column(0x15)
$C$DW$589	.dwtag  DW_TAG_member
	.dwattr $C$DW$589, DW_AT_type(*$C$DW$T$252)
	.dwattr $C$DW$589, DW_AT_name("HINLR7_bit")
	.dwattr $C$DW$589, DW_AT_TI_symbol_name("HINLR7_bit")
	.dwattr $C$DW$589, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$589, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$589, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$589, DW_AT_decl_line(0x35e)
	.dwattr $C$DW$589, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$253

	.dwattr $C$DW$T$253, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$253, DW_AT_decl_line(0x357)
	.dwattr $C$DW$T$253, DW_AT_decl_column(0x08)

$C$DW$T$255	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$255, DW_AT_byte_size(0x04)
$C$DW$590	.dwtag  DW_TAG_member
	.dwattr $C$DW$590, DW_AT_type(*$C$DW$T$107)
	.dwattr $C$DW$590, DW_AT_name("HINLR8")
	.dwattr $C$DW$590, DW_AT_TI_symbol_name("HINLR8")
	.dwattr $C$DW$590, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$590, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$590, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$590, DW_AT_decl_line(0x364)
	.dwattr $C$DW$590, DW_AT_decl_column(0x15)
$C$DW$591	.dwtag  DW_TAG_member
	.dwattr $C$DW$591, DW_AT_type(*$C$DW$T$254)
	.dwattr $C$DW$591, DW_AT_name("HINLR8_bit")
	.dwattr $C$DW$591, DW_AT_TI_symbol_name("HINLR8_bit")
	.dwattr $C$DW$591, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$591, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$591, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$591, DW_AT_decl_line(0x36a)
	.dwattr $C$DW$591, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$255

	.dwattr $C$DW$T$255, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$255, DW_AT_decl_line(0x363)
	.dwattr $C$DW$T$255, DW_AT_decl_column(0x08)

$C$DW$T$257	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$257, DW_AT_byte_size(0x04)
$C$DW$592	.dwtag  DW_TAG_member
	.dwattr $C$DW$592, DW_AT_type(*$C$DW$T$107)
	.dwattr $C$DW$592, DW_AT_name("HINLR9")
	.dwattr $C$DW$592, DW_AT_TI_symbol_name("HINLR9")
	.dwattr $C$DW$592, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$592, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$592, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$592, DW_AT_decl_line(0x370)
	.dwattr $C$DW$592, DW_AT_decl_column(0x15)
$C$DW$593	.dwtag  DW_TAG_member
	.dwattr $C$DW$593, DW_AT_type(*$C$DW$T$256)
	.dwattr $C$DW$593, DW_AT_name("HINLR9_bit")
	.dwattr $C$DW$593, DW_AT_TI_symbol_name("HINLR9_bit")
	.dwattr $C$DW$593, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$593, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$593, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$593, DW_AT_decl_line(0x376)
	.dwattr $C$DW$593, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$257

	.dwattr $C$DW$T$257, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$257, DW_AT_decl_line(0x36f)
	.dwattr $C$DW$T$257, DW_AT_decl_column(0x08)

$C$DW$T$259	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$259, DW_AT_byte_size(0x04)
$C$DW$594	.dwtag  DW_TAG_member
	.dwattr $C$DW$594, DW_AT_type(*$C$DW$T$107)
	.dwattr $C$DW$594, DW_AT_name("HIER")
	.dwattr $C$DW$594, DW_AT_TI_symbol_name("HIER")
	.dwattr $C$DW$594, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$594, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$594, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$594, DW_AT_decl_line(0x37f)
	.dwattr $C$DW$594, DW_AT_decl_column(0x15)
$C$DW$595	.dwtag  DW_TAG_member
	.dwattr $C$DW$595, DW_AT_type(*$C$DW$T$258)
	.dwattr $C$DW$595, DW_AT_name("HIER_bit")
	.dwattr $C$DW$595, DW_AT_TI_symbol_name("HIER_bit")
	.dwattr $C$DW$595, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$595, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$595, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$595, DW_AT_decl_line(0x384)
	.dwattr $C$DW$595, DW_AT_decl_column(0x05)
	.dwendtag $C$DW$T$259

	.dwattr $C$DW$T$259, DW_AT_decl_file("include/am335x/pru_intc.h")
	.dwattr $C$DW$T$259, DW_AT_decl_line(0x37e)
	.dwattr $C$DW$T$259, DW_AT_decl_column(0x08)
$C$DW$T$2	.dwtag  DW_TAG_unspecified_type
	.dwattr $C$DW$T$2, DW_AT_name("void")
$C$DW$T$3	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$3, DW_AT_type(*$C$DW$T$2)
	.dwattr $C$DW$T$3, DW_AT_address_class(0x20)
$C$DW$T$278	.dwtag  DW_TAG_const_type
	.dwattr $C$DW$T$278, DW_AT_type(*$C$DW$T$2)
$C$DW$T$279	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$279, DW_AT_type(*$C$DW$T$278)
	.dwattr $C$DW$T$279, DW_AT_address_class(0x20)
$C$DW$T$4	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$4, DW_AT_encoding(DW_ATE_boolean)
	.dwattr $C$DW$T$4, DW_AT_name("bool")
	.dwattr $C$DW$T$4, DW_AT_byte_size(0x01)
$C$DW$T$5	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$5, DW_AT_encoding(DW_ATE_signed_char)
	.dwattr $C$DW$T$5, DW_AT_name("signed char")
	.dwattr $C$DW$T$5, DW_AT_byte_size(0x01)
$C$DW$T$6	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$6, DW_AT_encoding(DW_ATE_unsigned_char)
	.dwattr $C$DW$T$6, DW_AT_name("unsigned char")
	.dwattr $C$DW$T$6, DW_AT_byte_size(0x01)
$C$DW$T$7	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$7, DW_AT_encoding(DW_ATE_signed_char)
	.dwattr $C$DW$T$7, DW_AT_name("wchar_t")
	.dwattr $C$DW$T$7, DW_AT_byte_size(0x04)
$C$DW$T$8	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$8, DW_AT_encoding(DW_ATE_signed)
	.dwattr $C$DW$T$8, DW_AT_name("short")
	.dwattr $C$DW$T$8, DW_AT_byte_size(0x02)
$C$DW$T$9	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$9, DW_AT_encoding(DW_ATE_unsigned)
	.dwattr $C$DW$T$9, DW_AT_name("unsigned short")
	.dwattr $C$DW$T$9, DW_AT_byte_size(0x02)
$C$DW$T$10	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$10, DW_AT_encoding(DW_ATE_signed)
	.dwattr $C$DW$T$10, DW_AT_name("int")
	.dwattr $C$DW$T$10, DW_AT_byte_size(0x04)
$C$DW$T$289	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$289, DW_AT_type(*$C$DW$T$10)
$C$DW$T$290	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$290, DW_AT_type(*$C$DW$T$289)
	.dwattr $C$DW$T$290, DW_AT_address_class(0x20)
$C$DW$T$11	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$11, DW_AT_encoding(DW_ATE_unsigned)
	.dwattr $C$DW$T$11, DW_AT_name("unsigned int")
	.dwattr $C$DW$T$11, DW_AT_byte_size(0x04)
$C$DW$T$281	.dwtag  DW_TAG_typedef, DW_AT_name("size_t")
	.dwattr $C$DW$T$281, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$T$281, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$281, DW_AT_decl_file("/usr/share/ti/cgt-pru/include/stdlib.h")
	.dwattr $C$DW$T$281, DW_AT_decl_line(0x57)
	.dwattr $C$DW$T$281, DW_AT_decl_column(0x19)
$C$DW$T$32	.dwtag  DW_TAG_typedef, DW_AT_name("uint32_t")
	.dwattr $C$DW$T$32, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$T$32, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$32, DW_AT_decl_file("/usr/share/ti/cgt-pru/include/stdint.h")
	.dwattr $C$DW$T$32, DW_AT_decl_line(0x2f)
	.dwattr $C$DW$T$32, DW_AT_decl_column(0x1c)

$C$DW$T$33	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$33, DW_AT_type(*$C$DW$T$32)
	.dwattr $C$DW$T$33, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$33, DW_AT_byte_size(0x04)
$C$DW$596	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$596, DW_AT_upper_bound(0x00)
	.dwendtag $C$DW$T$33


$C$DW$T$34	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$34, DW_AT_type(*$C$DW$T$32)
	.dwattr $C$DW$T$34, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$34, DW_AT_byte_size(0x08)
$C$DW$597	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$597, DW_AT_upper_bound(0x01)
	.dwendtag $C$DW$T$34


$C$DW$T$99	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$99, DW_AT_type(*$C$DW$T$32)
	.dwattr $C$DW$T$99, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$99, DW_AT_byte_size(0x44)
$C$DW$598	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$598, DW_AT_upper_bound(0x10)
	.dwendtag $C$DW$T$99


$C$DW$T$100	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$100, DW_AT_type(*$C$DW$T$32)
	.dwattr $C$DW$T$100, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$100, DW_AT_byte_size(0x17c)
$C$DW$599	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$599, DW_AT_upper_bound(0x5e)
	.dwendtag $C$DW$T$100


$C$DW$T$101	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$101, DW_AT_type(*$C$DW$T$32)
	.dwattr $C$DW$T$101, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$101, DW_AT_byte_size(0x78)
$C$DW$600	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$600, DW_AT_upper_bound(0x1d)
	.dwendtag $C$DW$T$101


$C$DW$T$102	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$102, DW_AT_type(*$C$DW$T$32)
	.dwattr $C$DW$T$102, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$102, DW_AT_byte_size(0x3c0)
$C$DW$601	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$601, DW_AT_upper_bound(0xef)
	.dwendtag $C$DW$T$102


$C$DW$T$103	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$103, DW_AT_type(*$C$DW$T$32)
	.dwattr $C$DW$T$103, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$103, DW_AT_byte_size(0xf4)
$C$DW$602	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$602, DW_AT_upper_bound(0x3c)
	.dwendtag $C$DW$T$103


$C$DW$T$104	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$104, DW_AT_type(*$C$DW$T$32)
	.dwattr $C$DW$T$104, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$104, DW_AT_byte_size(0x3d8)
$C$DW$603	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$603, DW_AT_upper_bound(0xf5)
	.dwendtag $C$DW$T$104


$C$DW$T$105	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$105, DW_AT_type(*$C$DW$T$32)
	.dwattr $C$DW$T$105, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$105, DW_AT_byte_size(0x378)
$C$DW$604	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$604, DW_AT_upper_bound(0xdd)
	.dwendtag $C$DW$T$105

$C$DW$T$107	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$107, DW_AT_type(*$C$DW$T$32)
$C$DW$T$12	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$12, DW_AT_encoding(DW_ATE_signed)
	.dwattr $C$DW$T$12, DW_AT_name("long")
	.dwattr $C$DW$T$12, DW_AT_byte_size(0x04)
$C$DW$T$13	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$13, DW_AT_encoding(DW_ATE_unsigned)
	.dwattr $C$DW$T$13, DW_AT_name("unsigned long")
	.dwattr $C$DW$T$13, DW_AT_byte_size(0x04)
$C$DW$T$14	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$14, DW_AT_encoding(DW_ATE_signed)
	.dwattr $C$DW$T$14, DW_AT_name("long long")
	.dwattr $C$DW$T$14, DW_AT_byte_size(0x08)
$C$DW$T$15	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$15, DW_AT_encoding(DW_ATE_unsigned)
	.dwattr $C$DW$T$15, DW_AT_name("unsigned long long")
	.dwattr $C$DW$T$15, DW_AT_byte_size(0x08)
$C$DW$T$16	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$16, DW_AT_encoding(DW_ATE_float)
	.dwattr $C$DW$T$16, DW_AT_name("float")
	.dwattr $C$DW$T$16, DW_AT_byte_size(0x04)
$C$DW$T$17	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$17, DW_AT_encoding(DW_ATE_float)
	.dwattr $C$DW$T$17, DW_AT_name("double")
	.dwattr $C$DW$T$17, DW_AT_byte_size(0x08)
$C$DW$T$18	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$18, DW_AT_encoding(DW_ATE_float)
	.dwattr $C$DW$T$18, DW_AT_name("long double")
	.dwattr $C$DW$T$18, DW_AT_byte_size(0x08)
$C$DW$T$295	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$295, DW_AT_type(*$C$DW$T$6)
	.dwattr $C$DW$T$295, DW_AT_address_class(0x20)

$C$DW$T$260	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$260, DW_AT_name("my_resource_table")
	.dwattr $C$DW$T$260, DW_AT_byte_size(0x14)
$C$DW$605	.dwtag  DW_TAG_member
	.dwattr $C$DW$605, DW_AT_type(*$C$DW$T$261)
	.dwattr $C$DW$605, DW_AT_name("base")
	.dwattr $C$DW$605, DW_AT_TI_symbol_name("base")
	.dwattr $C$DW$605, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$605, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$605, DW_AT_decl_file("resource_table_empty.h")
	.dwattr $C$DW$605, DW_AT_decl_line(0x39)
	.dwattr $C$DW$605, DW_AT_decl_column(0x18)
$C$DW$606	.dwtag  DW_TAG_member
	.dwattr $C$DW$606, DW_AT_type(*$C$DW$T$33)
	.dwattr $C$DW$606, DW_AT_name("offset")
	.dwattr $C$DW$606, DW_AT_TI_symbol_name("offset")
	.dwattr $C$DW$606, DW_AT_data_member_location[DW_OP_plus_uconst 0x10]
	.dwattr $C$DW$606, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$606, DW_AT_decl_file("resource_table_empty.h")
	.dwattr $C$DW$606, DW_AT_decl_line(0x3b)
	.dwattr $C$DW$606, DW_AT_decl_column(0x0b)
	.dwendtag $C$DW$T$260

	.dwattr $C$DW$T$260, DW_AT_decl_file("resource_table_empty.h")
	.dwattr $C$DW$T$260, DW_AT_decl_line(0x38)
	.dwattr $C$DW$T$260, DW_AT_decl_column(0x08)

$C$DW$T$261	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$261, DW_AT_name("resource_table")
	.dwattr $C$DW$T$261, DW_AT_byte_size(0x10)
$C$DW$607	.dwtag  DW_TAG_member
	.dwattr $C$DW$607, DW_AT_type(*$C$DW$T$32)
	.dwattr $C$DW$607, DW_AT_name("ver")
	.dwattr $C$DW$607, DW_AT_TI_symbol_name("ver")
	.dwattr $C$DW$607, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$607, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$607, DW_AT_decl_file("include/rsc_types.h")
	.dwattr $C$DW$607, DW_AT_decl_line(0x57)
	.dwattr $C$DW$607, DW_AT_decl_column(0x0b)
$C$DW$608	.dwtag  DW_TAG_member
	.dwattr $C$DW$608, DW_AT_type(*$C$DW$T$32)
	.dwattr $C$DW$608, DW_AT_name("num")
	.dwattr $C$DW$608, DW_AT_TI_symbol_name("num")
	.dwattr $C$DW$608, DW_AT_data_member_location[DW_OP_plus_uconst 0x4]
	.dwattr $C$DW$608, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$608, DW_AT_decl_file("include/rsc_types.h")
	.dwattr $C$DW$608, DW_AT_decl_line(0x58)
	.dwattr $C$DW$608, DW_AT_decl_column(0x0b)
$C$DW$609	.dwtag  DW_TAG_member
	.dwattr $C$DW$609, DW_AT_type(*$C$DW$T$34)
	.dwattr $C$DW$609, DW_AT_name("reserved")
	.dwattr $C$DW$609, DW_AT_TI_symbol_name("reserved")
	.dwattr $C$DW$609, DW_AT_data_member_location[DW_OP_plus_uconst 0x8]
	.dwattr $C$DW$609, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$609, DW_AT_decl_file("include/rsc_types.h")
	.dwattr $C$DW$609, DW_AT_decl_line(0x59)
	.dwattr $C$DW$609, DW_AT_decl_column(0x0b)
	.dwendtag $C$DW$T$261

	.dwattr $C$DW$T$261, DW_AT_decl_file("include/rsc_types.h")
	.dwattr $C$DW$T$261, DW_AT_decl_line(0x56)
	.dwattr $C$DW$T$261, DW_AT_decl_column(0x08)
	.dwattr $C$DW$CU, DW_AT_language(DW_LANG_C)

;***************************************************************
;* DWARF CIE ENTRIES                                           *
;***************************************************************

$C$DW$CIE	.dwcie 14
	.dwcfi	cfa_register, 8
	.dwcfi	cfa_offset, 0
	.dwcfi	undefined, 0
	.dwcfi	undefined, 1
	.dwcfi	undefined, 2
	.dwcfi	undefined, 3
	.dwcfi	undefined, 4
	.dwcfi	undefined, 5
	.dwcfi	undefined, 6
	.dwcfi	undefined, 7
	.dwcfi	same_value, 8
	.dwcfi	same_value, 9
	.dwcfi	same_value, 10
	.dwcfi	same_value, 11
	.dwcfi	undefined, 12
	.dwcfi	undefined, 13
	.dwcfi	undefined, 14
	.dwcfi	undefined, 15
	.dwcfi	same_value, 16
	.dwcfi	same_value, 17
	.dwcfi	same_value, 18
	.dwcfi	same_value, 19
	.dwcfi	same_value, 20
	.dwcfi	same_value, 21
	.dwcfi	same_value, 22
	.dwcfi	same_value, 23
	.dwcfi	same_value, 24
	.dwcfi	same_value, 25
	.dwcfi	same_value, 26
	.dwcfi	same_value, 27
	.dwcfi	same_value, 28
	.dwcfi	same_value, 29
	.dwcfi	same_value, 30
	.dwcfi	same_value, 31
	.dwcfi	same_value, 32
	.dwcfi	same_value, 33
	.dwcfi	same_value, 34
	.dwcfi	same_value, 35
	.dwcfi	same_value, 36
	.dwcfi	same_value, 37
	.dwcfi	same_value, 38
	.dwcfi	same_value, 39
	.dwcfi	same_value, 40
	.dwcfi	same_value, 41
	.dwcfi	same_value, 42
	.dwcfi	same_value, 43
	.dwcfi	same_value, 44
	.dwcfi	same_value, 45
	.dwcfi	same_value, 46
	.dwcfi	same_value, 47
	.dwcfi	same_value, 48
	.dwcfi	same_value, 49
	.dwcfi	same_value, 50
	.dwcfi	same_value, 51
	.dwcfi	same_value, 52
	.dwcfi	same_value, 53
	.dwcfi	same_value, 54
	.dwcfi	same_value, 55
	.dwcfi	undefined, 56
	.dwcfi	undefined, 57
	.dwcfi	undefined, 58
	.dwcfi	undefined, 59
	.dwcfi	undefined, 60
	.dwcfi	undefined, 61
	.dwcfi	undefined, 62
	.dwcfi	undefined, 63
	.dwcfi	undefined, 64
	.dwcfi	undefined, 65
	.dwcfi	undefined, 66
	.dwcfi	undefined, 67
	.dwcfi	undefined, 68
	.dwcfi	undefined, 69
	.dwcfi	undefined, 70
	.dwcfi	undefined, 71
	.dwcfi	undefined, 72
	.dwcfi	undefined, 73
	.dwcfi	undefined, 74
	.dwcfi	undefined, 75
	.dwcfi	undefined, 76
	.dwcfi	undefined, 77
	.dwcfi	undefined, 78
	.dwcfi	undefined, 79
	.dwcfi	undefined, 80
	.dwcfi	undefined, 81
	.dwcfi	undefined, 82
	.dwcfi	undefined, 83
	.dwcfi	undefined, 84
	.dwcfi	undefined, 85
	.dwcfi	undefined, 86
	.dwcfi	undefined, 87
	.dwcfi	undefined, 88
	.dwcfi	undefined, 89
	.dwcfi	undefined, 90
	.dwcfi	undefined, 91
	.dwcfi	undefined, 92
	.dwcfi	undefined, 93
	.dwcfi	undefined, 94
	.dwcfi	undefined, 95
	.dwcfi	undefined, 96
	.dwcfi	undefined, 97
	.dwcfi	undefined, 98
	.dwcfi	undefined, 99
	.dwcfi	undefined, 100
	.dwcfi	undefined, 101
	.dwcfi	undefined, 102
	.dwcfi	undefined, 103
	.dwcfi	undefined, 104
	.dwcfi	undefined, 105
	.dwcfi	undefined, 106
	.dwcfi	undefined, 107
	.dwcfi	undefined, 108
	.dwcfi	undefined, 109
	.dwcfi	undefined, 110
	.dwcfi	undefined, 111
	.dwcfi	undefined, 112
	.dwcfi	undefined, 113
	.dwcfi	undefined, 114
	.dwcfi	undefined, 115
	.dwcfi	undefined, 116
	.dwcfi	undefined, 117
	.dwcfi	undefined, 118
	.dwcfi	undefined, 119
	.dwcfi	undefined, 120
	.dwcfi	undefined, 121
	.dwcfi	undefined, 122
	.dwcfi	undefined, 123
	.dwcfi	undefined, 124
	.dwcfi	undefined, 125
	.dwcfi	undefined, 126
	.dwcfi	undefined, 127
	.dwcfi	undefined, 128
	.dwcfi	undefined, 129
	.dwcfi	undefined, 130
	.dwcfi	undefined, 131
	.dwcfi	undefined, 132
	.dwcfi	undefined, 133
	.dwcfi	undefined, 134
	.dwendentry

;***************************************************************
;* DWARF REGISTER MAP                                          *
;***************************************************************

$C$DW$610	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R0_b0")
	.dwattr $C$DW$610, DW_AT_location[DW_OP_reg0]
$C$DW$611	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R0_b1")
	.dwattr $C$DW$611, DW_AT_location[DW_OP_reg1]
$C$DW$612	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R0_b2")
	.dwattr $C$DW$612, DW_AT_location[DW_OP_reg2]
$C$DW$613	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R0_b3")
	.dwattr $C$DW$613, DW_AT_location[DW_OP_reg3]
$C$DW$614	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R1_b0")
	.dwattr $C$DW$614, DW_AT_location[DW_OP_reg4]
$C$DW$615	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R1_b1")
	.dwattr $C$DW$615, DW_AT_location[DW_OP_reg5]
$C$DW$616	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R1_b2")
	.dwattr $C$DW$616, DW_AT_location[DW_OP_reg6]
$C$DW$617	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R1_b3")
	.dwattr $C$DW$617, DW_AT_location[DW_OP_reg7]
$C$DW$618	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R2_b0")
	.dwattr $C$DW$618, DW_AT_location[DW_OP_reg8]
$C$DW$619	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R2_b1")
	.dwattr $C$DW$619, DW_AT_location[DW_OP_reg9]
$C$DW$620	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R2_b2")
	.dwattr $C$DW$620, DW_AT_location[DW_OP_reg10]
$C$DW$621	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R2_b3")
	.dwattr $C$DW$621, DW_AT_location[DW_OP_reg11]
$C$DW$622	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R3_b0")
	.dwattr $C$DW$622, DW_AT_location[DW_OP_reg12]
$C$DW$623	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R3_b1")
	.dwattr $C$DW$623, DW_AT_location[DW_OP_reg13]
$C$DW$624	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R3_b2")
	.dwattr $C$DW$624, DW_AT_location[DW_OP_reg14]
$C$DW$625	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R3_b3")
	.dwattr $C$DW$625, DW_AT_location[DW_OP_reg15]
$C$DW$626	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R4_b0")
	.dwattr $C$DW$626, DW_AT_location[DW_OP_reg16]
$C$DW$627	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R4_b1")
	.dwattr $C$DW$627, DW_AT_location[DW_OP_reg17]
$C$DW$628	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R4_b2")
	.dwattr $C$DW$628, DW_AT_location[DW_OP_reg18]
$C$DW$629	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R4_b3")
	.dwattr $C$DW$629, DW_AT_location[DW_OP_reg19]
$C$DW$630	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R5_b0")
	.dwattr $C$DW$630, DW_AT_location[DW_OP_reg20]
$C$DW$631	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R5_b1")
	.dwattr $C$DW$631, DW_AT_location[DW_OP_reg21]
$C$DW$632	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R5_b2")
	.dwattr $C$DW$632, DW_AT_location[DW_OP_reg22]
$C$DW$633	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R5_b3")
	.dwattr $C$DW$633, DW_AT_location[DW_OP_reg23]
$C$DW$634	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R6_b0")
	.dwattr $C$DW$634, DW_AT_location[DW_OP_reg24]
$C$DW$635	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R6_b1")
	.dwattr $C$DW$635, DW_AT_location[DW_OP_reg25]
$C$DW$636	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R6_b2")
	.dwattr $C$DW$636, DW_AT_location[DW_OP_reg26]
$C$DW$637	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R6_b3")
	.dwattr $C$DW$637, DW_AT_location[DW_OP_reg27]
$C$DW$638	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R7_b0")
	.dwattr $C$DW$638, DW_AT_location[DW_OP_reg28]
$C$DW$639	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R7_b1")
	.dwattr $C$DW$639, DW_AT_location[DW_OP_reg29]
$C$DW$640	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R7_b2")
	.dwattr $C$DW$640, DW_AT_location[DW_OP_reg30]
$C$DW$641	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R7_b3")
	.dwattr $C$DW$641, DW_AT_location[DW_OP_reg31]
$C$DW$642	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R8_b0")
	.dwattr $C$DW$642, DW_AT_location[DW_OP_regx 0x20]
$C$DW$643	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R8_b1")
	.dwattr $C$DW$643, DW_AT_location[DW_OP_regx 0x21]
$C$DW$644	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R8_b2")
	.dwattr $C$DW$644, DW_AT_location[DW_OP_regx 0x22]
$C$DW$645	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R8_b3")
	.dwattr $C$DW$645, DW_AT_location[DW_OP_regx 0x23]
$C$DW$646	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R9_b0")
	.dwattr $C$DW$646, DW_AT_location[DW_OP_regx 0x24]
$C$DW$647	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R9_b1")
	.dwattr $C$DW$647, DW_AT_location[DW_OP_regx 0x25]
$C$DW$648	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R9_b2")
	.dwattr $C$DW$648, DW_AT_location[DW_OP_regx 0x26]
$C$DW$649	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R9_b3")
	.dwattr $C$DW$649, DW_AT_location[DW_OP_regx 0x27]
$C$DW$650	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R10_b0")
	.dwattr $C$DW$650, DW_AT_location[DW_OP_regx 0x28]
$C$DW$651	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R10_b1")
	.dwattr $C$DW$651, DW_AT_location[DW_OP_regx 0x29]
$C$DW$652	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R10_b2")
	.dwattr $C$DW$652, DW_AT_location[DW_OP_regx 0x2a]
$C$DW$653	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R10_b3")
	.dwattr $C$DW$653, DW_AT_location[DW_OP_regx 0x2b]
$C$DW$654	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R11_b0")
	.dwattr $C$DW$654, DW_AT_location[DW_OP_regx 0x2c]
$C$DW$655	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R11_b1")
	.dwattr $C$DW$655, DW_AT_location[DW_OP_regx 0x2d]
$C$DW$656	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R11_b2")
	.dwattr $C$DW$656, DW_AT_location[DW_OP_regx 0x2e]
$C$DW$657	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R11_b3")
	.dwattr $C$DW$657, DW_AT_location[DW_OP_regx 0x2f]
$C$DW$658	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R12_b0")
	.dwattr $C$DW$658, DW_AT_location[DW_OP_regx 0x30]
$C$DW$659	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R12_b1")
	.dwattr $C$DW$659, DW_AT_location[DW_OP_regx 0x31]
$C$DW$660	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R12_b2")
	.dwattr $C$DW$660, DW_AT_location[DW_OP_regx 0x32]
$C$DW$661	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R12_b3")
	.dwattr $C$DW$661, DW_AT_location[DW_OP_regx 0x33]
$C$DW$662	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R13_b0")
	.dwattr $C$DW$662, DW_AT_location[DW_OP_regx 0x34]
$C$DW$663	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R13_b1")
	.dwattr $C$DW$663, DW_AT_location[DW_OP_regx 0x35]
$C$DW$664	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R13_b2")
	.dwattr $C$DW$664, DW_AT_location[DW_OP_regx 0x36]
$C$DW$665	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R13_b3")
	.dwattr $C$DW$665, DW_AT_location[DW_OP_regx 0x37]
$C$DW$666	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R14_b0")
	.dwattr $C$DW$666, DW_AT_location[DW_OP_regx 0x38]
$C$DW$667	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R14_b1")
	.dwattr $C$DW$667, DW_AT_location[DW_OP_regx 0x39]
$C$DW$668	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R14_b2")
	.dwattr $C$DW$668, DW_AT_location[DW_OP_regx 0x3a]
$C$DW$669	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R14_b3")
	.dwattr $C$DW$669, DW_AT_location[DW_OP_regx 0x3b]
$C$DW$670	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R15_b0")
	.dwattr $C$DW$670, DW_AT_location[DW_OP_regx 0x3c]
$C$DW$671	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R15_b1")
	.dwattr $C$DW$671, DW_AT_location[DW_OP_regx 0x3d]
$C$DW$672	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R15_b2")
	.dwattr $C$DW$672, DW_AT_location[DW_OP_regx 0x3e]
$C$DW$673	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R15_b3")
	.dwattr $C$DW$673, DW_AT_location[DW_OP_regx 0x3f]
$C$DW$674	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R16_b0")
	.dwattr $C$DW$674, DW_AT_location[DW_OP_regx 0x40]
$C$DW$675	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R16_b1")
	.dwattr $C$DW$675, DW_AT_location[DW_OP_regx 0x41]
$C$DW$676	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R16_b2")
	.dwattr $C$DW$676, DW_AT_location[DW_OP_regx 0x42]
$C$DW$677	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R16_b3")
	.dwattr $C$DW$677, DW_AT_location[DW_OP_regx 0x43]
$C$DW$678	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R17_b0")
	.dwattr $C$DW$678, DW_AT_location[DW_OP_regx 0x44]
$C$DW$679	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R17_b1")
	.dwattr $C$DW$679, DW_AT_location[DW_OP_regx 0x45]
$C$DW$680	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R17_b2")
	.dwattr $C$DW$680, DW_AT_location[DW_OP_regx 0x46]
$C$DW$681	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R17_b3")
	.dwattr $C$DW$681, DW_AT_location[DW_OP_regx 0x47]
$C$DW$682	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R18_b0")
	.dwattr $C$DW$682, DW_AT_location[DW_OP_regx 0x48]
$C$DW$683	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R18_b1")
	.dwattr $C$DW$683, DW_AT_location[DW_OP_regx 0x49]
$C$DW$684	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R18_b2")
	.dwattr $C$DW$684, DW_AT_location[DW_OP_regx 0x4a]
$C$DW$685	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R18_b3")
	.dwattr $C$DW$685, DW_AT_location[DW_OP_regx 0x4b]
$C$DW$686	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R19_b0")
	.dwattr $C$DW$686, DW_AT_location[DW_OP_regx 0x4c]
$C$DW$687	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R19_b1")
	.dwattr $C$DW$687, DW_AT_location[DW_OP_regx 0x4d]
$C$DW$688	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R19_b2")
	.dwattr $C$DW$688, DW_AT_location[DW_OP_regx 0x4e]
$C$DW$689	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R19_b3")
	.dwattr $C$DW$689, DW_AT_location[DW_OP_regx 0x4f]
$C$DW$690	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R20_b0")
	.dwattr $C$DW$690, DW_AT_location[DW_OP_regx 0x50]
$C$DW$691	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R20_b1")
	.dwattr $C$DW$691, DW_AT_location[DW_OP_regx 0x51]
$C$DW$692	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R20_b2")
	.dwattr $C$DW$692, DW_AT_location[DW_OP_regx 0x52]
$C$DW$693	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R20_b3")
	.dwattr $C$DW$693, DW_AT_location[DW_OP_regx 0x53]
$C$DW$694	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R21_b0")
	.dwattr $C$DW$694, DW_AT_location[DW_OP_regx 0x54]
$C$DW$695	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R21_b1")
	.dwattr $C$DW$695, DW_AT_location[DW_OP_regx 0x55]
$C$DW$696	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R21_b2")
	.dwattr $C$DW$696, DW_AT_location[DW_OP_regx 0x56]
$C$DW$697	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R21_b3")
	.dwattr $C$DW$697, DW_AT_location[DW_OP_regx 0x57]
$C$DW$698	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R22_b0")
	.dwattr $C$DW$698, DW_AT_location[DW_OP_regx 0x58]
$C$DW$699	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R22_b1")
	.dwattr $C$DW$699, DW_AT_location[DW_OP_regx 0x59]
$C$DW$700	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R22_b2")
	.dwattr $C$DW$700, DW_AT_location[DW_OP_regx 0x5a]
$C$DW$701	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R22_b3")
	.dwattr $C$DW$701, DW_AT_location[DW_OP_regx 0x5b]
$C$DW$702	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R23_b0")
	.dwattr $C$DW$702, DW_AT_location[DW_OP_regx 0x5c]
$C$DW$703	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R23_b1")
	.dwattr $C$DW$703, DW_AT_location[DW_OP_regx 0x5d]
$C$DW$704	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R23_b2")
	.dwattr $C$DW$704, DW_AT_location[DW_OP_regx 0x5e]
$C$DW$705	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R23_b3")
	.dwattr $C$DW$705, DW_AT_location[DW_OP_regx 0x5f]
$C$DW$706	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R24_b0")
	.dwattr $C$DW$706, DW_AT_location[DW_OP_regx 0x60]
$C$DW$707	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R24_b1")
	.dwattr $C$DW$707, DW_AT_location[DW_OP_regx 0x61]
$C$DW$708	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R24_b2")
	.dwattr $C$DW$708, DW_AT_location[DW_OP_regx 0x62]
$C$DW$709	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R24_b3")
	.dwattr $C$DW$709, DW_AT_location[DW_OP_regx 0x63]
$C$DW$710	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R25_b0")
	.dwattr $C$DW$710, DW_AT_location[DW_OP_regx 0x64]
$C$DW$711	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R25_b1")
	.dwattr $C$DW$711, DW_AT_location[DW_OP_regx 0x65]
$C$DW$712	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R25_b2")
	.dwattr $C$DW$712, DW_AT_location[DW_OP_regx 0x66]
$C$DW$713	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R25_b3")
	.dwattr $C$DW$713, DW_AT_location[DW_OP_regx 0x67]
$C$DW$714	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R26_b0")
	.dwattr $C$DW$714, DW_AT_location[DW_OP_regx 0x68]
$C$DW$715	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R26_b1")
	.dwattr $C$DW$715, DW_AT_location[DW_OP_regx 0x69]
$C$DW$716	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R26_b2")
	.dwattr $C$DW$716, DW_AT_location[DW_OP_regx 0x6a]
$C$DW$717	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R26_b3")
	.dwattr $C$DW$717, DW_AT_location[DW_OP_regx 0x6b]
$C$DW$718	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R27_b0")
	.dwattr $C$DW$718, DW_AT_location[DW_OP_regx 0x6c]
$C$DW$719	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R27_b1")
	.dwattr $C$DW$719, DW_AT_location[DW_OP_regx 0x6d]
$C$DW$720	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R27_b2")
	.dwattr $C$DW$720, DW_AT_location[DW_OP_regx 0x6e]
$C$DW$721	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R27_b3")
	.dwattr $C$DW$721, DW_AT_location[DW_OP_regx 0x6f]
$C$DW$722	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R28_b0")
	.dwattr $C$DW$722, DW_AT_location[DW_OP_regx 0x70]
$C$DW$723	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R28_b1")
	.dwattr $C$DW$723, DW_AT_location[DW_OP_regx 0x71]
$C$DW$724	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R28_b2")
	.dwattr $C$DW$724, DW_AT_location[DW_OP_regx 0x72]
$C$DW$725	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R28_b3")
	.dwattr $C$DW$725, DW_AT_location[DW_OP_regx 0x73]
$C$DW$726	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R29_b0")
	.dwattr $C$DW$726, DW_AT_location[DW_OP_regx 0x74]
$C$DW$727	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R29_b1")
	.dwattr $C$DW$727, DW_AT_location[DW_OP_regx 0x75]
$C$DW$728	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R29_b2")
	.dwattr $C$DW$728, DW_AT_location[DW_OP_regx 0x76]
$C$DW$729	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R29_b3")
	.dwattr $C$DW$729, DW_AT_location[DW_OP_regx 0x77]
$C$DW$730	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R30_b0")
	.dwattr $C$DW$730, DW_AT_location[DW_OP_regx 0x78]
$C$DW$731	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R30_b1")
	.dwattr $C$DW$731, DW_AT_location[DW_OP_regx 0x79]
$C$DW$732	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R30_b2")
	.dwattr $C$DW$732, DW_AT_location[DW_OP_regx 0x7a]
$C$DW$733	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R30_b3")
	.dwattr $C$DW$733, DW_AT_location[DW_OP_regx 0x7b]
$C$DW$734	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R31_b0")
	.dwattr $C$DW$734, DW_AT_location[DW_OP_regx 0x7c]
$C$DW$735	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R31_b1")
	.dwattr $C$DW$735, DW_AT_location[DW_OP_regx 0x7d]
$C$DW$736	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R31_b2")
	.dwattr $C$DW$736, DW_AT_location[DW_OP_regx 0x7e]
$C$DW$737	.dwtag  DW_TAG_TI_assign_register, DW_AT_name("R31_b3")
	.dwattr $C$DW$737, DW_AT_location[DW_OP_regx 0x7f]
	.dwendtag $C$DW$CU

