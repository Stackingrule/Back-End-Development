package course05

object ArrayApp extends App {

  val a = new Array[String](5)
  a.length
  a(1) = "hello"

  val b = Array("hadoop", "scala", "strom")
  b(1) = "flink"

  val c = Array(2, 3, 4, 5, 6, 7, 8, 9)
  c.sum
  c.min
  c.max

  println(c.toString)
  println(c.mkString(","))
  println(c.mkString("<", ",", ">"))
  println(c.toString)


  val d = scala.collection.mutable.ArrayBuffer[Int]()
  d += 1
  d += 2
  d += (2, 3, 4)
  d ++= Array(6, 7, 8)
  d.insert(3, 100)
  d.remove(0, 1)
  d.trimEnd(2)

  println(d)

  for (i <- 0 until d.length) {
    println(d(i))
  }

  for (e <- d) {
    println(e)
  }

  for (i <- (0 until d.length).reverse) {
    println(d(i))
  }



}
