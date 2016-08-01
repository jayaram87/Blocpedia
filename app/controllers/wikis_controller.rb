class WikisController < ApplicationController

    def index
        @wikis = Wiki.visible_to(current_user)
    end
    
    def show
        @wiki = Wiki.find(params[:id])
        
        unless @wiki.private || current_user
            flash[:alert] = "New to upgrade to premium membership"
            redirect_to new_charge_path
        end
        
    end

    def new
        @wiki = Wiki.new
    end
    
    def create
        @wiki = Wiki.new
        @wiki.title = params[:wiki][:title]
        @wiki.body = params[:wiki][:body]
        @wiki.private = params[:wiki][:private]
        
        if @wiki.save
            flash[:notice] = "Wiki created"
            redirect_to @wiki
        end
    end
    
    def edit
            @wiki = Wiki.find(params[:id])
            authorize @wiki
    end
    
    def update
            @wiki = Wiki.find(params[:id])
            authorize @wiki
            @wiki.title = params[:wiki][:title]
            @wiki.body = params[:wiki][:body]
            @wiki.private = params[:wiki][:private]
        
            if @wiki.save
                flash[:notice] = "Wiki updated"
                redirect_to @wiki
            end
        
    end
    
    def destroy
            @wiki = Wiki.find(params[:id])
            authorize @wiki
        
            if @wiki.destroy
                flash[:notice] = "#{@wiki.title} was deleted successfully."
                redirect_to root_path
            end
       
    end
    
end
