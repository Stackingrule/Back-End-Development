val expressionToFind = "the".r

val stringToFindExpression = "the little girl talked to the wolf"

val match1 = expressionToFind.findFirstIn(stringToFindExpression)

// Driver Code
match1.foreach(println)


val expressionToFind = "[1-5]+".r

val stringToFindExpression = "12 67 93 48 51"

val match1 = expressionToFind.findAllIn(stringToFindExpression)

// Driver Code
match1.foreach(println)


val expressionToFind = "[1-5]{2}+".r

val stringToFindExpression = "12 67 93 48 51"

val match1 = expressionToFind.findAllIn(stringToFindExpression)

// Driver Code
match1.foreach(println)