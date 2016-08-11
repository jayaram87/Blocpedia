class CollaborationsController < ApplicationController
    
    def create
        user = User.find(params[:user_id])
        wiki = Wiki.find(params[:wiki_id])
        wiki.collaborators << user
        redirect_to wiki
    end
    
    def destroy
        wiki = Wiki.find(params[:wiki_id])
        user = User.find(params[:user_id])
        @collaboration = Collaboration.find_by(user_id: user.id, wiki_id: wiki.id)
        @collaboration.destroy
        redirect_to wiki
    end
    
end
