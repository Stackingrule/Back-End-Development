package course05

object ListApp extends App {

  val l = List(1, 2, 3, 4, 5, 6)

  println(l.head)
  println(l.tail)

  val l2 = 1 :: Nil
  println(l2)

  val l3 = 2 :: l2
  println(l3)

  val l4 = 1 :: 2 :: 3 :: 4 :: Nil
  println(l4)

  val l5 = scala.collection.mutable.ListBuffer[Int]()
  l5 += 2
  l5 += (3, 4, 5, 6, 7)
  l5 ++= List(8, 9, 10)
  println(l5)
  l5 -= 2
  println(l5)
  l5 --= List(4, 5, 6)
  println(l5)

  print(l5.toList)
  print(l5.toArray)

  l5.insert(1, 11)

  println(l5.isEmpty)

}
