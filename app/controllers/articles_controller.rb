class ArticlesController < ApplicationController

	def index
		@article = Article.new
		@articles = Article.all
	end

	def create
		@article = Article.new(article_params)

		if @article.save
			sync_new @article
			redirect_to articles_path
		else
			render 'new'
		end
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy
		sync_destroy @article
		redirect_to articles_path
	end

	private

	def article_params
		params.require(:article).permit(:name)
	end
end
