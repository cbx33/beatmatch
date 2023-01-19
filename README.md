# beatmatch

Right now in very early alpha phase - meaning it doesn't work properly

The design is simple, we take a MIDI input note and assuming it is close to where we think an existing beat should be, 
we mark that as a new beat, decide what the new tempo should be from that, by calculating how many beats since the last beat,
and then apply a one bar catchup tempo, followed by the new tempo.

JSFX should only be used on a MIDI input, you can't use notes on the piano roll to trigger else weird things happen.

Start up the JSFX on a channel, and then run the controller script with defer enabled. Tempo will ony be altered while playing.
Keep pressing a note in time with the initial beat, as you drift out of time, the system should detect and change tempo accordingly.

Things to do:
- Adjust for the offset from MIDI recieve, as the ``beat_position`` and ``play_position`` are probably inaccurate.
- Add a tick box for PDC
