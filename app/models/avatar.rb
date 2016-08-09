class Avatar < ActiveRecord::Base

  def attachment_path
    s = "#{IMG_SERVER['scheme']}://#{IMG_SERVER['host']}:#{IMG_SERVER['port']}"
    "#{s}/nb/#{attachment_file_name}"
  end

  # 采购合同附件
  has_one :purchase_contract,:class_name => "PurchaseContract",:foreign_key => "attachment_type_id"
  #has_one :purchase_contract,-> { where attachment_type: 'PurchaseContract' }, inverse_of: :avatar, dependent: :destroy, autosave: true
  #delegate :attachment, :attachment=, to: :purchase_contract, prefix: true
  
end
