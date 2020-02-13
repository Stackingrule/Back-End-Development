package builtintypes.functions

fun main() {

    val c = add(1, 2)
    println(c)

}


fun add(x :Int, y: Int) : Int {
    return (x + y)
}