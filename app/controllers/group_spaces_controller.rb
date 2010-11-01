class GroupSpacesController < ApplicationController
  make_resourceful do 
    build :all
    belongs_to :space
    response_for :create do |wants|
      wants.html{ render :text=>"ok"}
      wants.js
    end
  end
  
end
