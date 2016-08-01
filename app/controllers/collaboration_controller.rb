class CollaborationController < ApplicationController
    def create
        @wiki = Wikd.find(params[:wiki_id])
        @user = User.where(user_id: user.id).all_except(current_user).exclude_collaborations(@wiki).first
        
        if @user
            @collaboration = Collaboration.new(wiki: @wiki, user: @user)
            @collaboration.save
        end
        redirect_to @wiki
    end
    
    def destroy
    end
end
