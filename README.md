# Final-Project

For my final project I decided to have interactible objects influence the music.

Each of the creatures can be controlled with the mouse. Each individual creature controls a random aspect of the song, whether it be the gain, band-pass, balance, etc.

The program takes the values of all the creatures that influence a specific trait of the music and calculates an average. That average is what is applied to the final output.

New Code Elements:
- Using flocking is new, the concept was mentioned in class but we were not taught anything related as to how to accomplish it. For this, elements of Processing examples were used.
- Using the Minim library in general. We began using minim but the professor changed to using the Processing Sound Library very soon after introducing minim for the first time. Thus, much of the use of minim was through reviewing examples and referencing the reference.
- Using a band-pass filter and having it change based on the each creatures' elements
- Creating audio balance (like panning mono audio but in stereo) and having it be controlled by the creatures
- Using sound beat detection
- Displaying sound waves
- Using the creatures to control the gain of the audio (gain is comperable to amplitude)

Learning how to use minim and flocking was very fun.
