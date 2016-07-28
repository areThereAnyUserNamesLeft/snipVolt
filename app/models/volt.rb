class Volt < ActiveRecord::Base
    has_many :snips
    belongs_to :author, class_name: "User"
    validates :name, presence: true
    validates :project_name, presence: true
    validates :default_licence, presence: true
end