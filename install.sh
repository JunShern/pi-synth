# Get necessary programs/files
sudo apt-get install fluidsynth --fix-missing
sudo apt-get install git

# Add synth script to .bashrc, to run on startup
echo '# Run pi-synth synthesizer' >> ~/.bashrc 
echo 'bash ~/pi-synth/start_synth.sh' >> ~/.bashrc 

# Enable auto-login
raspi-config nonint do_boot_behaviour B2

# Enable read-only mode (use with care!)
sudo bash ~/pi-synth/read-only-fs.sh

# Make sure soundfont is installed
# By right this should have been installed together with fluidsynth,
# but has disappeared before after running read-only script
sudo apt-get install fluid-soundfont-gm
