val pi = 3.14159F

println(f"the value of pi is $pi%.2f")

//  Width #
val testWidth = 123

println(f"Without specifying the width, we get $testWidth")
println(f"With specifying the width, we get $testWidth%10d")


val pi = 3.14159F

println(f"the value of pi is $pi%.2f")


val insertZeros = 1.23456F

println(f"Without Formatting: $insertZeros")
println(f"With Formatting: $insertZeros%010.3f")


val leftJustify = 12345

println(f"Without Formatting: $leftJustify is the output")
println(f"With Width: $leftJustify%10d is the output")
println(f"With Flag: $leftJustify%-10d is the output")