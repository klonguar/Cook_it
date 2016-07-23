class User < ActiveRecord::Base
    has_many :recipes # this methode create association with recipe
    before_save { self.email = email.downcase } # this will convert the email to a lowercase before it is saved in the DataBase
    validates :username, presence: true, 
                         uniqueness: { case_sensitive: false }, 
                         length: {minimum: 3, maximum: 50}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i 
    #VALID_EMAIL_REGEX code is for email validation , all code is from Michael Hartl Tutorial, Source: https://www.natashatherobot.com/ruby-email-validation-regex/
    validates :email, presence: true, 
                      length: {maximum: 105},
                      uniqueness: { case_sensitive: false }, 
                      format: { with: VALID_EMAIL_REGEX }
end

