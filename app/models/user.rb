class User < ActiveRecord::Base
    validates :username, presence: true, 
                         uniqueness: { case_sensitive: false }, 
                         length: {minimum: 3, maximum: 50}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i 
    validates :email, presence: true, 
                      length: {maximum: 105},
                      uniqueness: { case_sensitive: false }, 
                      format: { with: VALID_EMAIL_REGEX }
end

#VALID_EMAIL_REGEX code is for email validation , all code is from Michael Hartl Tutorial, Source: https://www.natashatherobot.com/ruby-email-validation-regex/