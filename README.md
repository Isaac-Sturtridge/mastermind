# mastermind
Mastermind guessing game

You can choose to be either the guesser or the setter. Type 'guesser' or 'setter' into the command line.

Guesser:
Type four colours into the command line, pressing enter after each one. You will receive feedback. If any colour is correct, it will be marked so. If it is in the answer but not the right position, it will be marked as present. Otherwise, it will be marked as not here.
Keep going until you get all 4 colours correct.

Setter:
Slightly more tedious at current setup (as the computer does not apply logic) but this is a command-line game.
You will see the assigned secret code on screen. Below this is the computer's guess.
Type your feedback into the command line in order, pressing enter after each one. 

If the computer matches a colour to the code, type '{color} is correct' for your feedback. The computer will repeat that guess for the rest of the game.

If the colour is present elsewhere in the code, type '{color} is present' for your feedback. The computer will sometimes now include this colour in future guesses.

If it is not present, type 'Not here'. 

NB: At current build, sometimes a 'nil' guess will show up, type 'Not here' for that. The computer also doesn't have any idea about wrong guesses, making especially the last colour sometimes challenging.