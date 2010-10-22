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
  
end
