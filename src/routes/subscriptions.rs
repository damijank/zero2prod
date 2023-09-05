use actix_web::{web, HttpResponse};

#[derive(serde::Deserialize)]
pub struct FormData {
    email: String,
    name: String,
}

pub async fn subscribe(form: web::Form<FormData>) -> HttpResponse {
    println!(
        "New subscriber: {} / {}",
        form.name.as_str(),
        form.email.as_str()
    );
    HttpResponse::Ok().finish()
}
