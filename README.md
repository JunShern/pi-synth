# pi-synth
Raspberry Pi synthesizer

# Installation

## Headless Mode and Auto-run
1. For headless auto-login: Enter the command `sudo raspi-config`. Scroll down to `Boot Options` and select `Console Autologin`. Then exit the configuration menu and reboot. ([source](https://raspberrypi.stackexchange.com/questions/48241/auto-login-in-jessie-how))
2. Add script to `.bashrc`:
```
echo '# Run pi-synth synthesizer' >> ~/.bashrc 
echo 'bash /home/pi/pi-synth/start_synth.sh' >> ~/.bashrc 
```

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

# Useful links

- [Boot into read-only mode to prevent SD corruption](https://learn.adafruit.com/read-only-raspberry-pi/)

For example, boot read-only mode with options:
```
GPIO for r/w jumper: 21
GPIO for halt button: 20
NO watchdog
```

- [Save an existing Raspberry Pi SD card image](https://beebom.com/how-clone-raspberry-pi-sd-card-windows-linux-macos/)

