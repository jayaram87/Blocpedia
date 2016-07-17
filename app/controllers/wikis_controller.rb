class WikisController < ApplicationController
    
    def index
        @wikis = Wiki.all
    end
    
    def show
        @wiki = Wiki.find(params[:id])
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
    end
    
    def update
        @wiki = Wiki.find(params[:id])
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
        
        if @wiki.destroy
            flash[:notice] = "#{@wiki.title} was deleted successfully."
            redirect_to root_path
        end
    end    

end
