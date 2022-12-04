// Don't edit this file unless you need to change test execution behavior.
//
// By default, this file will run all tests in the current assembly if
// (and only if) the configuration is set to "Debug" and the "--run-tests"
// argument is passed in.
//
// The included launch.json provides launch configurations for debugging tests
// in Visual Studio Code.
namespace MyGame {
  using System.Reflection;
  using System.Threading.Tasks;
  using Godot;
#if DEBUG
  using GoDotTest;
#endif

  public class Main : Node2D {
    public override async void _Ready() {
#if DEBUG
      var env = TestEnvironment.From(OS.GetCmdlineArgs());
      if (env.ShouldRunTests) {
        await GoTest.RunTests(Assembly.GetExecutingAssembly(), this, env);
        return;
      }
#endif
      await Task.CompletedTask;
      GetTree().ChangeScene("res://game/Game.tscn");
    }
  }
}
