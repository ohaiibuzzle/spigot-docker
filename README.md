# Spigot MC, in a box!

Builds and run SpigotMC, using Ubuntu as builder and Alpine for runtime.

Completely pointless but it's fun™

To build, adjust `Dockerfile` to fit your use, then simply:

```docker build -t foo:spigot .```

To run, it's recommended that you use an interactive tty for testing, plus mount a volume on your real machine to prevent *mishaps*:

```docker run -it -v /does/not/exist/:/mc/ -w /mc/ -p 25565:25565 buzz:spigot```
