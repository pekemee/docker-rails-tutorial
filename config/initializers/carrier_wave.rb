if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {

      :provider              => 'AWS',
      :region                => 'ap-northeast-1',
      :aws_access_key_id     => 'AKIA5B44PNDE4TL5I7OV',
      :aws_secret_access_key => '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'
    }
    config.fog_directory     =  'docker-rails-tutorial-bucket'
  end
end
