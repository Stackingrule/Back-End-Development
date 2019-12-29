// Creating a Vector #
val numVector = Vector(1,2,3,4,5)

numVector.foreach(println)


// Initializing an Empty Vector #
val emptyVector = Vector.empty

//Accessing an Element 
val patternVector = Vector("a~a", "b~b", "c~c")
val pattern = patternVector(1)

println(pattern)

// Appending an Element #
val patternVector = Vector("a~a", "b~b", "c~c")
val patternVector2 = patternVector :+ "d~d"

// Driver Code
patternVector2.foreach(println)

// Prepending an Element 
val patternVector = Vector("a~a", "b~b", "c~c")
val patternVector2 = patternVector :+ "d~d"
val patternVector3 = "1~1" +: patternVector2

// Driver Code
patternVector3.foreach(println)

//Vector Concatenation 
val patternVector = Vector("a~a", "b~b", "c~c")
val patternVector2 = patternVector :+ "d~d"
val patternVector3 = "1~1" +: patternVector2
val tempVector = Vector("e~e","f~f")
val patternVector4 = patternVector3 ++ tempVector

// Driver Code
patternVector4.foreach(println)

//