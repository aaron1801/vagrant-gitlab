external_url "http://localhost:8888"

nginx['redirect_http_to_https'] = false

gitlab_rails['omniauth_enabled'] = false
gitlab_rails['omniauth_providers'] = [
  {
    "name" => "google_oauth2",
    "app_id" => "app id",
    "app_secret" => "app secret",
    "args" => { "access_type" => "offline", "approval_prompt" => "" }
  }
]

nginx['ssl_certificate'] = "/etc/gitlab/ssl/snakeoil.crt"
nginx['ssl_certificate_key'] = "/etc/gitlab/ssl/snakeoil.key"

gitlab_rails['email_from'] = "admin@localhost"
gitlab_rails['support_email'] = "admim@localhost"
