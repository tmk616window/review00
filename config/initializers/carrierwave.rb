require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

  CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: '',
    aws_secret_access_key: '',
    region: 'ap-northeast-1',
    path_style: true
  }

    config.fog_directory  = 'rails-photo-123'
    config.cache_storage = :fog
  end
  
  
  