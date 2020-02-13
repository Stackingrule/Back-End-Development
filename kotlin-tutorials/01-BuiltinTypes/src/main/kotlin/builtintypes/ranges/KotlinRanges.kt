package builtintypes.ranges

fun main() {

    val intRange = 1 .. 10 // [1, 10]
    val charRange = 'a' .. 'z' //
    val longRange = 1L .. 10L
    val floatRange = 1f .. 2f
    val doubleRange = 1.0 .. 2.0

    for (element in intRange) {
        println(element)
    }

    intRange.forEach{
        println(it)
    }

    if (3 in intRange) {
        println("3 in intRange")
    }

    if (3.0 in doubleRange) {
        println("3.o in doubleRange")
    }

    println(intRange.joinToString())
    println(floatRange.toString())


    val array = intArrayOf(1, 3, 5, 7, 9, 11)
    for (i in 0 until array.size) {
        println(array[i])
    }

    for (i in array.indices) {
        println(i)
    }

    val uintRange = 1U .. 10U


    val intRangeExclusive = 1 until 10 // [1, 10)
    val charRangeExclusive = 'a' until 'z'
    val longRangeExclusive = 1L until 100L

    println(intRangeExclusive.joinToString())

    // 倒序
    val intRangeReverse = 10 downTo 1 // [10, 9, ..., 1]
    val charRangeReverse = 'z' downTo 'a' //
    val longRangeReverse = 100L downTo 1L //

    val intRangeWithStep = 1 .. 10 step 2
    val charRangeWithStep = 'a' .. 'z' step 2
    val longRangeWithStep = 1L .. 100L step 5



}