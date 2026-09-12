foreach i [get_hw_ilas] {
      if {[llength [get_hw_probes -quiet *es_point_valid* -of_objects $i]]} { set ila $i }
  }
  puts "using $ila"

  set pv [get_hw_probes *es_point_valid* -of_objects $ila]
  set pi [get_hw_probes *es_point_index* -of_objects $ila]

  set_property CONTROL.CAPTURE_MODE BASIC $ila
  set_property CAPTURE_COMPARE_VALUE eq1'b1 $pv

  set_property CONTROL.TRIGGER_POSITION 0 $ila
  set_property TRIGGER_COMPARE_VALUE eq1'b1     $pv
  set_property TRIGGER_COMPARE_VALUE eq16'h0001 $pi

  run_hw_ila $ila
  wait_on_hw_ila -timeout 5 $ila
  write_hw_ila_data -force -csv_file /home/elian/Documents/git/elian/bmd-bidirectional-3g-reverse-engineering/vivado/bmd-bidi-sdi-eye-monitor/tools/eye.csv [upload_hw_ila_data $ila]
