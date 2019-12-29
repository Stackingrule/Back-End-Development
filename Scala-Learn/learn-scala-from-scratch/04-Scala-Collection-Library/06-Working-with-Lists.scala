val fruitList = List("orange", "banana", "apple", "grape")

// Driver Code
fruitList.foreach(println)


val fruitList = "orange"::"banana"::"apple"::"grape"::Nil

// Driver Code
fruitList.foreach(println)


val fruitList = "orange"::List("banana","apple","grape")

// Driver Code
fruitList.foreach(println)


val fruitList = "orange"::"banana"::"apple"::"grape"::Nil
val fruitList2 = fruitList :+ "peach"

// Driver Code
fruitList2.foreach(println)


val fruitList = "orange"::"banana"::"apple"::"grape"::Nil
val fruitList2 = fruitList :+ "peach"
val fruitList3 = "watermelon"::fruitList2

// Driver Code
fruitList3.foreach(println)


val fruitList = "orange"::"banana"::"apple"::"grape"::Nil
val fruitList2 = fruitList :+ "peach"
val fruitList3 = "watermelon"::fruitList2
val fruitList4 = "mango" +: fruitList3

// Driver Code
fruitList4.foreach(println)


val fruitList = "orange"::"banana"::"apple"::"grape"::Nil
val fruitList2 = fruitList :+ "peach"
val fruitList3 = "watermelon"::fruitList2
val fruitList4 = "mango" +: fruitList3
val twoFruits = "pear"::"apricot"::Nil
val fruitList5 = twoFruits ::: fruitList4

// Driver Code
fruitList5.foreach(println)


val fruitList = "orange"::"banana"::"apple"::"grape"::Nil
val fruitList2 = fruitList :+ "peach"
val fruitList3 = "watermelon"::fruitList2
val fruitList4 = "mango" +: fruitList3
val twoFruits = "pear"::"apricot"::Nil
val fruitList5 = twoFruits ::: fruitList4

val getHead = fruitList5.head
val getTail = fruitList5.tail

// Driver Code
println(getHead)
println(getTail)


