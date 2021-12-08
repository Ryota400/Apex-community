require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  config.storage :fog
  config.fog_provider = 'fog/aws'
  config.fog_directory  = 'apex-community'
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['AKIAUSQDYK3V5LAUQOWV'],
    aws_secret_access_key: ENV['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'],
    region: ENV['ap-northeast-1'],
    path_style: true
  }

end
