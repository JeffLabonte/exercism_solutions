fn is_divisible_by_x(x: u32, n:& u32) -> bool{
    n % x == 0
}

pub fn raindrops(n: u32) -> String {
    let mut noises = String::new();
    let mut no_factor = true;

    if is_divisible_by_x(3, &n) {
        no_factor = false;
        noises = format!("{}Pling", noises);
    }
    if is_divisible_by_x(5, &n) {
        no_factor = false;
        noises = format!("{}Plang", noises);
    }

    if is_divisible_by_x(7, &n) {
        no_factor = false;
       noises = format!("{}Plong", noises);
    }

    if no_factor {
       noises = format!("{}{}", noises, n.to_string());
    }

    noises
}
