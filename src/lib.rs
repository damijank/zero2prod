pub mod configuration;
pub mod domain;
pub mod routes;
pub mod startup;
pub mod telemetry;

pub mod built_info {
    include!(concat!(env!("OUT_DIR"), "/built.rs"));
}
