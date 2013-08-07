Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
  # config.omniauth :google_oauth2, "APP_ID", "APP_SECRET", { access_type: "offline", approval_prompt: "" }
  
  require "omniauth-facebook"
  provider :facebook, "215666451922396", "80c8b913e94e0bace9d5dcc7005f91c0" 
  #, 
   #   :strategy_class => OmniAuth::Strategies::Facebook
  # config.omniauth :facebook, "215666451922396", "80c8b913e94e0bace9d5dcc7005f91c0",
  #     :client_options => {:ssl => {:ca_path => '/etc/ssl/certs'}}
  # config.omniauth :facebook, "215666451922396", "80c8b913e94e0bace9d5dcc7005f91c0",
  #     {:scope => 'email, offline_access', 
  #       :client_options => {:ssl => {:ca_file => '/usr/lib/ssl/certs/ca-certificates.crt'}}} 



 
end