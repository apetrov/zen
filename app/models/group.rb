class Group < ActiveRecord::Base
  has_many :tasks, :order => "name" do
    def uncompleted
      find(:all,:conditions=>["completed_at is null"])
    end
    
    def completed
      find(:all,:conditions=>["completed_at is not null"])
    end    
  end
    
  validates_uniqueness_of :name
  has_many :group_spaces do
    def for_space(space_id)
      find(:first,:conditions=>{:space_id => space_id})
    end
  end
  has_many :spaces, :through => :group_spaces 
  
  def available_spaces
    Space.find(:all,:conditions=>["id not in (select space_id from group_spaces where group_id = ?)",self.id])
  end  
end
