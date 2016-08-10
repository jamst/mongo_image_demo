class WhUtils
  class << self
    def split_id(id,with_id = true)
      t = ("%08d" % id.to_i).scan(/(\d{2})/).flatten
      t = t[0,3]
      t << id if with_id
      t.join('/')
    end
    ALL_CHARS = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
    LETTERS = ("a".."z").to_a + ("A".."Z").to_a
    NUMBERS = ("0".."9").to_a
    def get_random(len,chars=[])
      chars = NUMBERS if chars.blank?
      cs = []
      1.upto(len) { |i| cs << chars[rand(chars.size-1)] }
      return cs.join('')
    end

    def get_order_no
      with_validate("01#{Time.new.strftime("%y%m%d")}#{get_random(7)}")
    end

    #def get_invoice_no
      #"#{Time.new.strftime("%Y%m%d")}#{get_random(3,LETTERS)}"
    #end

    def get_batch_no
      with_validate("02#{Time.new.strftime("%y%m%d")}#{get_random(7)}")
    end

    def get_shipment_no
      with_validate("03#{Time.new.strftime("%y%m%d")}#{get_random(7)}")
    end
    #def get_quotation_no
      #"EQ#{Time.new.strftime("%y%m")}#{get_random(6)}"
    #end

    #def get_inquiry_no
      #"EBE#{Time.new.strftime("%y")}#{get_random(5)}"
    #end

    #def get_invoice_no_outland
      #"EBI#{Time.new.strftime("%Y%m%d")}#{get_random(1,LETTERS)}#{get_random(5,NUMBERS)}"
    #end

    #def get_ebuychem_cus_order_no
      #"RD#{get_random(8,NUMBERS)}"
    #end

    #def get_point_order_no
      #"PO#{get_random(8,NUMBERS)}"
    #end

    #def get_sale_contract_no(sequence)
      #"EB#{Time.new.strftime("%Y%m%d")}#{sequence}"
    #end
    #

    def with_validate(no)
      "#{no}#{generate_validate_code(no)}"
    end

    def generate_validate_code(no)
      no = no.to_s.strip.gsub(/[^\d]+/,'')
      nums = no.reverse.split(//)
      sum = 0
      nums.each_with_index do |n,idx|
        sum += n.to_i * (idx + 1)
      end

      sum % 10
    end

    def check_no(no)
      no = no.to_s.strip.gsub(/[^\d]+/,'')
      return false if no.blank?
      nums = no.reverse.split(//)
      validate = nums.shift
      sum = 0
      nums.each_with_index do |n,idx|
        sum += n.to_i * (idx + 1)
      end

      sum % 10 == validate.to_i ? no : false
    end

    def check_cas(cas)
      cas = cas.to_s.strip.gsub(/[^\d\-]+/,'')
      return false if cas.blank?
      seg = cas.to_s.split('-')
      return false if seg.size != 3
      return false if seg[1].size != 2
      return false if seg[2].size != 1

      nums = "#{seg[0]}#{seg[1]}".reverse.split(//)
      sum = 0
      nums.each_with_index do |n,idx|
        sum += n.to_i * (idx + 1)
      end

      sum % 10 == seg[2].to_i ? cas : false
    end
  end
end
