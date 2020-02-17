package course06

import scala.util.Random

object MatchApp extends App{
  val names = Array("YuiHatono", "Akiho Yoshizawa", "Aoi Sola")
  val name = names(Random.nextInt(names.length))

  name match {
    case "YuiHatono" => println("YuiHatono")

    case "Akiho Yoshizawa" => println("Akiho Yoshizawa")

    case "Aoi Sola" => println("Aoi Sola")

    case _ => println("Not Exist")
  }

  def judgeGrade(grade:String): Unit = {
    grade match {
      case "A" =>println("A")
      case "B" => println("B")
      case _ => println("work hard")
    }
  }

  judgeGrade("A")
  judgeGrade("B")
  judgeGrade("C")


  def greeting(list: List[String]):Unit = {
    list match {
      case "zhangsan"::Nil => println("Hi zhangsan")
      case x::y::Nil => println("Hi " + x + ", " + y)
      case "zhangsan"::tail => println("Hi zhangsan and other friends...")
      case _ => println("Hi everybody")
    }
  }

  greeting(List("zhangsan"))

}
