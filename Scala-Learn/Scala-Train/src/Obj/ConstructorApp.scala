package Obj

object ConstructorApp {

  def main(args: Array[String]): Unit = {
    val person = new Person("zhangsan", 30)
    println(person.name + " : " + person.age + " : " + person.school)

    val student = new Student("lisi", 20, "computer")
    println(student.name + " : " + student.age + " : " +
      "" + student.major)

  }

}


// 主构造器
class Person(val name:String, val age:Int) {
  println("Person Constructor enter ...")

  val school = "ustc"

  var gender: String = _

  // 附属构造器
  def this(name:String, age:Int, gender:String) {
    this(name, age)
    this.gender = gender
  }
  println("Person Constructor leave ...")

}

class Student(name:String, age:Int, var major:String) extends Person(name, age) {
  println("Person Student enter ...")

  override val school: String = "peking"
  override def toString: String = "Person: override def toString :" + school

  println("Person Student leave ...")

}