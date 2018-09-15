class Api::V1::Users::MatchesController < ApplicationController

  def index
    user = User.find(params["id"])
    results = user.get_matches
    render json: results
  end
end
