#-------------------------------------------------------------
# Generated Example Tcl script for IP 'gtwizard_0' (xilinx.com:ip:gtwizard:3.6)
#-------------------------------------------------------------

# Set up project params
set_param board.repoPaths /home/elian/vivado/2025.2/data/boards/board_files
set_param tcl.collectionResultDisplayLimit 0
set_param xicom.use_bs_reader 1
set_param chipscope.maxJobs 2
set_param general.usePosixSpawnForFork 1
# Declare source IP directory
set srcIpDir "/home/elian/Documents/git/elian/bmd-bidirectional-3g-reverse-engineering/vivado/bmd-bidi-sdi-ibert/bmd-bidi-sdi-ibert.gen/sources_1/ip/gtwizard_0"

# Declare xci file location
set srcXciDir "/home/elian/Documents/git/elian/bmd-bidirectional-3g-reverse-engineering/vivado/bmd-bidi-sdi-ibert/bmd-bidi-sdi-ibert.srcs/sources_1/ip/gtwizard_0"

# Create project
puts "INFO: \[open_example_project\] Creating new example project..."
create_project -name gtwizard_0_ex -part xc7a25tcsg325-2 -force
set_property target_language verilog [current_project]
set_property simulator_language MIXED [current_project]
set_property coreContainer.enable false [current_project]
set returnCode 0

# Set up pre-compilation paths
# Select chosen simulator
set_property target_simulator XSim [current_project]

# Import the original IP (excluding example files)
puts "INFO: \[open_example_project\] Importing original IP ..."
import_ip -files [list [file join $srcIpDir ../../../../bmd-bidi-sdi-ibert.srcs/sources_1/ip/gtwizard_0/gtwizard_0.xci]] -name gtwizard_0
if { $returnCode == 0 } { 
  reset_target {open_example} [get_ips gtwizard_0]

  # Generate the IP
  proc _filter_supported_targets {targets ip} {
    set res {}
    set all [get_property SUPPORTED_TARGETS $ip]
    foreach target $targets {
      lappend res {*}[lsearch -all -inline -nocase $all $target]
    }
    return $res
  }
  puts "INFO: \[open_example_project\] Generating the example project IP ..."
  generate_target [_filter_supported_targets {instantiation_template synthesis simulation implementation shared_logic} [get_ips gtwizard_0]] [get_ips gtwizard_0]
} 

if { $returnCode == 0 } { 
  # Add example synthesis HDL files
  puts "INFO: \[open_example_project\] Adding example synthesis HDL files ..."
  add_files -scan_for_includes -quiet -fileset [current_fileset] \
  [list [file join $srcIpDir gtwizard_0/example_design/support/gtwizard_0_common_reset.v]] \
  [list [file join $srcIpDir gtwizard_0/example_design/support/gtwizard_0_common.v]] \
  [list [file join $srcIpDir gtwizard_0/example_design/support/gtwizard_0_gt_usrclk_source.v]] \
  [list [file join $srcIpDir gtwizard_0/example_design/support/gtwizard_0_support.v]] \
  [list [file join $srcIpDir gtwizard_0/example_design/support/gtwizard_0_cpll_railing.v]] \
  [list [file join $srcIpDir gtwizard_0/example_design/gtwizard_0_exdes.v]] \
  [list [file join $srcIpDir gtwizard_0/example_design/gtwizard_0_gt_frame_check.v]] \
  [list [file join $srcIpDir gtwizard_0/example_design/gtwizard_0_gt_frame_gen.v]]
} 

if { $returnCode == 0 } { 
  # Add example miscellaneous synthesis files
  puts "INFO: \[open_example_project\] Adding example synthesis miscellaneous files ..."
  add_files -quiet -fileset [current_fileset] \
  [list [file join $srcIpDir gtwizard_0/example_design/gt_rom_init_rx.dat]]
set_property USED_IN_SIMULATION false [get_files [list [file join $srcIpDir gtwizard_0/example_design/gt_rom_init_rx.dat]]]
} 

if { $returnCode == 0 } { 
  # Add example XDC files
  puts "INFO: \[open_example_project\] Adding example XDC files ..."
  add_files -quiet -fileset [current_fileset -constrset] \
  [list [file join $srcIpDir gtwizard_0/example_design/gtwizard_0_exdes.xdc]]

} 

