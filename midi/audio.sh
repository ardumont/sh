#!bash -x

# Script to launch audio servers for music making.

DEVICE=hw:1

case $1 in

    start )
        # Start JACK
        # fluidsynth and jackd only seem to get along at period 32 or 256.
        # At other periods, they both just crash and disappear.  I get a lot
        # of gaps (xruns) at 32.  So 256 is safest.
        #    jackd -d alsa --period 256 --device hpfix --rate 44100 \
        #      1>/tmp/jackd.out 2>/tmp/jackd.out &
        # As of Ubuntu 11.10, headphones are fixed for the G62.
        #    jackd -d alsa --period 256 --device hw --rate 44100 \
        #      1>/tmp/jackd.out 2>/tmp/jackd.out &
        # As of Ubuntu 12.10, a period of 128 is needed for good fluidsynth
        # timing.  (jackd 1.9.9, fluidsynth 1.1.5)
        jackd -d alsa --period 128 --device $DEVICE --rate 44100 \
              1>/tmp/jackd.out 2>/tmp/jackd.out &

        # Start fluidsynth
        fluidsynth --server --no-shell --audio-driver=jack \
                   --connect-jack-outputs \
                   /usr/share/sounds/sf2/FluidR3_GM.sf2 \
                   1>/tmp/fluidsynth.out 2>/tmp/fluidsynth.out &

        sleep 1

        if pgrep jackd && pgrep fluidsynth
        then
            echo Audio servers running.
        else
            echo There was a problem starting the audio servers.
        fi

        ;;

    stop )
        killall fluidsynth
        killall jackd
        echo Audio servers stopped.
        ;;

    * )
        echo Please specify start or stop...
        ;;
esac
