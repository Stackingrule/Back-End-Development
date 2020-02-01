val stringMatch = "ab7"
val match1 = stringMatch.matches("[a-zA-Z0-9]{4}")

// Driver Code
println(match1)

val string1 = "Educative"
val string2 = "educative"

val comparingStrings = string1.equals(string2)

// Driver Code
println(comparingStrings)


val string1 = "Educative"
val string2 = "educative"

val comparingStrings = string1.equals(string2)

// Driver Code
println(comparingStrings)


val string1 = "This is Educative"
val string2 = "Hello Scala"  
val string3 = "Hello Scala" 

val lexiCompare1 = string1.compareTo(string2) //string2-string1
val lexiCompare2 = string2.compareTo(string3) //string3-string2

// Driver Code
println(s"Comparing string1 and string2: $lexiCompare1")  
println(s"Comparing string2 and string3: $lexiCompare2") 



val string1 = "Educative"
val string2 = "educative"

val comparingStrings = string1.equalsIgnoreCase(string2)

// Driver Code
println(comparingStrings)



