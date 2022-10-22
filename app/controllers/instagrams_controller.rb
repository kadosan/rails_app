class InstagramsController < ApplicationController
    before_action :authenticate_user!

    def index
        if params[:search] == nil
            @instas= Instagram.all
        elsif params[:search] == ''
            @instas= Instagram.all
        else
            @instas = Instagram.where("body LIKE ? ",'%' + params[:search] + '%')
        end
        @comment = Comment.new

        @insta = Instagram.new 
    end

    def new
        @insta = Instagram.new
    end

    def create
        insta = Instagram.new(insta_params)
        insta.user_id = current_user.id
        if insta.save
            redirect_to :action => "index"
            else
            redirect_to :action => "new"
        end
    end

    def show
        @insta = Instagram.find(params[:id])
        @comments = @insta.comments
        @comment = Comment.new
    end


    def edit
        @insta = Instagram.find(params[:id])
    end

    def update
        insta = Instagram.find(params[:id])
        if insta.update(insta_params)
            redirect_to :action => "show", :id => insta.id
        else
            redirect_to :action => "new"
        end
    end

    def destroy
        insta = Instagram.find(params[:id])
        insta.destroy
        redirect_to action: :index
    end

    private
    def insta_params
        params.require(:instagram).permit(:body, :image, :address, :latitude, :longitude)
    end

end

