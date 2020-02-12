package builtintypes.arrays

fun main() {

    val a = IntArray(5)
    println(a.size)

    val b = ArrayList<String>()
    println(b.size)

    val c0 = intArrayOf(1, 2, 3, 4, 5)
    val c1 = IntArray(5) {3 * (it + 1)}

    println(c1.contentToString())

    val d = arrayOf("Hello", "World!")
    d[1] = "Kotlin"
    println("${d[0]}, ${d[1]}")

    val e = floatArrayOf(1f, 2f, 3f, 4f, 5f)
    for (item in e) {
        println(item)
    }

    e.forEach {
        println(it)
    }

    if(1f in e){
        println("1f exists in variable 'e'")
    }

    if(1.2f !in e){
        println("1.2f not exists in variable 'e'")
    }



}