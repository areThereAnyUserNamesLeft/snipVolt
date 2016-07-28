class Volt < ActiveRecord::Base
    validates :name, presence: true
    validates :project_name, presence: true
    validates :default_licence, presence: true
end
