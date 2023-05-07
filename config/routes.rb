Rails.application.routes.draw do
  root :to =>"homes#top"
  get "/about" => "homes#about"

  get "/tag" => "homes#index"

  #タグによって絞り込んだ投稿を表示するアクションへのルーティング
  resources :tags do
    get 'likes', to: 'likes#search'
  end

  # 検索
  get "search" => "searches#search"
  get "search_tag" => "searches#search_tag"

  #顧客用
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  #管理者用
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  scope module: :public do
    resources :customers, only: [:index, :show, :update, :edit] do
      resource :relationships, only: [:create, :destroy]
      get 'index' => 'relationships#index', as: 'index'
      member do
        get :edit_password
        get :unsubscribe # 退会確認画面
        patch :withdrawal # 論理削除用のルーティング
        get :favorites
      end
    end

    resources :likes do
      resource :favorites, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
    end
  end

  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
    resources :likes, only:[:index, :destroy]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
