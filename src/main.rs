use std::net::TcpListener;
use zero2prod::run;

#[tokio::main]
async fn main() -> Result<(), std::io::Error> {
    let ip = "127.0.0.1";
    let port = "8000";
    let address = format!("{}:{}", ip, port);

    let listener = TcpListener::bind(&address).expect(&format!("Failed to bind {}", &address));

    run(listener)?.await
}
