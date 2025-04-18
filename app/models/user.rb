class  User < ApplicationRecord
    has_secure_password


    validates :email, presence: true, uniqueness: true

    
    VALID_TEL_REGEX = /\A\d{9,15}\z/
      
    validates :tel, format: { with: VALID_TEL_REGEX, message: "không hợp lệ" }, allow_blank: true
    validates :tel, uniqueness: true, allow_blank: true
end