if { $returnCode == 0 } { 
  # Add example simulation HDL files
  puts "INFO: \[open_example_project\] Adding simulation HDL files ..."
  if { [catch {current_fileset -simset} exc] } { create_fileset -simset sim_1 }
  add_files -quiet -scan_for_includes -fileset [current_fileset -simset] \
  [list [file join $srcIpDir gtwizard_0/simulation/gtwizard_0_tb.v]]
set_property USED_IN_SYNTHESIS false [get_files [list [file join $srcIpDir gtwizard_0/simulation/gtwizard_0_tb.v]]]
} 

if { $returnCode == 0 } { 
  # Add example miscellaneous simulation files
  puts "INFO: \[open_example_project\] Adding simulation miscellaneous files ..."
  if { [catch {current_fileset -simset} exc] } { create_fileset -simset sim_1 }
  add_files -quiet -fileset [current_fileset -simset] \
  [list [file join $srcIpDir gtwizard_0/simulation/functional/gt_rom_init_rx.dat]]
set_property USED_IN_SYNTHESIS false [get_files [list [file join $srcIpDir gtwizard_0/simulation/functional/gt_rom_init_rx.dat]]]
} 

  # Import all files while preserving hierarchy
  import_files

  # Set top
  set_property TOP [lindex [find_top] 0] [current_fileset]

if { $returnCode == 0 } { 
  puts "INFO: \[open_example_project\] Sourcing example extension scripts ..."
  # Source script extension file(s)
  puts "INFO: \[open_example_project\] Sourcing extension script: tcl/set_top.tcl"
  if {[catch {source [file join $srcIpDir tcl/set_top.tcl]} errMsg]} {
    puts "ERROR: \[open_example_project\] Open Example Project failed: Error encountered while sourcing custom IP example design script: tcl/set_top.tcl"
    puts "$errMsg"
    error "ERROR: see log file for details."
    incr returnCode
  }
  puts "INFO: \[open_example_project\] Sourcing extension script: gtwizard_0/tcl/xci.tcl"
  if {[catch {source [file join $srcIpDir gtwizard_0/tcl/xci.tcl]} errMsg]} {
    puts "ERROR: \[open_example_project\] Open Example Project failed: Error encountered while sourcing custom IP example design script: gtwizard_0/tcl/xci.tcl"
    puts "$errMsg"
    error "ERROR: see log file for details."
    incr returnCode
  }
  puts "INFO: \[open_example_project\] Sourcing extension script: gtwizard_0/tcl/gtwizard_0_partner.tcl"
  if {[catch {source [file join $srcIpDir gtwizard_0/tcl/gtwizard_0_partner.tcl]} errMsg]} {
    puts "ERROR: \[open_example_project\] Open Example Project failed: Error encountered while sourcing custom IP example design script: gtwizard_0/tcl/gtwizard_0_partner.tcl"
    puts "$errMsg"
    error "ERROR: see log file for details."
    incr returnCode
  }
}

if { $returnCode == 0 } { 
  # Update compile order
  update_compile_order -fileset [current_fileset]
  update_compile_order -fileset [current_fileset -simset]
  puts "INFO: \[open_example_project\] Rebuilding top IP..."
  set tfiles [get_files -filter {name=~"*.xci" || name=~"*.bd"}]
  foreach tfile $tfiles {
    if { [lsearch [list_property $tfile] PARENT_COMPOSITE_FILE ] == -1} {
      generate_target all $tfile
    }
  }
  export_ip_user_files -force
} 

