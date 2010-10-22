class Task < ActiveRecord::Base
  belongs_to :group
  def completed
    !!self.completed_at
  end
  
  def completed=(value)
    self.completed_at = (value.to_i == 0 ? nil : Time.now )
  end
  
  validates_presence_of :name, :on => :create, :message => "can't be blank"
end
