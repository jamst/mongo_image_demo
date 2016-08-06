class AvatarsController < ApplicationController

  def index
    @avatars = Avatar.order('created_at desc')
  end

  def new
    @avatar = Avatar.new
  end

  def create
    @avatar = Avatar.new
    file = params[:avatar][:attachment_file_name]
    filename = UploadFileService.new(file).call
    @avatar.attachment_file_name = filename
    if @avatar.save
      redirect_to action: 'index'
    else
      render :new
    end
  end

end
