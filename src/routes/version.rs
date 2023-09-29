use crate::built_info;
use actix_web::HttpResponse;

pub async fn version() -> HttpResponse {
    HttpResponse::Ok().body(built_info::PKG_VERSION)
}
