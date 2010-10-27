class GroupSpacesController < ApplicationController
  make_resourceful do 
    build :all
    belongs_to :space
  end
  
end
