
fn main() {

    // bool
    let is_true: bool = true;
    println!("is_true = {}", is_true);
    let is_false:bool = false;
    println!("is_false = {}", is_false);

    // char 在rust中char是32位
    // char可以是一个汉字
    let a = 'a';
    println!("a = {}", a);
    let b = "你";
    println!("b = {}", b);

    // 数字类型
    // i32 i8 i16 i64 u8 u16 u32 u64 f32 f64
    let c: i8 = -111;
    println!("c = {}", c);
    let d: f32 = 3.1415;
    println!("d = {}", d);

    // 自适应类型：isize usize
    println!("max = {}", usize::max_value());
    println!("max = {}", isize::max_value());

    // 数组
    //[Type; size], size也是数组类型的一部分
    let arr: [u32; 5] = [1, 2, 3, 4, 5];
    println!("arr[1] = {}", arr[1]);

    // 元组
    let tup: (i32, f32, char) = (3, -3.69, '好');
    println!("{}", tup.0);
    println!("{}", tup.1);
    println!("{}", tup.2);

    let tup = (3, -3.69, '好');
    println!("{}", tup.0);
    println!("{}", tup.1);
    println!("{}", tup.2);

    let (x, y, z) = tup;
    println!("{}", x);
    println!("{}", y);
    println!("{}", z);

    println!("Hello, world!");
}

fn show(arr:[u32; 5]) {
    println!("");
    for i in &arr {
        println!("{}", i);
    }
}