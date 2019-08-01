#![allow(unused_imports)]

#[macro_use] extern crate log;
#[macro_use] extern crate serde_json;
#[macro_use] extern crate serde_derive;


extern crate env_logger;
extern crate futures;
extern crate indyrs as indy;
extern crate rand;

fn main() {
    env_logger::init();

    info!("starting up");
}
