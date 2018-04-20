dpl0    equ  10010000b    
drw0    equ  10010010b     
drw3    equ  11110010b    
cpl0    equ  10011010b    
cpl3    equ  11111010b  
 
D32     equ  01000000b    
G32     equ  10000000b     
 
 
 
CPU_386       equ 3
CPU_486       equ 4
CPU_PENTIUM   equ 5
CPU_P6        equ 6
CPU_PENTIUM4   equ 0x0F
 
PLATFORM        equ     0x14
PLATFORM_RS780  equ     0x0F
PLATFORM_RS880  equ     0x10
PLATFORM_FUSION equ     0x14
 
CAPS_FPU       equ    00 
CAPS_VME       equ    01
CAPS_DE       equ    02 
CAPS_PSE       equ    03
CAPS_TSC       equ    04 
CAPS_MSR       equ    05 
CAPS_PAE       equ    06
CAPS_MCE       equ    07
CAPS_CX8       equ    08 
CAPS_APIC     equ    09 
                         
;                     10 
CAPS_SEP       equ    11 
CAPS_MTRR     equ    12 
CAPS_PGE       equ    13 
CAPS_MCA       equ    14 
CAPS_CMOV     equ    15 
CAPS_PAT       equ    16
 
CAPS_PSE36     equ    17
CAPS_PSN       equ    18 
CAPS_CLFLUSH   equ    19
 
CAPS_DS       equ    21 
CAPS_ACPI     equ    22 
                         
CAPS_MMX       equ    23 
CAPS_FXSR     equ    24 
CAPS_SSE       equ    25 
CAPS_SSE2     equ    26 
CAPS_SS       equ    27 
CAPS_HTT       equ    28 
CAPS_TM       equ    29 
CAPS_IA64     equ    30 
CAPS_PBE       equ    31 
 

CAPS_SSE3     equ    32 
CAPS_MONITOR   equ    35 
CAPS_DS_CPL   equ    36 
CAPS_VMX       equ    37  
CAPS_EST       equ    39 
CAPS_TM2       equ    40 
CAPS_CID       equ    42 
CAPS_CX16     equ    45 
CAPS_xTPR     equ    46 
CAPS_SYSCAL   equ    64 
CAPS_XD       equ    65 
CAPS_FFXSR     equ    66 
CAPS_X64       equ    68 
CAPS_3DNOW     equ    69 
CAPS_3DNOWEXT equ    70 
CAPS_LAHF     equ    71 
CAPS_CMP_LEG   equ    72 
CAPS_SVM       equ    73 
CAPS_ALTMOVCR8 equ    74
MSR_SYSENTER_CS         equ     0x174
MSR_SYSENTER_ESP        equ     0x175
MSR_SYSENTER_EIP        equ     0x176
MSR_AMD_EFER            equ     0xC0000080      
MSR_AMD_STAR            equ     0xC0000081      
CR0_PE        equ    0x00000001   
CR0_MP        equ    0x00000002   
CR0_EM        equ    0x00000004   
CR0_TS        equ    0x00000008   
CR0_ET        equ    0x00000010   
CR0_NE        equ    0x00000020   
CR0_WP        equ    0x00010000  
CR0_AM        equ    0x00040000  
CR0_NW        equ    0x20000000  
CR0_CD        equ    0x40000000  
CR0_PG        equ    0x80000000  
CR4_VME       equ    0x0001
CR4_PVI       equ    0x0002
CR4_TSD       equ    0x0004
CR4_DE        equ    0x0008
CR4_PSE       equ    0x0010
CR4_PAE       equ    0x0020
CR4_MCE       equ    0x0040
CR4_PGE       equ    0x0080
CR4_PCE       equ    0x0100
CR4_OSFXSR     equ    0x0200
CR4_OSXMMEXPT equ    0x0400
SSE_IE        equ    0x0001
SSE_DE        equ    0x0002
SSE_ZE        equ    0x0004
SSE_OE        equ    0x0008
SSE_UE        equ    0x0010
SSE_PE        equ    0x0020
SSE_DAZ       equ    0x0040
SSE_IM        equ    0x0080
SSE_DM        equ    0x0100
SSE_ZM        equ    0x0200
SSE_OM        equ    0x0400
SSE_UM        equ    0x0800
SSE_PM        equ    0x1000
SSE_FZ        equ    0x8000
 
