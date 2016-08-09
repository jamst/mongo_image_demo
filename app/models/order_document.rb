class OrderDocument < ApplicationRecord

  #belongs_to :attachment_type, polymorphic: true
  def division_type
    self.update_columns :attachment_type => self.class,
                        :attachment_content_size => attachment_file.size,
                        :attachment_content_type => attachment_file.content_type
  end

  def store_dir
    "#{self.class.to_s.underscore}/#{avatar.id}"
  end


  def attachment_to_mongodb
    ext = attachment_file.original_filename ? File.extname(attachment_file.original_filename) : ".pdf"
    filename = "#{SecureRandom.uuid}#{ext}"
    
    # 指定了fs这个桶，也可指向ak47
    grid = $mongo.database.fs
    grid.upload_from_stream("#{store_dir}/#{filename}", attachment_file)

    self.update_columns :attachment => filename,
                        :attachment_type_id => avatar.id
  end

end