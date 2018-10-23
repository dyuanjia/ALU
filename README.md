# Mojo Project
Team 2-7

## FPGA Tester
The finite state machine (FSM) has 3 states:
1. Manual Testing  
    The 3 inputs are controlled by DIP switches 2, 1 and 0.
    * Carry-in: 2
    * A: 1
    * B: 0

    Press the center button to change to automatic testing.
2. Automatic Testing  
    The 3 inputs are represented by LEDs 2, 1 and 0 at the middle block.
    * Carry-in: 2
    * A: 1
    * B: 0

    Automatically try all input combinations from 000 to 111
3. Error  
    When the outputs are wrong from either testing mode, an error message "FAIL"
    will be displayed.  
    _Use reset button to go back to mode 1
