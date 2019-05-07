# Warp

Tired of figuring out the relative path to a file, so you can copy it?
Tire no more! Warp is a small bash tool to move or copy a file from one location to another.

## Basic Usage

To copy a file in a directory in one terminal, to the directory of another terminal, first warp in the file
```
warp in foo.txt
```
In the other terminal, warp copy it
```
warp cp .
```

## Manual Installation

Download the warp.sh script and source it
```
source warp.sh
```

## Improvements

* Allow bash arguments to the warp command
* Allow more commands
* Allow packaging through bpkg
* Allow usage of this as a script without sourcing
