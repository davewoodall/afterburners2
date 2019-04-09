# frozen_string_literal: true

class Api::V1::RanksController < ApplicationController
  def index
    @ranking = RankingService.new(rank_params)
  rescue ActiveRecord::StatementInvalid
    render json: { "ranked": 'no such ranking' }
  end

  def rank_params
    params.permit(
      :rank,
      :order
    )
  end
end
