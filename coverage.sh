#!/bin/bash

# Script dependencies:

# $GODOT environment variable pointing to your Godot 3.x executable.
# on macOS, this looks something like:
# export GODOT="/Applications/Godot.app/Contents/MacOS/Godot"
#
# dotnet tool install --global coverlet.console
# dotnet tool update --global coverlet.console
# dotnet tool install --global dotnet-reportgenerator-globaltool
# dotnet tool update --global dotnet-reportgenerator-globaltool

# Build project
dotnet build

# Use coverlet to collect code coverage.
coverlet .mono/temp/bin/Debug/ --target $GODOT \
  --targetargs "--run-tests --quit-on-finish" \
  --format "opencover" \
  --output ./coverage/coverage.xml \
  --exclude-by-file "**/test/**/*.cs" \
  --exclude-by-file "**/Main.cs"

# Use report generator to generate coverage report and badges.
reportgenerator \
  -reports:"./coverage/coverage.xml" \
  -targetdir:"./coverage/report" \
  -reporttypes:Html

reportgenerator \
  -reports:"./coverage/coverage.xml" \
  -targetdir:"./badges" \
  -reporttypes:Badges

mv ./badges/badge_branchcoverage.svg ./reports/branch_coverage.svg
mv ./badges/badge_linecoverage.svg ./reports/line_coverage.svg

rm -rf ./badges

# Determine OS, open coverage accordingly.

case "$(uname -s)" in

   Darwin)
     echo 'Mac OS X'
     open coverage/report/index.htm
     ;;

   Linux)
     echo 'Linux'
     xdg-open coverage/report/index.htm
     ;;

   CYGWIN*|MINGW32*|MSYS*|MINGW*)
     echo 'MS Windows'
     start coverage/report/index.htm
     ;;

   *)
     echo 'Other OS'
     ;;
esac
