class UserValidator < ActiveModel::Validator
    
    # Validates the data of User model. Error message symbols is stored in config/locales.
    def validate (user)
        
        # First name validation
        if user.fname.blank?
            user.errors.add(:fname, :blank)
        end

        # Last name validation
        if user.lname.blank?
            user.errors.add(:lname, :blank)
        end

        # Email validation
        if user.email.blank?
            user.errors.add(:email, :blank)
        else
            if User.exists? email: user.email
                user.errors.add(:email, :taken)
            end
        end
    end
end

class User < ApplicationRecord
    has_secure_password
    validates_with UserValidator
end
