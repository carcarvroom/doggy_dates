class MatchesController < ApplicationController
  

  def show 
    @match = Match.find_by(matcher_id: current_user.id)
  end
end
