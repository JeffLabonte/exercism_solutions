use chrono::{DateTime, TimeZone, Utc};


fn compute_one_billion_seconds() -> i64 {
    let base_ten: i64 = 10;
    base_ten.pow(9)
}

// Returns a Utc DateTime one billion seconds after start.
pub fn after(start: DateTime<Utc>) -> DateTime<Utc> {
    let after_dt = start.timestamp() + compute_one_billion_seconds();
    Utc.timestamp(after_dt, 0)
}
