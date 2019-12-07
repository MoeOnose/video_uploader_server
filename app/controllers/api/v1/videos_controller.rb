class Api::V1::VideosController < ApplicationController
    # videoの保存
     def create
        video = Video.save(video_params)
        if video.save
            render json: { status: 'ok' }
        else
            render json: { status: 'ng' }
        end
    end
    # videoの取得
    def index
        # とりあえず最後に保存したもの一件だけを表示
        video = Video.last.clip
        # ActiveStorageで保存したビデオのurlをjsonで返す
        url = url_for(video)
        render json: { url: url }
    end
    
    private 
    def video_params
        params.permit(:clip) #clipはActiveStorageに保存する時のキー
    end
end