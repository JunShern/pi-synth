# Drop this file into /etc/rc.local for it to run on startup (on a Raspberry Pi)

##############################################################################

# Basic test with ALSA and Fluidsynth
#aplay -l # List soundcards, take note of 'card {cardnum}' for USB audio interface
#fluidsynth -is -o audio.alsa.device=hw:{cardnum} --audio-driver=alsa --gain 3 /usr/share/sounds/sf2/FluidR3_GM.sf2 & # Start fluidsynth
#acconect -o # Look for Fluidsynth's client number {out} 
#acconect -i # Look for MIDI keyboard's client number {in} 
#aconnect {in} {out} # Connect input to output 
#aseqdump -p {in} # For debugging (should print message events to console)

# Find and kill fluidsynth
#ps -a
#kill {PID}

##############################################################################

# Run fluidsynth, but this time as a non-interactive server
while true; do
  # Start fluidsynth
  if (fluidsynth -is -o audio.alsa.device=hw:1 --audio-driver=alsa --gain 3 /usr/share/sounds/sf2/FluidR3_GM.sf2 &); then
    break;
  fi;
    sleep 2;
done

# connect the controller to fluidsynth
while true; do if [[ $(aconnect -o ) = *FLUID* ]]; then break; fi; sleep 2; done

# Don't forget to replace these with the client numbers!
aconnect 24 128

# Give fluidsynth a nice high priority so it gets as much CPU as possible!
sudo renice -n -18 -u pi
