class PurchaseContract < OrderDocument
  belongs_to :avatar, foreign_key: :attachment_type_id , inverse_of: :purchase_contract , touch:true

  attr_accessor :attachment_file,:avatar

  after_save :attachment_to_mongodb

  after_save :division_type

  # 测试多态
  # aa = PurchaseContract.new(avatar: @avatar,attachment_file: file)
  # aa.save

end