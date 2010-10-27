class Space < ActiveRecord::Base
  has_many :groups, :through => :group_spaces
  has_many :group_spaces
end
