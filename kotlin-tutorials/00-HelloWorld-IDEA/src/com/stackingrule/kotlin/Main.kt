package com.stackingrule.kotlin

fun main() {
    println("Hello World!!!")

    runBlock {
        List(1000) {
            println("HelloWorld")
        }
    }
}

fun runBlock(block:()-> Unit) {

    var startTime = System.currentTimeMillis()

    block()

    println(System.currentTimeMillis() - startTime)

}