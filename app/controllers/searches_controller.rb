class SearchesController < ApplicationController
  before_action :authenticate_customer!

  def search
    @range = params[:range]

    if @range == "ユーザー名"
      @customers = Customer.looks(params[:word])
    else
      @likes = Like.looks(params[:word])
    end
  end
end
