class TasksController < ApplicationController
  make_resourceful do 
    build :all
    belongs_to :group
        
    response_for :create,:update,:show do |wants|
      wants.html{ redirect_to groups_path}
      wants.js do
        render :update do |page|
          page<<"$('#group_#{current_object.group_id}').html('#{escape_javascript(render :partial => "groups/object", :object => @current_object.group)}');"
        end
      end
    end
    
    
    
  end  
end
