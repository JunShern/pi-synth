# pi-synth
Raspberry Pi synthesizer

# Installation
Drop `start_synth.sh` into /etc/rc.local for it to run on startup (on a Raspberry Pi)

# Useful snippets
```sh
## Basic test with ALSA and Fluidsynth
aplay -l # List soundcards, take note of 'card {cardnum}' for USB audio interface
fluidsynth -is -o audio.alsa.device=hw:{cardnum} --audio-driver=alsa --gain 3 /usr/share/sounds/sf2/FluidR3_GM.sf2 & # Start fluidsynth
acconect -o # Look for Fluidsynth's client number {out} 
acconect -i # Look for MIDI keyboard's client number {in} 
aconnect {in} {out} # Connect input to output 
aseqdump -p {in} # For debugging (should print message events to console)

## Find and kill fluidsynth
ps -a
kill {PID}
```
