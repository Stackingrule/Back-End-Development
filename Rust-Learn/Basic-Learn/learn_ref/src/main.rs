//fn main() {
//
//    let s1 = gives_ownership();
//    println!("s1 = {}", s1);
//
//    let mut s2 = String::from("hello World!");
//    println!("s2 = {}", s2);
//
//    let s3 = takes_and_gives_back(s2);
//    println!("s3 = {}", s3);
//
//    s2 = takes_and_gives_back(s3);
//    println!("s2 = {}", s2);
//
//    println!("Hello, world!");
//}
//
//fn gives_ownership() -> String {
//    let s = String::from("hello");
//    s
//}
//
//fn takes_and_gives_back(s: String) -> String {
//    s
//}



/**
 * 引用
 */


fn main() {
    let s1 = String::from("hello world");
    let len = calcute_length(&s1);
    println!("len = {}", len);

    let mut s2 = String::from("Hello ");
    modify_s(&mut s2);
    println!("s2 = {}", s2);

    let ms = &mut s2;
    println!("ms = {}", ms);

    let s3 = String::from("hello");

    let (s4, len) = calculate_length(s3);

    println!("The length of '{}' is {}.", s4, len);

    println!("s1 = {}", s1);
}

fn calcute_length(s: &String) -> usize {
    s.len()
}

fn modify_s(s: &mut String) {
    s.push_str(", end")
}

fn calculate_length(s: String) -> (String, usize) {
    let length = s.len(); // len() returns the length of a String

    (s, length)
}