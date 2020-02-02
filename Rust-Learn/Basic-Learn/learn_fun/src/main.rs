fn main() {

    other_fun();
    other_fun1(1, 2);
    let d =other_fun2(2, 3);
    println!("d = {}", d);
    let ret = other_fun3(10, 1);
    println!("ret = {}", ret);

    // 语句是执行一些操作但不返回值的指令
//    let y = 1;
//    let x = (let y = 1);

    // 表达式会计算一些值
    let y = {
        let x = 1;
        x + 1
    };
    println!("y = {}", y);

    println!("Hello, world!");
}

// 定义函数
fn other_fun() {
    println!("This is a Function!");
}

fn other_fun1(a: i32, b: i32) {
    println!("a = {}", a);
    println!("b = {}", b);
}

fn other_fun2(a: i32, b: i32) -> i32 {
    let ret = a + b;
    return ret;
}

fn other_fun3(a: i32, b: i32) -> i32 {
    let ret = a - b;
    ret
}