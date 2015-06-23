CarrierWave.configure do |config|
  if Rails.env.development? || Rails.env.test?
    config.storage = :file
  else
    config.storage = :fog
    config.fog_credentials = {
      :provider               => 'AWS',
      :aws_access_key_id      => Figaro.env.s3_access,
      :aws_secret_access_key  => Figaro.env.s3_secret,
      # :region                 => 'us-west-1'
    }
    config.fog_directory  = Figaro.env.s3_bucket
  end
end
