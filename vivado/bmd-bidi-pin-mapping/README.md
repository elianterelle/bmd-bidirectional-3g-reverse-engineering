# bmd-bidi-pin-mapping

Configures all pins as inputs and makes them available to an ILA core, along with 3 trigger signals for the three Banks.

To map out pins, a 10k resistor connected either to gnd or to the bank voltage can be touched to the pin, to change the pins state. Depending on the the circuitry, a lower resistor value will be necessary, e.g. when there is a pullup resistor on the pin.

You are doing this at your own risk. Touching a pin that is driven by another IC with a lower value resistor might cause damage. Also, pulling up a pin to a voltage higher than its bank voltage could cause damage.

All input pins are buffered in `r14[47:0]`, `r15[49:0]` and `r34[49:0]`, which are connected to the ILA Core.

The three signals `change14`, `change15` and `change34` are pulled high when a signal in the corresponding bank 14, 15 or 34 has changed. These can be used to trigger the ILA Core.
Two pins are excluded from `change14` in `src/rtl/top.v:61`, as they kept changing and always caused a trigger. These might be uart lines from the mcu.

After changing a pin state with the above mentioned technique, the ILA Core will trigger. A single bit of `r14`, `r15` or `r34` will have changed at the trigger point. The index of this bit can be used to look up the package pin in the constraints file `src/constraints/bmd-bidi.xdc`.
