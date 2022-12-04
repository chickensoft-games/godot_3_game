# 🤖 MyGameName

![line coverage][line-coverage] ![branch coverage][branch-coverage]

A Godot 3 game for macOS, Windows, and Linux.

## 😅 Hey! Where can I get help?

[![Chickensoft Badge][chickensoft-badge]][chickensoft-website] [![Discord](https://img.shields.io/badge/Chickensoft%20Discord-%237289DA.svg?style=flat&logo=discord&logoColor=white)][discord] 

It's no secret game development is really hard. You don't have to suffer alone! 

*Is this template broken? Encountering obscure C# build problems?* Pop into our Discord and we'll be happy to help!


## 🏝 Environment Setup

For the provided debug configurations and test coverage to work correctly, you must set an environment variable.

For macOS, create a file named `.zshrc` in your user folder (if you don't have one already) and add the shell configuration shown below, replacing any paths with the correct paths on your machine.

On Linux, edit your `.zshrc`, `.bash_profile`, or `.bashrc` accordingly.

On Windows, you can [create environment variables in the Windows Settings][windows-env].

```sh
# Replace with the correct path on your system
export GODOT="/Applications/Godot.app/Contents/MacOS/Godot"

# Add the Godot executable to the path
export PATH="/Applications/Godot.app/Contents/MacOS:$PATH"
```

> Note: you may have to logout and log back in before VSCode recognizes environment variables.

### ⚙️ Additional Configuration

Here are a few extra convenience shell aliases for working with Godot and C#.

On Windows, you can add these to a `.bash_profile` file in your home folder (provided you've installed Git with Git Bash).

```sh
# Helps keeps the error "can't create res://.mono" error from happening on mac.
# Found on: https://godotengine.org/qa/21875/cant-generate-mono-glue-on-osx
export PKG_CONFIG_PATH="/Library/Frameworks/Mono.framework/Versions/6.12.0/lib/pkgconfig"

# If you're having problems restoring nuget packages, run this to clear the
# nuget cache after running `dotnet clean`.
alias nugetclean="dotnet nuget locals --clear all"
```

## 🕹 Debugging

To debug your game, open the root of your project in [Visual Studio Code][vscode] and select the launch profile titled `Debug Game`.

The launch profile titled `Debug Current Scene` allows you to debug the current scene for the C# script file you have open.

> Important: To debug the scene for your currently open C# file, the scene and the script **have to be in the same folder and share the same name**: e.g.,  `src/Main.cs` is selected in VSCode and the scene is located at `src/Main.tscn`)

## 👷 Testing

A test project is included which runs tests inside Godot using [GoDotTest].

Because of quirks with Visual Studio Code, you should open the `test/` subdirectory as the main folder in VSCode when writing tests, and add your game folder above it to the workspace to access your source code. While working inside the `test/` folder, you can then use the launch configurations provided in `test/.vscode/launch.json` to debug all tests or debug the current test.

The test project is excluded from the main game project in `MyGameNameName.csproj`, since test files should not be in the final build.

### 🎭 Testing Scenes

To include scene files from the game in the test project, the test project uses [Chicken] to setup symlinks so that all of the scenes nested inside the game's `src/` directory appear in the `src/` directory of the test project. While a bit confusing, this process allows you to reference your game's scenes (without breaking resource paths) as well as your game's code to further automate your testing.

> Important: if you intend to write tests for your game's scenes, all of your scenes (and any assets and scripts those scenes depend on) should be in the top level `src/` directory of your project so they can be brought into the test project without breaking `res://` resource paths.

### 🚦 Test Coverage

Code coverage requires a few dotnet global tools to be installed first.

```sh
dotnet tool install --global coverlet.console
dotnet tool update --global coverlet.console
dotnet tool install --global dotnet-reportgenerator-globaltool
dotnet tool update --global dotnet-reportgenerator-globaltool
```

> Running `dotnet tool update` for the global tool is often necessary on Apple Silicon computers to ensure the tools are installed correctly.

You can collect code coverage and generate coverage badges by running the bash script in `test/coverage.sh` (on Windows, you can use the Git Bash shell that comes with git).

```sh
# Must give coverage script permission to run the first time it is used.
chmod +x test/.coverage.sh

# Run code coverage:
cd test
./coverage.sh
```

## 🔌 Installing Addons

You can install addons using [Chicken]. Chicken makes it easy to install Godot addons from git urls's, local paths, and even as symlinks (for when your addons are still in development).

---

🐤 *Project generated with [Chicken] — [Chickensoft's][Chickensoft] command line tool for game development with Godot and C#.*

<!-- Coverage Badges at the top -->
[line-coverage]: test/reports/line_coverage.svg
[branch-coverage]: test/reports/branch_coverage.svg

<!-- Links and Misc -->
[chickensoft-badge]: https://chickensoft.games/images/chickensoft/chickensoft_badge.svg
[chickensoft-website]: https://chickensoft.games
[discord]: https://discord.gg/gSjaPgMmYW
[windows-env]: https://www.alphr.com/set-environment-variables-windows-11/
[vscode]: https://code.visualstudio.com
[Chickensoft]: https://chickensoft.games
[Chicken]: https://github.com/chickensoft-games/Chicken
[GoDotTest]: https://github.com/chickensoft-games/go_dot_test
