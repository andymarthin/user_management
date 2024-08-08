require 'shrine'
require 'shrine/storage/s3'
require 'shrine/storage/file_system'

s3 = Shrine::Storage::S3.new(
  bucket: 'user-management', # required
  region: 'us-east-1', # required
  access_key_id: 'xaisua34X7BDlWTHVapf',
  secret_access_key: 'Pdtm8Ig3lp3U4ZKtEFdFUChNyM5BqjjMUmcuRmzr',
  endpoint: 'http://localhost:9000/user-management/'
)
Shrine.storages = {
  cache: Shrine::Storage::FileSystem.new('public', prefix: 'uploads/cache', directory_permissions: 0o755,
                                                   permissions: 0o644),
  store: s3 # permanent
}

Shrine.plugin :activerecord           # loads Active Record integration
Shrine.plugin :cached_attachment_data # enables retaining cached file across form redisplays
Shrine.plugin :restore_cached_data    # extracts metadata for assigned cached files
