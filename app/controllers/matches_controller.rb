class MatchesController < ApplicationController
  
  def index
    approved_matches = Match.all.where(status: "approved")
    @matches = []
    approved_matches.each do |matches|
        if matches.matcher_id == current_user.id
            @matches << matches
        elsif matches.matchee_id == current_user.id
            @matches << matches
        end
    end
    @matches
  end

  def show 
    @match = Match.find_by(matcher_id: current_user.id)
  end

end
