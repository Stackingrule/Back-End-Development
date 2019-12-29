import scala.collection.mutable.ArrayBuffer

val myFirstArrayBuffer = ArrayBuffer(1,2,3,4,5)

// Driver Code
myFirstArrayBuffer.foreach(println)



val newArrayBuff = new ArrayBuffer[Int]()

newArrayBuff += 6
newArrayBuff += 15
newArrayBuff += 78
newArrayBuff += 4
newArrayBuff += 32
newArrayBuff += 11

// Driver Code
newArrayBuff.foreach(println)



val newArrayBuff = new ArrayBuffer[Int]()

newArrayBuff += 6
newArrayBuff += 15
newArrayBuff += 78
newArrayBuff += 4
newArrayBuff += 32
newArrayBuff += 11

newArrayBuff -= 78 //Remove the element with the value 78

// Driver Code
newArrayBuff.foreach(println)



val newArrayBuff = new ArrayBuffer[Int]()

newArrayBuff += 6
newArrayBuff += 15
newArrayBuff += 78
newArrayBuff += 4
newArrayBuff += 32
newArrayBuff += 11

newArrayBuff -= 78

newArrayBuff.remove(4) //Remove the element at the 4th index

// Driver Code
newArrayBuff.foreach(println)



val newArrayBuff = new ArrayBuffer[Int]()

newArrayBuff += 6
newArrayBuff += 15
newArrayBuff += 78
newArrayBuff += 4
newArrayBuff += 32
newArrayBuff += 11

newArrayBuff -= 78

newArrayBuff.remove(4)

newArrayBuff.clear() //Remove all the elements from newArrayBuff

// Driver Code
newArrayBuff.foreach(println)