# 🤖 MyGame

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

> Important: To debug the scene for your currently open C# file, the scene and the script **have to be in the same folder and share the same name**: e.g.,  `game/Game.cs` is selected in VSCode and the scene is located at `game/Game.tscn`)

## 👷 Testing

By default, [GoDotTest] is included in debug builds (but not in release builds) so that you can benefit from automated testing in your game or application.

The project is configured to allow tests to be easily run and debugged from VSCode or executed via CI/CD workflows, without having to include the test files or test dependencies in the final release build.

The `Main.tscn` and `Main.cs` scene and script file are the entry point of your game. In general, you probably won't need to modify these unless you're doing something highly custom. If the game isn't running in test mode (or it's a release build), it will just immediately change the scene to `game/Game.tscn`. In general, prefer editing `game/Game.tscn` over `Main.tscn`.
If you run Godot with the `--run-tests` command line argument, the game will run the tests instead of switching to the game scene located at `game/Game.tscn`. The provided debug configurations in `.vscode/launch.json` allow you to easily debug tests (or just the currently open test, provided its filename matches its classname).

Please see `test/ExampleTest.cs` and the [GoDotTest] readme for more examples. 

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

You can also run test coverage through VSCode by opening the command palette and selecting `Tasks: Run Task` and then choosing `coverage`.

## 🔌 Installing Addons

You can install addons using [Chicken]. Chicken makes it easy to install Godot addons from git urls's, local paths, and even as symlinks (for when your addons are still in development).

---

🐤 *Project generated with [Chicken] — [Chickensoft's][Chickensoft] command line tool for game development with Godot and C#.*

<!-- Coverage Badges at the top -->
[line-coverage]: reports/line_coverage.svg
[branch-coverage]: reports/branch_coverage.svg

<!-- Links and Misc -->
[chickensoft-badge]: https://chickensoft.games/images/chickensoft/chickensoft_badge.svg
[chickensoft-website]: https://chickensoft.games
[discord]: https://discord.gg/gSjaPgMmYW
[windows-env]: https://www.alphr.com/set-environment-variables-windows-11/
[vscode]: https://code.visualstudio.com
[Chickensoft]: https://chickensoft.games
[Chicken]: https://github.com/chickensoft-games/Chicken
[GoDotTest]: https://github.com/chickensoft-games/go_dot_test
