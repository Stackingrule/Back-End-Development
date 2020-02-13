package builtintypes.sets

fun main() {

    val intList: List<Int> = listOf(1, 2, 3)
    val intList2: MutableList<Int> = mutableListOf(1, 2, 3, 4, 5, 6, 7)

    val map1: Map<String, Any> = mapOf("name" to "benny", "age" to 20)
    val map2: Map<String, Any> = mutableMapOf("name" to "benny", "age" to 20)

    val stringList = ArrayList<String>();
    for (i in 0 .. 10) {
        stringList.add("num:$i")
        // stringList += "num$i"
    }

    stringList[5] = "HelloWorld!"
    val valueAt5 = stringList[5]
    println(valueAt5)

    val map = HashMap<String, Int>()
    map["Hello"] = 10
    println(map["Hello"])

    val pair = "Hello" to "Kotlin"
    val pair2 = Pair("Hello", "Java")
    val first = pair.first
    val second = pair.second
    // 解构
    val (x, y) = pair

    val triple = Triple("x", 2, 3.0)
    val firstTriple = triple.first
    val secondTriple = triple.second
    val trirdTriple = triple.third
    val (x1, y1, z1) = triple

    println(firstTriple)

}