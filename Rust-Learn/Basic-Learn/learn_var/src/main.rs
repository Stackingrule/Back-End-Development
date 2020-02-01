// 定义常量
const MAX_POINT: u32 = 10000;

fn main() {

    //1. 变量定义
    let a = 1;
    println!("a = {}", a);
    let b:u32 = 2;
    println!("b = {}", b);
    let mut c:u32 = 11;
    println!("c = {}", c);
    c = 12;
    println!("c = {}", c);

    // 2. 隐藏
    let c:f32 = 1.1;
    println!("c = {}", c);
    println!("Hello, world!");

    println!("MAX_POINT = {}", MAX_POINT);
}
