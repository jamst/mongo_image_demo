class EbuychemAttachment < ApplicationRecord

  belongs_to :attachment, polymorphic: true

  before_save :set_fields
  after_save :attachment_to_mongodb

  attr_accessor :attachment_file

  def set_fields
    ext = attachment_file.original_filename ? File.extname(attachment_file.original_filename) : ".pdf"
    self.path = "#{SecureRandom.uuid}#{ext}"
    self.content_type = attachment_file.content_type
    self.file_size = attachment_file.size
    self.name = attachment_file.original_filename
  end

  def store_dir
    "uploads/#{self.attachment_type.to_s.underscore}/path/#{WhUtils.split_id(self.attachment_id,false)}"
  end

  def attachment_path
    mongo_server = "#{MONGO_ATTACHMENT_SERVER['scheme']}://#{MONGO_ATTACHMENT_SERVER['host']}:#{MONGO_ATTACHMENT_SERVER['port']}"
    "#{mongo_server}/#{MONGO_ATTACHMENT_SERVER['bucket']}/#{store_dir}/#{self.path}"
  end

  def attachment_to_mongodb
    # 存到mongodb gridfs，这里指定了fs这个桶，也可指向ak47
    grid = $mongo.database.test
    grid.upload_from_stream("#{store_dir}/#{self.path}", attachment_file)
  end

end