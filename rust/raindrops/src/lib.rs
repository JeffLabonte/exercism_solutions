pub fn raindrops(n: u32) -> String {
    let mut noises = String::new();
    let mut no_factor = true;

    if n % 3 == 0 {
        no_factor = false;
        noises = format!("{}Pling", noises);
    }
    if n % 5 == 0 {
        no_factor = false;
        noises = format!("{}Plang", noises);
    }

    if n % 7 == 0 {
        no_factor = false;
       noises = format!("{}Plong", noises);
    }

    if no_factor {
       noises = format!("{}{}", noises, n.to_string());
    }

    noises
}