SSE_INIT equ (SSE_IM+SSE_DM+SSE_ZM+SSE_OM+SSE_UM+SSE_PM)
 
 
struc TSS
{
  ._back       rw 2
  ._esp0       rd 1
  ._ss0        rw 2
  ._esp1       rd 1
  ._ss1        rw 2
  ._esp2       rd 1
  ._ss2        rw 2
  ._cr3        rd 1
  ._eip        rd 1
  ._eflags     rd 1
  ._eax        rd 1
  ._ecx        rd 1
  ._edx        rd 1
  ._ebx        rd 1
  ._esp        rd 1
  ._ebp        rd 1
  ._esi        rd 1
  ._edi        rd 1
  ._es         rw 2
  ._cs         rw 2
  ._ss         rw 2
  ._ds         rw 2
  ._fs         rw 2
  ._gs         rw 2
  ._ldt        rw 2
  ._trap       rw 1
  ._io         rw 1
               rb 24
  ._io_map_0   rb 4096
  ._io_map_1   rb 4096
}
virtual at 0
  TSS  TSS
end virtual
TSS_SIZE equ (128+8192)
OS_BASE             equ 0x80000000
window_data         equ (OS_BASE+0x0001000)
CURRENT_TASK        equ (OS_BASE+0x0003000)
TASK_COUNT          equ (OS_BASE+0x0003004)
TASK_BASE           equ (OS_BASE+0x0003010)
TASK_DATA           equ (OS_BASE+0x0003020)
TASK_EVENT          equ (OS_BASE+0x0003020)
WIN_STACK           equ (OS_BASE+0x0005000)
WIN_POS             equ (OS_BASE+0x0005400)
idts                equ (OS_BASE+0x0005800)
PUTPIXEL            equ (OS_BASE+0x0006820)
GETPIXEL            equ (OS_BASE+0x0006824)
mouseunder          equ (OS_BASE+0x0006900)
IDE_DMA             equ 0x0007000
MOUSE_VISIBLE       equ (OS_BASE+0x000F204)
WIN_TEMP_XY         equ (OS_BASE+0x000F300)
KEY_COUNT           equ (OS_BASE+0x000F400)
KEY_BUFF            equ (OS_BASE+0x000F401)
BTN_COUNT           equ (OS_BASE+0x000F500)
BTN_BUFF            equ (OS_BASE+0x000F501)
CPU_FREQ            equ (OS_BASE+0x000F600)
MOUSE_PORT          equ (OS_BASE+0x000F604)
PS2_CHUNK           equ (OS_BASE+0x000FB00)
MOUSE_SCROLL_H      equ (OS_BASE+0x000FB08)
MOUSE_X             equ (OS_BASE+0x000FB0A)
MOUSE_Y             equ (OS_BASE+0x000FB0C)
MOUSE_SCROLL_V      equ (OS_BASE+0x000FB0E)
MOUSE_COLOR_MEM     equ (OS_BASE+0x000FB10)
COLOR_TEMP          equ (OS_BASE+0x000FB30)
BTN_DOWN            equ (OS_BASE+0x000FB40)
MOUSE_DOWN          equ (OS_BASE+0x000FB44)
X_UNDER             equ (OS_BASE+0x000FB4A)
Y_UNDER             equ (OS_BASE+0x000FB4C)
ScreenBPP           equ (OS_BASE+0x000FBF1)
MOUSE_BUFF_COUNT   equ (OS_BASE+0x000FCFF)
Screen_Max_X        equ (OS_BASE+0x000FE00)
Screen_Max_Y        equ (OS_BASE+0x000FE04)
BytesPerScanLine   equ (OS_BASE+0x000FE08)
SCR_MODE            equ (OS_BASE+0x000FE0C)
KERNEL_ALLOC_FLAG   equ (OS_BASE+0x000FE70)
mmio_pcie_cfg_addr equ (OS_BASE+0x000FE74)
mmio_pcie_cfg_lim   equ (OS_BASE+0x000FE78)
mmio_pcie_cfg_pdes equ (OS_BASE+0x000FE7C)
PCIe_bus_range      equ (OS_BASE+0x000FE7E)
UserDMAaddr         equ (OS_BASE+0x000FE80)
LFBAddress          equ (OS_BASE+0x000FE84)
BTN_ADDR            equ (OS_BASE+0x000FE88)
MEM_AMOUNT          equ (OS_BASE+0x000FE8C)
SYS_SHUTDOWN        equ (OS_BASE+0x000FF00)
TASK_ACTIVATE       equ (OS_BASE+0x000FF01)
REDRAW_BACKGROUND   equ (OS_BASE+0x000FFF0)
BACKGROUND_CHANGED equ (OS_BASE+0x000FFF1)
BANK_RW             equ (OS_BASE+0x000FFF2)
MOUSE_BACKGROUND   equ (OS_BASE+0x000FFF4)
DONT_DRAW_MOUSE     equ (OS_BASE+0x000FFF5)
DONT_SWITCH         equ (OS_BASE+0x000FFFF)
FONT_II             equ (OS_BASE+0x005DC00)
FONT_I              equ (OS_BASE+0x005E600)
TMP_STACK_TOP       equ 0x006C000
mmio_pte            equ 0x006E000
sys_pgdir           equ (OS_BASE+0x006F000)
DRIVE_DATA          equ (OS_BASE+0x0070000)
SLOT_BASE           equ (OS_BASE+0x0080000)
RAMDISK             equ (OS_BASE+0x0100000)
RAMDISK_FAT         equ (OS_BASE+0x0280000)
CLEAN_ZONE          equ 0x280000
BUTTON_INFO         equ (OS_BASE+0x02C0000)
RESERVED_PORTS      equ (OS_BASE+0x02D0000)
IRQ_SAVE            equ (OS_BASE+0x02E0000)
stack_data_start   equ (OS_BASE+0x0300000)
eth_data_start      equ (OS_BASE+0x0300000)
stack_data          equ (OS_BASE+0x0304000)
stack_data_end      equ (OS_BASE+0x031ffff)
resendQ             equ (OS_BASE+0x0320000)
BgrAuxTable         equ (OS_BASE+0x0328000)
skin_data           equ (OS_BASE+0x0330000)
draw_data           equ (OS_BASE+0x0338000);
BgrDrawMode         equ (OS_BASE+0x033BFF4)
BgrDataWidth        equ (OS_BASE+0x033BFF8)
BgrDataHeight       equ (OS_BASE+0x033BFFC)
BOOT_VAR            equ (OS_BASE+0x0340000)
sys_pgmap           equ (OS_BASE+0x0350000)
UPPER_KERNEL_PAGES equ (OS_BASE+0x0400000)
virtual at              (OS_BASE+0x05FFF80)
  tss  TSS
