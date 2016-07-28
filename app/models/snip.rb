class Snip < ActiveRecord::Base
    
    belongs_to :author, class_name: "User"
    validates :name, presence: true
    validates :summary, presence: true, length: {minimum: 10, maximum:144 }
    validates :code, presence: true, length: {minimum: 10 }
end
