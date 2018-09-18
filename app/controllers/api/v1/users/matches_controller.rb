class Api::V1::Users::MatchesController < ApplicationController
  def index
    user = User.find(params["id"])
    results = user.get_matches
    render json: results
  end

  def update
    conn = Connection.find(params[:match_id])
    conn.status = 'match'
    conn.save
    render json: {message: "You've created a match!"}
  end
end
