class CollaborationsController < ApplicationController
    def create
       @collaboration = Collaboration.new
       @collaboration.user = params[:collaboration][:user_id]
       @collaboration.wiki = params[:collaboration][:wiki_id]
       @collaboration.update(user_id: @collaboration.user, wiki_id: @collaboration.wiki)
       redirect_to root_path
    end
    
    def destroy
        @collaboration = Collaboration.find(params[:id])
        @collaboration.destroy
        redirect_to root_path
    end
    
end
