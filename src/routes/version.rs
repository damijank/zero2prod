use actix_web::HttpResponse;

pub async fn version() -> HttpResponse {
    // HttpResponse::Ok().body(std::env::var("CARGO_PKG_VERSION").unwrap())
    HttpResponse::Ok().body("0.6.14")
}
