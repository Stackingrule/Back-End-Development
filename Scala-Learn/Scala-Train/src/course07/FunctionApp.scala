package course07

/**
 * 匿名函数
 * (参数) => 函数体
 */
object FunctionApp extends App {

  def sayHello(name: String): Unit = {
    println("Hello!" + name)
  }


  val m1 = (x:Int) => x+1


   println(m1(10))

  def add = (x:Int, y:Int) => {x+y}
  println(add(2, 3))


  def sum(a:Int, b:Int) = a + b
  println(sum(2, 9))

  def sum2(a:Int)(b:Int) = a + b
  println(sum2(2)(3))


  val l = List(1, 2, 3, 4, 5, 6, 7, 8)

  // map:
  val l2 = l.map((x:Int) => x+1)
  println(l2)

  val l3 = l.map((x) => x*2)
  println(l3)

  val l4 = l.map(_+3)
  println(l4)
  l4.foreach(println)

  l4.filter(_>8).foreach(println)


}
