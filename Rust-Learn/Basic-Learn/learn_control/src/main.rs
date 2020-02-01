fn main() {

    // if
    println!("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
    let y = 12;
    if y == 12 {
        println!("y == 12", );
    }

    // if-else
    println!("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
    let a = 2;
    if a == 1 {
        println!("a == 1");
    } else if a ==0{
        println!("a != 0");
    } else {
        println!("a != 1");
    }

    // let中使用if
    println!("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
    let condition = true;
    let x = if condition {
        // 5; ----> 错误
        5
    } else {
        6
    };
    println!("x = {}", x);

    // loop
    println!("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
    let mut count = 0;
    loop {
        println!("in loop");
        if count == 10 {
            break;
        }

        count += 1;
    }

    let result = loop {
        count += 1;
        if count == 20 {
            break count*2;
        }
    };
    println!("result = {}", result);

    // while
    println!("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
    let mut i = 0;
    while i != 10 {
        i += 1;
    }
    println!("i = {}", i);

    // for
    println!("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
    let arr:[u32; 5] = [1, 2, 3, 4, 5];
    for e in arr.iter() {
        println!("e = {}", e);
    }

    println!("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
    for e in &arr {
        println!("e = {}", e);
    }

    println!("Hello, world!");
}
