module AttachmentPath
  
 extend ActiveSupport::Concern
 included do
	define_method "#{name.to_s.underscore}_attachment_path" do
	  self.ebuychem_attachments&.last&.attachment_path
	end

	define_method "#{name.to_s.underscore}_attachment_name" do
	  self.ebuychem_attachments&.last&.name
	end
 end

end