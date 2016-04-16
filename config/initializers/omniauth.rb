
OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1717263175221762', 'fae3165693121f0c50ab8ed7c4bff0b4'
end