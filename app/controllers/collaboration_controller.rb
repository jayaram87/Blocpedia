class CollaborationController < ApplicationController
    def create
        @wiki = Wikd.find(params[:wiki_id])
        
        unless current_user? || User.where(role: "private")
            @collaboration = Collaboration.new(wiki: @wiki, user: User.where(role: "standard").first)
            @collaboration.save
        end
        redirect_to @wiki
    end
    
    def destroy
    end
end
