CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'  
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: 'AKIAJSX5ECDGWZYDD74A',
    aws_secret_access_key: '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',
    use_iam_profile:       false,
    region: 'ap-southeast-1'
  }

  config.fog_directory  = 'decosan'
  # config.asset_host     =   "https://s3.amazonaws.com/#{config.fog_directory}"
  config.fog_public     =   false
  config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}" }
  # config.cache_storage = :fog
end
