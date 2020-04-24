require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: 'AKIA57SARZ7UGJGYT34L',
      aws_secret_access_key: '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',
      region: 'ap-northeast-1'  
    }
    config.fog_directory  = 'tmk616window' 
  end
  # 日本語ファイル名の設定
  CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/ 
end
