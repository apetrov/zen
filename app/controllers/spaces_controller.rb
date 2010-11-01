class SpacesController < ApplicationController
  make_resourceful do 
    build :all
    
    after :create,:destroy do
      @current_objects=current_objects()
    end
    
    response_for :show do |wants|
      wants.js do
        render :update do |page|
          page<<"$('#space').html('#{escape_javascript(render :partial=>"spaces/object",:object=>current_object)}')"
          page<<"createVisualEffects()"
        end
      end
    end
    
    response_for :create,:destroy do |wants|
      wants.js do
        render :update do |page|
          page<<"$('#spaces').html('#{escape_javascript(render :partial => "spaces/objects", :locals=>{:objects => @current_objects})}')"
          page<<"createVisualEffects()"
        end
      end
    end
  end
  
end
