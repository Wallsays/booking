Rails.application.config.middleware.use OmniAuth::Builder do
  
  require "omniauth-facebook"

  case Rails.env
    when "development"
      provider :facebook, '515632468516870', '12eb33be0069042efb658537afdc7f2a'
      # provider :google_oauth2, "APP_ID", "APP_SECRET", { access_type: "offline", approval_prompt: "" }

    when "production"
      # provider :facebook, '515632468516870', '12eb33be0069042efb658537afdc7f2a'
      # provider :facebook, '215666451922396', '80c8b913e94e0bace9d5dcc7005f91c0'

      # config.omniauth :facebook, "215666451922396", "80c8b913e94e0bace9d5dcc7005f91c0",
      #     :client_options => {:ssl => {:ca_path => '/etc/ssl/certs'}}

      provider :facebook, "515632468516870", "12eb33be0069042efb658537afdc7f2a",
          {:scope => 'email, offline_access', 
            :client_options => {:ssl => {:ca_file => '/usr/lib/ssl/certs/ca-certificates.crt'}}} 
  end



 
end
