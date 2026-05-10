# Build automation for KiCad projects
#
# Type "make" to output all of the fabrication and assembly files you'll need into a directory called 'build'.
#
# The makefile automatically looks for a local *.kicad_pro file and assumes that's your project name. It
# then assumes you want your build products to go into a folder called "build", of course.
#
# Note: PRESET_NAME is the preset for your BOM format. kicad-cli will happily output a completely useless BOM
# of just REF, VALUE, FOOTPRINT, that's it, unless you set up the BOM tool with a "preset". We suggest you create
# 'bom-preset' when working in KiCad which has "all the things" when you're editing the schematic, and then 
# another preset called 'bom-export-preset' when exporting your BOM into a CSV file. This export preset removes
# VALUE, FOOTPRINT, and DATASHEET.

PROJECT_FILE = $(firstword $(shell echo *.kicad_pro))
PROJECT_NAME = $(PROJECT_FILE:%.kicad_pro=%)
SCHEMATIC    = $(PROJECT_NAME).kicad_sch
BOARD        = $(PROJECT_NAME).kicad_pcb
TIMESTAMP   = $(shell date '+%Y-%m-%dT%H-%M-%S')
PRESET_NAME ?= bom-export-preset
OUTPUT_DIR  ?= build
DOC_DIR     ?= documentation
FAB_DIR     ?= fabrication
ASM_DIR     ?= assembly
CAD_DIR     ?= cad

# Default target (first target is default)
all: erc pdf bom drc ipc gbr drl pos jpg dxf stp rme cad zip

# Build all but skip ERC and DRC checks. It's called fafo for a reason, kids.
fafo: pdf bom ipc gbr drl pos jpg dxf stp rme cad zip

# Generate build files from the schematic

erc:	## Check for errors and warnings. Exit build if you have any. Remove the useless report if none.
	kicad-cli sch erc -o $(OUTPUT_DIR)/$(DOC_DIR)/$(PROJECT_NAME)-erc.rpt --severity-error --severity-warning --exit-code-violations $(SCHEMATIC)
	rm -f $(OUTPUT_DIR)/$(DOC_DIR)/$(PROJECT_NAME)-erc.rpt

pdf:	## Generate a PDF of the schematic
	kicad-cli sch export pdf -o $(OUTPUT_DIR)/$(DOC_DIR)/$(PROJECT_NAME)-schematic.pdf $(SCHEMATIC)
	
bom:	## Generate a CSV Bill of Materials (BOM) with the output preset file that you created in your schematic.
	kicad-cli sch export bom --preset $(PRESET_NAME) -o $(OUTPUT_DIR)/$(ASM_DIR)/$(PROJECT_NAME)-bom.csv $(SCHEMATIC)	

# Generate build files from the board

drc:	## Check layout for schematic parity, layout errors, and layout warnings. Exit build if there are any. Remove useless report if none.
	kicad-cli pcb drc  -o $(OUTPUT_DIR)/$(FAB_DIR)/$(PROJECT_NAME)-drc.rpt --schematic-parity --severity-error --severity-warning --exit-code-violations $(BOARD)
	rm -f $(OUTPUT_DIR)/$(FAB_DIR)/$(PROJECT_NAME)-drc.rpt

ipc:	## IPC-2581 is an open standard used for board fab and assembly (silly to copy it twice, but :shrug:
	kicad-cli pcb export ipc2581 -o $(OUTPUT_DIR)/$(FAB_DIR)/$(PROJECT_NAME)-ipc2581.xml $(BOARD)
	cp $(OUTPUT_DIR)/$(FAB_DIR)/$(PROJECT_NAME)-ipc2581.xml $(OUTPUT_DIR)/$(ASM_DIR)/
	
