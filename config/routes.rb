Rails.application.routes.draw do
  devise_for :users,
  controllers: {
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  root 'items#index'
  resources :items, only: [:new, :create, :index, :show, :edit, :update,:destroy] do
    collection do
      get 'search_children'
      get 'search_grand_children'
      get 'credit'
      get 'user_edit'
      get 'signup_registration'
      get 'users_items_show/:id', to: 'items#users_items_show', as: :items_show
      post 'pay/:id' => 'items#pay'
      get 'buy/:id' => 'items#buy'
    end
  end
  resources :users, only: [:index, :show, :new, :edit] do
    collection do
      get 'profile'
      get 'logout'
      get 'credit'
      get 'identification'
      get 'mypage_ship'
      get 'sold'
    end
  end
  resources :payments do
  end
  resources :signup do
    collection do
      get 'step1'
      get 'step2'
      get 'step3'
      get 'step4' # ここで、入力の全てが終了する
      get 'complete' # 登録完了後のページ
    end
  end
end