CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'                        
  config.fog_credentials = {
    provider:              'AWS',                        
    aws_access_key_id:     ENV['AWS_ACCESS_KEY_ID'],                        
    aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],                        
    use_iam_profile:       false,                         # optional, defaults to false
    region:                'ap-southeast-1',                  # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = 'airbnb-next'                                      
  config.fog_public     = false                                                # optional, defaults to true
  config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}" } # optional, defaults to {}
end