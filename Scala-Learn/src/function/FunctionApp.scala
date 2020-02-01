package function

object FunctionApp {

  def main(args: Array[String]): Unit = {

//    println(add(2, 3))
//    println(three())
//    sayHello()

    sayName()
    sayName("lisi")
    println(speed(100, 10))
    println(speed(time=10, distance=100))

    println(sum2(1, 2, 3, 4, 5, 6, 7, 8,9, 10))

  }

  def add(x:Int, y:Int):Int = {
    x + y
  }

  def three(): Int = 1 + 2

  def sayHello(): Unit = {
    println("Say Hello")
  }

  def sayName(name:String = "PK"): Unit = {
    println(name)
  }

  def speed(distance:Float, time:Float):Float  = {
    distance/time
  }

  def sum2(numbers:Int*) = {
    var result = 0
    for (number <- numbers) {
      result += number
    }
    result
  }


}
