namespace MyGame {
  using Godot;
  using GoDotTest;
  using Moq;
  using Shouldly;

  public interface IMyObject {
    string SayHello();
  }

  public class MySystemUnderTest {
    public IMyObject MyObject { get; init; }
    public MySystemUnderTest(IMyObject myObject) => MyObject = myObject;

    public void Speak() => GD.Print(MyObject.SayHello());
  }

  public class ExampleTest : TestClass {
    public ExampleTest(Node testScene) : base(testScene) { }

    [SetupAll]
    public void SetupAll() { }

    [Test]
    public void TestSomething() {
      GD.Print("Testing...");
      true.ShouldBeTrue();
      GD.Print("Test finished.");
    }

    [Test]
    public void TestMyObjectIsCalled() {
      var myObject = new Mock<IMyObject>();
      myObject.Setup(x => x.SayHello()).Returns("Hello, world!");
      var sut = new MySystemUnderTest(myObject.Object);
      sut.Speak();
      myObject.VerifyAll();
    }

    [CleanupAll]
    public void CleanupAll() { }
  }
}
