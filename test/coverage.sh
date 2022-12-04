#!/bin/bash

# You will need to install the following before running this script:
# dotnet tool install --global coverlet.console
# dotnet tool update --global coverlet.console
# dotnet tool install --global dotnet-reportgenerator-globaltool
# dotnet tool update --global dotnet-reportgenerator-globaltool


# Build project
dotnet build

# Use coverlet to collect code coverage.
coverlet .mono/temp/bin/Debug/ --target $GODOT --targetargs \
  "--run-tests --quit-on-finish" --format "json" \
  --output ./coverage/coverage.info \
  --exclude-by-file "**/scenes/**/*.cs" \
  --exclude-by-file "**/test/**/*.cs"

# Use report generator to generate coverage report and badges.
reportgenerator \
  -reports:"./coverage/coverage.json" \
  -targetdir:"./coverage/report" \
  -reporttypes:Html

reportgenerator \
  -reports:"./coverage/coverage.json" \
  -targetdir:"./badges" \
  -reporttypes:Badges

mv ./badges/badge_branchcoverage.svg ./reports/branch_coverage.svg
mv ./badges/badge_linecoverage.svg ./reports/line_coverage.svg

rm -rf ./badges
