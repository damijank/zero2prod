use sqlx::PgPool;
use std::net::TcpListener;
use zero2prod::configuration::get_configuration;
use zero2prod::startup::run;

#[tokio::main]
async fn main() -> Result<(), std::io::Error> {
    let ip = "127.0.0.1";
    let configuration = get_configuration().expect("Failed to read configuration.");
    let connection_pool = PgPool::connect(&configuration.database.connection_string())
        .await
        .expect("Failed to connect to Postgres.");

    let address = format!("{}:{}", ip, configuration.application_port);
    let expect_message = format!("Failed to bind {}", &address);

    let listener = TcpListener::bind(&address).expect(&expect_message);

    run(listener, connection_pool)?.await
}