end virtual
HEAP_BASE           equ (OS_BASE+0x0800000)
HEAP_MIN_SIZE       equ 0x02000000
PCIe_CONFIG_SPACE   equ 0xF0000000
USER_DMA_BUFFER     equ 0xFD000000    
USER_DMA_SIZE       equ 0x00800000
FUSION_MMIO         equ 0xFD800000
LAPIC_BAR           equ 0xFD800000   
GPU_MMR             equ 0xFD801000    
GPU_CURSOR          equ 0xFD80F000   
page_tabs           equ 0xFDC00000
app_page_tabs       equ 0xFDC00000
kernel_tabs         equ (page_tabs+ (OS_BASE shr 10))  
master_tab          equ (page_tabs+ (page_tabs shr 10)) 
LFB_BASE            equ 0xFE000000
new_app_base        equ 0
twdw                equ 0x2000 
std_application_base_address   equ new_app_base
RING0_STACK_SIZE   equ (0x2000 - 512)
REG_SS              equ (RING0_STACK_SIZE-4)
REG_APP_ESP         equ (RING0_STACK_SIZE-8)
REG_EFLAGS          equ (RING0_STACK_SIZE-12)
REG_CS              equ (RING0_STACK_SIZE-16)
REG_EIP             equ (RING0_STACK_SIZE-20)
REG_EAX             equ (RING0_STACK_SIZE-24)
REG_ECX             equ (RING0_STACK_SIZE-28)
REG_EDX             equ (RING0_STACK_SIZE-32)
REG_EBX             equ (RING0_STACK_SIZE-36)
REG_ESP             equ (RING0_STACK_SIZE-40) 
REG_EBP             equ (RING0_STACK_SIZE-44)
REG_ESI             equ (RING0_STACK_SIZE-48)
REG_EDI             equ (RING0_STACK_SIZE-52)
REG_RET             equ (RING0_STACK_SIZE-56)
PG_UNMAP            equ 0x000
PG_MAP              equ 0x001
PG_WRITE            equ 0x002
PG_SW               equ 0x003
PG_USER             equ 0x005
PG_UW               equ 0x007
PG_NOCACHE          equ 0x018
PG_LARGE            equ 0x080
PG_GLOBAL           equ 0x100
PG_SHARED           equ 0x200
BOOT_LFB            equ 0x9018 
BOOT_MTRR           equ 0x901C
BOOT_LOG            equ 0x901D
BOOT_DIRECT_LFB     equ 0x901E
BOOT_PCI_DATA       equ 0x9020 
;BOOT_VRR           equ 0x9030 
BOOT_IDE_BASE_ADDR equ 0x9031 
BOOT_MEM_AMOUNT     equ 0x9034 
TMP_FILE_NAME       equ     0
TMP_CMD_LINE        equ  1024
TMP_ICON_OFFS       equ  1280
EVENT_REDRAW      equ 0x00000001
EVENT_KEY         equ 0x00000002
EVENT_BUTTON      equ 0x00000004
EVENT_BACKGROUND   equ 0x00000010
EVENT_MOUSE       equ 0x00000020
EVENT_IPC         equ 0x00000040
EVENT_NETWORK     equ 0x00000080
EVENT_DEBUG       equ 0x00000100
EVENT_EXTENDED    equ 0x00000200
EV_INTR           equ 1
struc THR_DATA
{
                  rb (8192-512)
  .pl0_stack:
  .fpu_state      rb 512
  .tls_page       rb 4096
  .pdbr           rb 4096
}
THR_DATA_SIZE     equ 4096*4
virtual at (OS_BASE-THR_DATA_SIZE)
  thr_data  THR_DATA
