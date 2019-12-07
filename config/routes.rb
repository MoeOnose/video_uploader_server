Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace 'api' do
    namespace 'v1' do
      # 今回CRUDの機能はcreateのみ使用
      resources :videos, only: :create do
        # idを必要としないパスを生成したいのでcollectionでラップ
        collection do
          #最新のvideoを一件取得するためのパスをfetch_latest_video
         get :fetch_latest_video
        end
      end
    end
  end
end
