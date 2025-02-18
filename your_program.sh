#!/bin/sh
#
# Use this script to run your program LOCALLY.
#
# Note: Changing this script WILL NOT affect how CodeCrafters runs your program.
#
# Learn more: https://codecrafters.io/program-interface

set -e # Exit early if any commands fail

# Copied from .codecrafters/compile.sh
#
# - Edit this to change how your program compiles locally
# - Edit .codecrafters/compile.sh to change how your program compiles remotely
(
  cd "$(dirname "$0")" # Ensure compile steps are run within the repository directory
  dotnet build --configuration Release --output /tmp/codecrafters-build-redis-csharp codecrafters-redis.csproj
)

# Extract the directory and dbfilename from the arguments
DIR=""
DBFILENAME=""

while [[ "$#" -gt 0 ]]; do
    case $1 in
        --dir) DIR="$2"; shift ;;
        --dbfilename) DBFILENAME="$2"; shift ;;
    esac
    shift
done

# Copied from .codecrafters/run.sh
#
# - Edit this to change how your program runs locally
# - Edit .codecrafters/run.sh to change how your program runs remotely
exec /tmp/codecrafters-build-redis-csharp/codecrafters-redis "$DIR" "$DBFILENAME"