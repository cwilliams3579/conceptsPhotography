require 'carrierwave/orm/activerecord'
if Rails.env.production?

  CarrierWave.configure do |config|

    config.fog_credentials = {

      :provider => 'AWS',

      :aws_access_key_id => ENV[' AKIAICBLR35TD2TIVSBA'],

      :aws_secret_access_key => ENV['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']

    }

    config.fog_directory = ENV['S3_BUCKET']

  end

end
