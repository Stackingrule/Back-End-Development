// Creating a LazyList #
val myFirstLazyList = 1.5 #:: 2.5 #:: 3.5 #:: LazyList.empty

myFirstLazyList.foreach(println)


// Lazy Computation #
val wholeList = "orange"::"banana"::"apple"::"grape"::Nil

print(wholeList)

val wholeLazyList = "orange" #:: "banana" #:: "apple" #:: "grape" #:: LazyList.empty

print(wholeLazyList)


val list = List.from(1 to 100000000)


