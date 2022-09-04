extern crate idna;

#[derive(rustler::NifMap)]
struct EncodeOpts {
    std3_rules: bool,
    transitional_processing: bool
}

#[rustler::nif]
fn _encode(string: &str, opts: EncodeOpts) -> Option<String> {
    let config =  idna::Config::default()
    .use_std3_ascii_rules(opts.std3_rules)
    .transitional_processing(opts.transitional_processing);

    match config.to_ascii(string) {
        Ok(string) => {
            Some(string.clone())
        }
        Err(error) => {
            println!("Error encoding name: {:?}", error);
            None
        }
    }
}

rustler::init!("Elixir.Uts46", [_encode]);
