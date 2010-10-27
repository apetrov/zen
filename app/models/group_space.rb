class GroupSpace < ActiveRecord::Base
  belongs_to :group
  belongs_to :space
  validates_uniqueness_of :group_id, :scope => :space_id
end
