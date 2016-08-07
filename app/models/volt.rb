class Volt < ActiveRecord::Base
    has_many :snips
    has_many :roles, dependent: :delete_all
    belongs_to :author, class_name: "User"
    validates :name, presence: true
    validates :project_name, presence: true
    validates :default_licence, presence: true
    def has_member?(user)
        roles.exists?(user_id: user)
    end
    [ :editor, :manager, :viewer].each do |role|
        define_method "has_#{role}?" do |user|
            roles.exists?(user_id: user, role: role)
        end
    end
end
