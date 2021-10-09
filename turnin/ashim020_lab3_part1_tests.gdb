# Test file for "Lab3_BitManip"


# commands.gdb provides the following functions for ease:
#   test "<message>"
#       Where <message> is the message to print. Must call this at the beginning of every test
#       Example: test "PINA: 0x00 => expect PORTC: 0x01"
#   checkResult
#       Verify if the test passed or failed. Prints "passed." or "failed." accordingly, 
#       Must call this at the end of every test.
#   expectPORTx <val>
#       With x as the port (A,B,C,D)
#       The value the port is epected to have. If not it will print the erroneous actual value
#   setPINx <val>
#       With x as the port or pin (A,B,C,D)
#       The value to set the pin to (can be decimal or hexidecimal
#       Example: setPINA 0x01
#   printPORTx f OR printPINx f 
#       With x as the port or pin (A,B,C,D)
#       With f as a format option which can be: [d] decimal, [x] hexadecmial (default), [t] binary 
#       Example: printPORTC d
#   printDDRx
#       With x as the DDR (A,B,C,D)
#       Example: printDDRB

echo ======================================================\n
echo Running all tests..."\n\n

# Test:
test "PINA: 0xAA (1010 1010), PINB: 0x55 (0101 0101) => PORTC: 0x08"
# Set inputs
setPINA 0xAA
setPINB 0x55
# Continue for several ticks
continue 5
# Set expect values
expectPORTC 0x08
# Check pass/fail
checkResult

# Test:
test "PINA: 0xFF (1111 1111), PINB: 0xFF (1111 1111) => PORTC: 0x10"
# Set inputs
setPINA 0xFF
setPINB 0xFF
# Continue for several ticks
continue 5
# Set expect values
expectPORTC 0x10
# Check pass/fail
checkResult

# Add tests below

# Test:
test "PINA: 0xAB (1010 1011), PINB: 0xCD (1100 1101) => PORTC: 0x0A"
# Set inputs
setPINA 0xAB
setPINB 0xCD
# Continue for several ticks
continue 5
# Set expect values
expectPORTC 0x0A
# Check pass/fail
checkResult

# Report on how many tests passed/tests ran
set $passed=$tests-$failed
eval "shell echo Passed %d/%d tests.\n",$passed,$tests
echo ======================================================\n
