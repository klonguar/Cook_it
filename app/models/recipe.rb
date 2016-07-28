class Recipe < ActiveRecord::Base
    belongs_to :user #this methode create association with user 
    validates :title, presence: true, 
                      length: {minimum: 3, maximum: 50}
    
    validates :description, presence: true, 
                            length: {minimum: 10, maximum: 10000}
    
    validates :user_id, presence: true #this will ensure every time the recipe is create the user_id is present
end