if { $returnCode == 0 } { 
  # Versal design: make sure there is a PS BD cell
  set mpart [get_property part [current_project]]
  set fam [get_property C_FAMILY $mpart]
  if { [string compare $fam "versal"] == 0 } {
    set cips_vlnv "xilinx.com:ip:versal_cips:*"
    set psx_vlnv "xilinx.com:ip:psx_wizard:*"
    set ps_vlnv "xilinx.com:ip:ps_wizard:*"
    proc is_supported_by_part {part vlnv} {
      set ipdef [get_ipdefs $vlnv]
      if {$ipdef != ""} {
        set supported_parts [get_property supported_parts $ipdef]
        set supported [expr [string first $part $supported_parts] != -1]
        return $supported
      }
      return 0
    }
    set supports_cips [is_supported_by_part $mpart $cips_vlnv]
    set supports_psx [is_supported_by_part $mpart $psx_vlnv]
    set supports_ps [is_supported_by_part $mpart $ps_vlnv]
    if { $supports_ps || $supports_cips || $supports_psx } {
      set scopedBDs {}
      foreach ip [get_ips] {
        set ipBDList [get_files -quiet -of $ip *.bd]
        if { $ipBDList != {} } { 
           foreach ipBd $ipBDList { 
             lappend scopedBDs $ipBd
          }
        }
      }
      set allBDs [get_files *.bd]
      set bFoundPS 0
      set topBD1 ""
      set topBDNames {}
      foreach bd1 $allBDs {
        set bAlsoInIpBDs 0
        foreach bd2 $scopedBDs {
          if { $bd1 == $bd2 } {
            set bAlsoInIpBDs 1
            break 
          } 
        } 
        if { $bAlsoInIpBDs == 0 } { 
          set fname [file tail $bd1]
          set bUsedInSynth [get_property used_in_synthesis [get_files $fname]]
          if { $bUsedInSynth == 1 } { 
            set rname [file rootname $fname]
            set topBD1 $fname
            lappend topBDNames $rname 
          } 
        } 
      } 
      set PSIPs [get_ips -filter IPDEF=~"*versal_cips*"] 
      set PSIPs [concat $PSIPs [get_ips -filter IPDEF=~"*psx_wizard*"]] 
      set PSIPs [concat $PSIPs [get_ips -filter IPDEF=~"*ps_wizard*"]] 
      foreach PSIP $PSIPs {
        set bBDcontext [ get_property is_bd_context $PSIP ]
        if { $bBDcontext == 1 } { 
          foreach topBD $topBDNames {
            set namelen [string length $topBD]
            if { [string compare -length $namelen $PSIP $topBD] == 0 } {
              set bFoundPS 1 
              break 
            } 
          } 
        } else {
          set bFoundPS 1 
          break 
        } 
      } 
      if { $bFoundPS == 0 } {
        if { $topBD1 == "" } {
          set newname ""
          set bDone 0
          set bdctr 0
          while { $bDone == 0 } {
            set uname "design_${bdctr}"
            set bNotUnique 0
            foreach bdname $topBDNames {
              if { $bdname == $uname } {
                incr bdctr
                set bNotUnique 1
                break
              } 
            } 
            if { $bNotUnique == 0 } {
              set newname $uname
              set bDone 1
            } 
          } 
          puts "INFO: \[open_example_project\] Creating new BD $newname"
          create_bd_design $newname
          puts "INFO: \[open_example_project\] Creating new processing subsystem cell in BD $newname"
          if {$supports_ps} {
            create_bd_cell -type ip -vlnv $ps_vlnv "ps_wizard_0"
          } elseif {$supports_cips} {
            create_bd_cell -type ip -vlnv $cips_vlnv "cips_0"
          } elseif {$supports_psx} {
            create_bd_cell -type ip -vlnv $psx_vlnv "psx_wizard_0"
          }
          set wrapper [make_wrapper -files [get_files ${newname}.bd] -top]
          if { [ catch { add_module_instance -module_name ${newname}_wrapper -inst_name ${newname}_i } msg ] } { 
            puts "DEBUG: \[open_example_project\] add_module_instance error: $msg "
            puts "ERROR: \[open_example_project\] Unable to add ${newname}_wrapper module to top module."
          } 
          puts "INFO: \[open_example_project\] Adding BD wrapper file: $wrapper"
          add_files -norecurse $wrapper 
          update_compile_order -fileset sources_1
          save_bd_design
        } else {
          open_bd_design $topBD1
          puts "INFO: \[open_example_project\] Creating new processing subsystem cell in existing BD $topBD1"
          if {$supports_ps} {
            create_bd_cell -type ip -vlnv $ps_vlnv "ps_wizard_0"
          } elseif {$supports_cips} {
            create_bd_cell -type ip -vlnv $cips_vlnv "cips_0"
          } elseif {$supports_psx} {
            create_bd_cell -type ip -vlnv $psx_vlnv "psx_wizard_0"
          }
          update_compile_order -fileset sources_1
          save_bd_design
        }
      }
    } else {
      puts "INFO: \[open_example_project\] Current part '$mpart' is not supported by versal_cips core, so CIPS will not be added to design if needed."
    }
  }
}
set dfile [file join $srcIpDir oepdone.txt]
if { [ catch { set doneFile [open $dfile w] } ] } {
} else { 
  puts $doneFile "Open Example Project DONE"
  close $doneFile
}
if { $returnCode != 0 } {
  puts "ERROR: \[open_example_project\] Problems were encountered while executing the example design script, please review the log file."
  error "ERROR: See log file for details."
  incr returnCode
} else {
  puts "INFO: \[open_example_project\] Open Example Project completed"
}
