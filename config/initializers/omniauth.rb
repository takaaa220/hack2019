Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter,
    Rails.application.secrets.twitter["key"],
    Rails.application.secrets.twitter["secret_key"]
end
