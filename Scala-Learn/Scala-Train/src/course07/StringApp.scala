package course07

object StringApp extends App{

  val s= "Hello:PK"
  val name = "Tim"

  // 插值
  println(s"Hello:$name")

  val b =
    """
      |this
      |is
      |a
      |apple
      """.stripMargin

  println(b)

}