end virtual
struc SYS_VARS
{ .bpp            dd ?
  .scanline       dd ?
  .vesa_mode      dd ?
  .x_res          dd ?
  .y_res          dd ?
}
struc APPOBJ          
{
   .magic       dd ?   
   .destroy     dd ?  
   .fd          dd ?
   .bk          dd ?
   .pid         dd ?
}; 
virtual at 0
  APPOBJ APPOBJ
end virtual
APP_OBJ_OFFSET  equ 48
APP_EV_OFFSET   equ 40
struc CURSOR
{
   .magic       dd ?   
   .destroy     dd ? 
   .fd          dd ? 
   .bk          dd ? 
   .pid         dd ?  
 ;cursor data
   .base        dd ?  
   .hot_x       dd ? 
   .hot_y       dd ?
   .list_next   dd ? 
   .list_prev   dd ?
   .dev_obj     dd ? 
   .sizeof:
}
virtual at 0
  CURSOR CURSOR
end virtual
struc EVENT
{
   .magic       dd ?   
   .destroy     dd ?   
   .fd          dd ?   
   .bk          dd ?  
   .pid         dd ?  
 
   .id          dd ?  
   .state       dd ? 
   .code        dd ?
                rd 5
   .size     =  $ - .magic
   .codesize =  $ - .code
}
virtual at 0
  EVENT EVENT
end virtual
struc SMEM
{
    .bk         dd ?
    .fd         dd ?   
    .base       dd ?   
    .size       dd ?   
    .access     dd ?   
    .refcount   dd ?   
    .name       rb 32  
    .sizeof:
}
struc SMAP
{
   .magic       dd ?   
   .destroy     dd ?   
   .fd          dd ?  
   .bk          dd ?  
   .pid         dd ?   
   .base        dd ?   
   .parent      dd ?  
   .sizeof:
}
virtual at 0
  SMEM SMEM
end virtual
virtual at 0
  SMAP SMAP
end virtual
struc DLLDESCR
{
    .bk         dd ?
    .fd         dd ?  
    .data       dd ?    
    .size       dd ?    
    .timestamp  dq ?
    .refcount   dd ?
    .defaultbase dd ?
    .coff_hdr    dd ?
    .symbols_ptr dd ?
    .symbols_num dd ?
    .symbols_lim dd ?
    .exports     dd ?  
    .name:
    .sizeof:
}
struc HDLL
{
    .fd          dd ?  
    .bk          dd ? 
    .pid         dd ?  
 
    .base        dd ?  
    .size        dd ?  
    .refcount    dd ? 
    .parent      dd ? 
    .sizeof:
}
virtual at 0
  DLLDESCR DLLDESCR
end virtual
virtual at 0
  HDLL HDLL
