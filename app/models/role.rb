class Role < ActiveRecord::Base
  belongs_to :user
  belongs_to :volt

  def self.available_roles
    %w(manager editor viewer)
end
end
