extern crate idna;

#[derive(rustler::NifMap)]
struct EncodeOpts {
    std3_rules: bool,
    transitional_processing: bool
}

fn build_cfg(opts: EncodeOpts) -> idna::Config {
    idna::Config::default()
        .use_std3_ascii_rules(opts.std3_rules)
        .transitional_processing(opts.transitional_processing)
}

#[rustler::nif]
fn _encode_ascii(string: &str, opts: EncodeOpts) -> Option<String> {
    let config = build_cfg(opts);

    match config.to_ascii(string) {
        Ok(string) => {
            Some(string.clone())
        }
        Err(_) => {
            None
        }
    }
}

#[rustler::nif]
fn _encode_unicode(string: &str, opts: EncodeOpts) -> Option<String> {
    let config = build_cfg(opts);

    match config.to_unicode(string) {
        (string, Ok(())) => {
            Some(string.clone())
        }
        (_, Err(_)) => {
            None
        }
    }
}

rustler::init!("Elixir.Uts46", [_encode_ascii, _encode_unicode]);