end virtual
struc display_t
{
    .x              dd ?
    .y              dd ?
    .width          dd ?
    .height         dd ?
    .bpp            dd ?
    .vrefresh       dd ?
    .pitch          dd ?
    .lfb            dd ? 
    .modes          dd ?
    .ddev           dd ?
    .connector      dd ?
    .crtc           dd ?
    .cr_list.next   dd ?
    .cr_list.prev   dd ?
    .cursor         dd ?
    .init_cursor    dd ?
    .select_cursor  dd ?
    .show_cursor    dd ?
    .move_cursor    dd ?
    .restore_cursor dd ?
    .disable_mouse  dd ?
} 
virtual at 0
  display_t display_t
end virtual
struc HEAP_DATA
{
   .mutex         rd 1
   .refcount      rd 1
   .heap_base     rd 1
   .heap_top      rd 1
   .app_mem       rd 1
}
HEAP_DATA_SIZE  equ 20
virtual at 0
  HEAP_DATA HEAP_DATA
end virtual
struc BOOT_DATA
{ .bpp            dd ?
  .scanline       dd ?
  .vesa_mode      dd ?
  .x_res          dd ?
  .y_res          dd ?
  .mouse_port     dd ?
  .bank_switch    dd ?
  .lfb            dd ?
  .vesa_mem       dd ?
  .log            dd ?
  .direct_lfb     dd ?
  .pci_data       dd ?
  .vrr            dd ?
  .ide_base       dd ?
  .mem_amount     dd ?
  .pages_count    dd ?
  .pagemap_size   dd ?
  .kernel_max     dd ?
  .kernel_pages   dd ?
  .kernel_tables  dd ?
  .cpu_vendor     dd ?
                  dd ?
                  dd ?
  .cpu_sign       dd ?
  .cpu_info       dd ?
  .cpu_caps       dd ?
                  dd ?
                  dd ?
}
virtual at 0
  BOOT_DATA BOOT_DATA
end virtual
struc MEM_STATE
{  .mutex             rd 1
   .smallmap          rd 1
   .treemap           rd 1
   .topsize           rd 1
   .top               rd 1
   .smallbins         rd 4*32
   .treebins          rd 32
}
struc PG_DATA
{ .mem_amount        dd ?
  .vesa_mem          dd ?
  .pages_count       dd ?
  .pages_free        dd ?
  .pages_faults      dd ?
  .pagemap_size      dd ?
  .kernel_pages      dd ?
  .kernel_tables     dd ?
  .sys_page_dir      dd ?
  .pg_mutex          dd ?
} 
struc SRV
{
 .srv_name          rb 16   
  .magic             dd ?     
  .size              dd ?   
  .fd                dd ?    
  .bk                dd ?   
  .base              dd ?     
  .entry             dd ?    
  .srv_proc          dd ?    
  .srv_proc_ex       dd ?  
  .sizeof:
}
SRV_FD_OFFSET equ 0x18
DRV_ENTRY   equ  1
DRV_EXIT     equ -1
struc COFF_HEADER
{  .machine          dw ?
   .nSections        dw ?
   .DataTime         dd ?
   .pSymTable        dd ?
   .nSymbols         dd ?
   .optHeader        dw ?
   .flags            dw ?
}
struc COFF_SECTION
{  .Name             rb 8
   .VirtualSize      dd ?
   .VirtualAddress   dd ?
   .SizeOfRawData    dd ?
   .PtrRawData       dd ?
   .PtrReloc         dd ?
   .PtrLinenumbers   dd ?
   .NumReloc         dw ?
   .NumLinenum       dw ?
   .Characteristics  dd ?
}
COFF_SECTION_SIZE equ 40
 
struc COFF_RELOC
{  .VirtualAddress   dd ?
   .SymIndex         dd ?
   .Type             dw ?
}
struc COFF_SYM
{  .Name             rb 8
   .Value            dd ?
   .SectionNumber    dw ?
   .Type             dw ?
   .StorageClass     db ?
   .NumAuxSymbols    db ?
}
CSYM_SIZE equ 18
struc IOCTL
{  .handle           dd ?
   .io_code          dd ?
   .input            dd ?
   .inp_size         dd ?
   .output           dd ?
   .out_size         dd ?
}
virtual at 0
  IOCTL IOCTL
end virtual
virtual at 0
  SRV SRV
end virtual
virtual at 0
  CFH COFF_HEADER
end virtual
virtual at 0
  CFS COFF_SECTION
end virtual
virtual at 0
  CRELOC COFF_RELOC
end virtual
virtual at 0
  CSYM COFF_SYM
end virtual