class GroupsController < ApplicationController
  make_resourceful do
    build :all
    
    after :create do
      current_object.group_spaces.create(:space_id => params[:space_id]) if params[:space_id]
    end
    

    response_for :create do |wants|
      wants.html{redirect_to groups_path}
      wants.js do
        render :update do |page|
          page<<"$('#groups').append('#{escape_javascript(render :partial => "groups/object_with_id", :locals => {:object=>@current_object})}');"
          page['#new_group_button'].show
          page['#new_group'].hide
          page<<"createVisualEffects()"
        end
      end
    end

    response_for :show do |wants|
      wants.html{ render :partial=>"object",:locals=>{:object => current_object}}
    end

    response_for :destroy do |wants|
      wants.html{redirect_to groups_path}
      wants.js do
        render :update do |page|
          page["#group_#{@current_object.id}"].hide()
        end
      end
    end

    response_for :update do |wants|
      wants.html{ redirect_to groups_path}
      wants.js do
        render :update do |page|
          page<<"$('#group_#{current_object.id}').html('#{escape_javascript(render :partial => "groups/object", :object => @current_object)}');"
        end
      end
    end
  end
  
  def unbind
    current_object.group_spaces.for_space(params[:space_id]).destroy
    render :update do |page|
      page<<"$('#space').html('#{escape_javascript(render :partial=>"spaces/object",:object=>Space.find(params[:space_id]))}')"
      page<<"createVisualEffects()"
    end
  end

end
