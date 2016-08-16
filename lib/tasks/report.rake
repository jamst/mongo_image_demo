namespace :report do

  task test_file: :environment do
      root = Rails.root.join("public/test/").to_s
      Dir["#{root}**/*"].each do |f|
        file = File.open(f) 
        next if File.directory?(f)
        next if f =~ /.DS_Store/
        @avatar = Avatar.new
            grid = $mongo.database.test
            file_name = f.sub(root,'')
            file_name = "jamst/customer_order/#{file_name}"
            grid.upload_from_stream(file_name, file)
            @avatar.attachment_file_name = file_name
            @avatar.attachment_content_type = ".jpg"
            @avatar.save
            puts "Files: #{file_name}" 
      end
  end

end
