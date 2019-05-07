#!/usr/bin/env bash

WARP_DIR=~/.warp
WARP_IN=${WARP_DIR}/in.warp

# Make sure the directory is there
if [ ! -f $WARP_DIR ]
then
  mkdir -p $WARP_DIR || echo "Failed to create directory: $WARP_DIR"
fi

function warp {
  case $1 in
    in)
      # Check if we have a destination
      if [ -z "$2" ]; then
        echo "Error: No destination specified."
        echo "Usage:"
        echo "  warp $1 <file>"
        return 1
      fi

      # Perform the warping in
      local inPath=`pwd`/$2
      echo "Warping in \"$inPath\""
      echo $inPath > $WARP_IN
      ;;
    cp|mv|link)
      # First check if we have anything warped in yet
      if ! [ -f "$WARP_IN" ]; then    
        echo "Error: Nothing is warped yet.  First use 'warp in file_name'"
        return 1
      fi

      # Check if we have a destination
      if [ -z "$2" ]; then
        echo "Error: No destination specified."
        echo "Usage:"
        echo "  warp $1 <file>"
        return 1
      fi

      # Read the paths
      local inPath=`cat $WARP_IN`
      local outPath=$2

      # Perform the actual warp
      case $1 in
        cp)
          echo "Warping a copy of $inPath to $outPath"
          cp -r "$inPath" "$outPath"
          ;;
        mv)
          echo "Warping $inPath to $outPath"
          mv "$inPath" "$outPath"
          ;;
        link)
          echo "Opening warp-hole from $inPath to $outPath"
          ln -s "$inPath" "$outPath"
          ;;
      esac
      ;;
    *)
      echo "Error: Unknown command: $1"
      echo "Usage:"
      echo "  warp {in|cp|mv|link} <file>"
      return 1
  esac
}