gbr:	## Modern Gerber files for all the standard layers (kill the jobs file)
	kicad-cli pcb export gerbers -o $(OUTPUT_DIR)/$(FAB_DIR) --board-plot-params $(BOARD)
	rm -f $(OUTPUT_DIR)/$(FAB_DIR)/*.gbrjob
	cp $(OUTPUT_DIR)/$(FAB_DIR)/*_Paste.gbr $(OUTPUT_DIR)/$(ASM_DIR)/
	
drl:	## Excellon drill files, separated by plated / non-plated holes which is sometimes useful
	kicad-cli pcb export drill -o $(OUTPUT_DIR)/$(FAB_DIR) --excellon-separate-th $(BOARD)

pos:	## Position files for pick and place machines (also in the ipc file) 
	kicad-cli pcb export pos -o $(OUTPUT_DIR)/$(ASM_DIR)/$(PROJECT_NAME).pos --exclude-dnp $(BOARD)

# Generate renders of the board

jpg:	## Generate photorealistic renders of the top and bottom sides of the PCB
	kicad-cli pcb render -o $(OUTPUT_DIR)/$(DOC_DIR)/$(PROJECT_NAME)-render-top.jpg --side top -w 3840 -h 2160 $(BOARD)
	kicad-cli pcb render -o $(OUTPUT_DIR)/$(DOC_DIR)/$(PROJECT_NAME)-render-bot.jpg --side bottom -w 3840 -h 2160 $(BOARD)
	
dxf:	## DXF drawing of the board outline, with cutouts and larger holes
	kicad-cli pcb export dxf -o $(OUTPUT_DIR)/$(DOC_DIR)/$(PROJECT_NAME)-outline.dxf --mode-single -l Edge.Cuts $(BOARD)
	
stp:	## A 3D STEP file to import into your MCAD package
	kicad-cli pcb export step -o $(OUTPUT_DIR)/$(DOC_DIR)/$(PROJECT_NAME)-pcba.step --no-dnp --include-silkscreen --include-soldermask --include-pads --cut-vias-in-body --subst-models $(BOARD)

rme:	## Readme files
	sed "s/PROJECT-NAME/$(PROJECT_NAME)/g" README.md > $(OUTPUT_DIR)/README.md
	sed -i "s/TIME-STAMP/$(TIMESTAMP)/g" $(OUTPUT_DIR)/README.md
	pandoc $(OUTPUT_DIR)/README.md -o $(OUTPUT_DIR)/README.pdf
	cp $(OUTPUT_DIR)/README.pdf $(OUTPUT_DIR)/$(DOC_DIR)
	cp $(OUTPUT_DIR)/README.pdf $(OUTPUT_DIR)/$(FAB_DIR)
	cp $(OUTPUT_DIR)/README.pdf $(OUTPUT_DIR)/$(ASM_DIR)

cad:	## CAD files
	mkdir -p $(OUTPUT_DIR)/$(CAD_DIR)
	cp *.kicad_pro *.kicad_sch *.kicad_pcb $(OUTPUT_DIR)/$(CAD_DIR)

zip:	## Zip the file with a timestamp (one for everything, and one for each directory)
	
	zip -r $(OUTPUT_DIR)/$(PROJECT_NAME)-$(TIMESTAMP).zip $(OUTPUT_DIR)/*
	zip -r $(OUTPUT_DIR)/$(PROJECT_NAME)-$(TIMESTAMP)-$(DOC_DIR).zip $(OUTPUT_DIR)/$(DOC_DIR)/*
	zip -r $(OUTPUT_DIR)/$(PROJECT_NAME)-$(TIMESTAMP)-$(FAB_DIR).zip $(OUTPUT_DIR)/$(FAB_DIR)/*
	zip -r $(OUTPUT_DIR)/$(PROJECT_NAME)-$(TIMESTAMP)-$(ASM_DIR).zip $(OUTPUT_DIR)/$(ASM_DIR)/*
	zip -r $(OUTPUT_DIR)/$(PROJECT_NAME)-$(TIMESTAMP)-$(CAD_DIR).zip $(OUTPUT_DIR)/$(CAD_DIR)/*
	
clean:	## delete everything for clean
	rm -rf $(OUTPUT_DIR)/*

# Tell make that these are commands, not files
.PHONY: all fafo erc pdf bom drc ipc gbr drl pos jpg dxf stp rme cad zip clean

