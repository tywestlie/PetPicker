class Api::V1::Users::MatchesController < ApplicationController

  before_action :validate_token

  def index
    user = User.find(params['id'])
    matches = user.matches
    render json: matches
  end

  def update
    conn = Connection.find(params[:match_id])
    conn.status = 'match'
    conn.save
    render json: { message: "You've created a match!" }
  end
end
