OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '323020157854665', 'e4b6d009e67f1a1f12313824dcbeb45c'
end

# Rails.application.config.middleware.use OmniAuth::Builder do
#   provider :facebook, '323020157854665', 'e4b6d009e67f1a1f12313824dcbeb45c', {:client_options => {:ssl => {:ca_path => "/etc/ssl/certs"}}}
# end
#
# Rails.application.config.middleware.use OmniAuth::Builder do
#   # This cert location is only for Heroku
#   provider :facebook, '323020157854665', 'e4b6d009e67f1a1f12313824dcbeb45c', {:client_options => {:ssl => {:verify => false}}}
# end