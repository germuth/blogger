class ArticlesController < ApplicationController
    #Index is a list of all articles accord to REST
    def index
        #rails causes instance variables to transfer to the view
        @articles = Article.all
    end
	
	def show
		@article = Article.find params[:id]
	end
end
