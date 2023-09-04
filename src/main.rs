use std::net::TcpListener;
use zero2prod::run;

#[tokio::main]
async fn main() -> Result<(), std::io::Error> {
    let ip = "127.0.0.1";
    let port = "8000";

    let address = format!("{}:{}", ip, port);
    let expect_message = format!("Failed to bind {}", &address);

    let listener = TcpListener::bind(&address).expect(&expect_message);

    run(listener)?.await
}
