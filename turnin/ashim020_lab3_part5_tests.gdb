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
test "PIND: 0xFF, PINB: 0x01 (1 1111 1111) => PORTB: 0x02 (0000 0010)"
# Set inputs
setPIND 0xFF
setPINB 0x01
# Continue for several ticks
continue 5
# Set expect values
expectPORTB 0x02
# Check pass/fail
checkResult

# Add tests below

# Test:
test "PIND: 0x22, PINB: 0x00 (0 0100 0100) => PORTD: 0x04 (0000 0100)"
# Set inputs
setPIND 0x22
setPINB 0x00
# Continue for several ticks
continue 5
# Set expect values
expectPORTD 0x04
# Check pass/fail
checkResult

# Test:
test "PIND: 0x00, PINB: 0x01 (0 0000 0001) => PORTD: 0x00 (0000 0000)"
# Set inputs
setPIND 0x00
setPINB 0x01
# Continue for several ticks
continue 5
# Set expect values
expectPORTD 0x00
# Check pass/fail
checkResult

# Report on how many tests passed/tests ran
set $passed=$tests-$failed
eval "shell echo Passed %d/%d tests.\n",$passed,$tests
echo ======================================================\n
