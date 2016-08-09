class UploadFileService

  def initialize(file)
    @file = file
  end

  def call
    # 指定了fs这个桶，也可指向ak47
    #grid = $mongo.database.fs
    #grid.upload_from_stream(filename, @file)
    res = {
      filename: filename,
      content_type: @file.content_type
    }
  end

  private

  def filename
    return @filename if @filename.present?
    ext = File.extname(@file.original_filename)
    @filename = "#{SecureRandom.uuid}#{ext}"
  end

end
