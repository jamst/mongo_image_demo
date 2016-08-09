class CreateTableOrderDocuments < ActiveRecord::Migration
  def change
    create_table :order_documents do |t|
      t.string   "attachment", comment: '附件文件名'
      t.string   "attachment_content_size", comment: '附件大小'
      t.string   "attachment_content_type", comment: '附件后缀名'
      t.string   "attachment_type", comment: '关联模块'
      t.integer  "attachment_type_id", comment: '关联模块ID'
      t.timestamps
    end
  end
end
