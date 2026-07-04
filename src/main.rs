#![feature(rustc_private)]

extern crate rustc_driver;

use std::process::ExitCode;

fn main() -> ExitCode {
    rustc_driver::main()
}
