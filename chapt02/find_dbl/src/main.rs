fn main() {
    if let Err(e) = find_dbl::get_args().and_then(find_dbl::run) {
        eprintln!("{}", e);
        std::process::exit(1);
    }

}
