class MatchesController < ApplicationController
  
  def index
    @matches = Match.my_matches
  end

  def show 
    @match = Match.find_by(matcher_id: current_user.id)
  end

end
