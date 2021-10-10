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
test "PINA: 0xFF (1111 1111) => PORTB: 0x0F (0000 1111), PORTC: 0xF0 (1111 0000)"
# Set inputs
setPINA 0xFF
# Continue for several ticks
continue 5
# Set expect values
expectPORTB 0x0F
expectPORTC 0xF0
# Check pass/fail
checkResult

# Add tests below

# Test:
test "PINA: 0xA5 (1010 0101) => PORTB: 0x0A (0000 1010), PORTC: 0x50 (0101 0000)"
# Set inputs
setPINA 0xA5
# Continue for several ticks
continue 5
# Set expect values
expectPORTB 0x0A
expectPORTC 0x50
# Check pass/fail
checkResult

# Test:
test "PINA: 0x3C (0011 1100) => PORTB: 0x03 (0000 0011), PORTC: 0xC0 (1100 0000)"
# Set inputs
setPINA 0x3C
# Continue for several ticks
continue 5
# Set expect values
expectPORTB 0x03
expectPORTC 0xC0
# Check pass/fail
checkResult

# Report on how many tests passed/tests ran
set $passed=$tests-$failed
eval "shell echo Passed %d/%d tests.\n",$passed,$tests
echo ======================================================\n
