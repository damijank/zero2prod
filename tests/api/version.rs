use crate::helpers::spawn_app;
use zero2prod::built_info;

#[tokio::test]
async fn version_works() {
    // Arrange
    let app = spawn_app().await;
    let client = reqwest::Client::new();

    // Act
    let response = client
        .get(format!("http://{}/version", &app.address))
        .send()
        .await
        .expect("Failed to execute request.");
    let status = response.status();
    let content = response
        .text()
        .await
        .expect("Failed to decode response text");

    // Assert
    assert!(status.is_success());
    assert_eq!(built_info::PKG_VERSION, content);
}
