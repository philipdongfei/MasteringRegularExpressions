fn main() {
    if let Err(e) = testing_engine_type::get_args().and_then(testing_engine_type::run) {
        eprintln!("{}", e);
        std::process::exit(1);
    }
}
