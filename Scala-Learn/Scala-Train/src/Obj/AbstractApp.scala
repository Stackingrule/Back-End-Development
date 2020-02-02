package Obj

object AbstractApp {
  def main(args: Array[String]): Unit = {
    val student = new Student2
  }
}


abstract class Pserson2 {
  def speak
  val name:String
  val age: Int
}

class Student2 extends Pserson2 {
  override def speak: Unit = {
    println("Say Hello!")
  }
  override val name: String = "wangwu"
  override val age: Int = 12
}

/**
 * 类的一个或者多个方法没有完整的实现
 * /


