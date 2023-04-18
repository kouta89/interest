class SearchesController < ApplicationController
  before_action :authenticate_customer!

  def search
    @range = params[:range]
    @word = params[:word]

    if @range == "ユーザー検索"
      @customers = Customer.looks(params[:word])

    elsif @range == "キーワード検索"
      @likes = Like.looks(params[:word])

    elsif @range == "タグ検索"
      #検索結果画面でもタグ一覧表示
      @tag_list = Tag.all
      #検索されたタグを受け取る
      @tags = Tag.where(tag_name: params[:word])
      #検索されたタグに紐づく投稿を表示
      @likes = Like.all
    end

  end

  def search_tag

    #検索結果画面でもタグ一覧表示
    @tag_list = Tag.all
    #検索されたタグを受け取る
    @tag = Tag.find(params[:tag_id])
    #検索されたタグに紐づく投稿を表示
    @likes = @tag.likes.all
  end
end
