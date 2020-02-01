val replaceIn = "8201530"
val replaced = replaceIn.replaceFirst("[01]", "X")

// Driver Code
println(replaced)


val regularExp = "H".r

val replaceIn = "Hello World!"

val replaced = regularExp.replaceFirstIn(replaceIn,"J")

// Driver Code
println(replaced)


val replaceIn = "8201530"
val replaced = replaceIn.replaceAll("[01]", "X")

// Driver Code
println(replaced)


val regularExp = "[a-z]+".r

val replaceIn = "dk79rx5c4lj2c8ge"

val replaced = regularExp.replaceAllIn(replaceIn,"1")

// Driver Code
println(replaced)