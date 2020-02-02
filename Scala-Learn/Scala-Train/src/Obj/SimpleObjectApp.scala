package Obj

object SimpleObjectApp {

  def main(args: Array[String]): Unit = {
    val person = new People()
    person.name = "Messi"
    println(person.name + ".." + person.age)

    person.printInfo()

  }

}


class People {
  // 定义属性
  var name:String = _
  val age:Int = 10

  private [this] val gender = "male"

  def printInfo(): Unit = {
    println("gender: " + gender)
  }

  def eat():String = {
    name + " is eating ..."
  }

  def watchFootball(teamName:String): Unit = {
    println(name + " is watching")
  }

}