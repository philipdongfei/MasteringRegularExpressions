use regex::Regex;


fn main() {
    let re = Regex::new(r"^\d{4}-\d{2}-\d{2}$").unwrap();
    assert!(re.is_match("2010-03-14"));
    println!("Hello, world!");
}
