package Obj


object ApplyApp {

  def main(args: Array[String]): Unit = {
    for (i <- 1 to 10) {
      ApplyTest.incr
    }
    println(ApplyTest.count)
  }

}

class ApplyTest {

}

object ApplyTest {
  var count = 0;

  def incr = {
    count = count + 1;
  }

  def apply() = {
    println("Object ApplyTest apply ...")

    // 在Object 中的
    new ApplyTest
  }
}