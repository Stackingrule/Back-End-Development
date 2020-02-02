fn main() {

    let x: i32 = 5;
    {
        let y: i32 = 6;
        println!("x = {}", x);
        println!("y = {}", y);
    }

    {
        let mut s1 = String::from("hello");
        s1.push_str(" world!");
        println!("s1 = {}", s1);

        let s2 = s1;
        println!("s2 = {}", s2);

        // clone
        let s3 = s2.clone();

        println!("s3 = {}", s3);
    }

    // copy
    let a = 1;
    let b = a;
    println!("a = {}, b = {}", a, b);
    println!("Hello, world!");
}
