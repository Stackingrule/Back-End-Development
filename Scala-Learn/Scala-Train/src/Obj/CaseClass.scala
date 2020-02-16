package Obj

// 通常用在模式匹配
object CaseClass {
  def main(args: Array[String]): Unit = {
    println(Dog("am").name)
  }

}

// case class 不用 new
case class Dog(name: String)