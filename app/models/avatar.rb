class Avatar < ActiveRecord::Base

  def attachment_path
    mongo_server = "#{MONGO_ATTACHMENT_SERVER['scheme']}://#{MONGO_ATTACHMENT_SERVER['host']}:#{MONGO_ATTACHMENT_SERVER['port']}"
    "#{mongo_server}/#{MONGO_ATTACHMENT_SERVER['bucket']}/#{attachment_file_name}"
  end

  include AttachmentPath

  # 采购合同附件
  has_many :ebuychem_attachments, as: :attachment
    
end
