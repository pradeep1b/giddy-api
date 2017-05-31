require 'shrine'
require 'shrine/storage/file_system'
require 'shrine/storage/s3'

if Rails.env.production?
  s3_options = {
    host_name:         Rails.application.secrets.aws_host_name,
    access_key_id:     Rails.application.secrets.aws_access_key_id,
    secret_access_key: Rails.application.secrets.asw_secret_access_key,
    region:            Rails.application.secrets.aws_region,
    bucket:            Rails.application.secrets.s3_bucket_name,
  }

  Shrine.storages = {
    cache: Shrine::Storage::S3.new(prefix: 'cache', **s3_options),
    store: Shrine::Storage::S3.new(prefix: 'store', **s3_options),
  }

  Shrine.plugin :default_url_options, store: {host: Rails.application.secrets.cloudfront_url}

elsif Rails.env.development?
  Shrine.storages = {
    cache: Shrine::Storage::FileSystem.new('public', prefix: 'uploads/cache'), # temporary
    store: Shrine::Storage::FileSystem.new('public', prefix: 'uploads/store'), # permanent
  }
  Shrine.plugin :default_url_options, store: {host: 'http://localhost:3000'}
end

Shrine.plugin :activerecord
Shrine.plugin :logging if Rails.env.development? || Rails.env.production?
Shrine.plugin :backgrounding
Shrine.plugin :determine_mime_type

Shrine::Attacher.promote { |data| AttacherPromoteWorker.perform_async(data) }
Shrine::Attacher.delete { |data| AttacherDeleteWorker.perform_async(data) }
