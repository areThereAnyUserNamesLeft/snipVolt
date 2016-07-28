class Snip < ActiveRecord::Base
    validates :name, presence: true
    validates :summary, presence: true, length: {minimum: 10, maximum:144 }
    validates :code, presence: true, length: {minimum: 10 }
end
