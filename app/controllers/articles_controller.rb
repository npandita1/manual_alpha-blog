class ArticlesController < ApplicationController
    include ArticlesHelper

    before_action :set_article, only: [:show, :edit, :update, :destroy]

    def show
        @comment = Comment.new
        @comment.article_id = @article.id
        # @comment = @article.comments.new ????
    end  
    
    def index
        @articles = Article.all
    end
    
    def new
        @article = Article.new
    end 
    
    def create
        # @article = Article.new(title: params[:article][:title], description: params[:article][:description])
        # @article.title = params[:article][:title]
        # @article.description = params[:article][:description]
        # if @article = Article.create(article_params) 
        #     flash[:notice] = "Article was successfully saved."
        #     redirect_to article_path(@article)
        # else
        #     render 'new', status: :unprocessable_entity #422
        # end   
        @article = Article.new(article_params) 
        if @article.save
            flash[:notice] = "Article was successfully saved."
            redirect_to article_path(@article)
        else
            render 'new', status: :unprocessable_entity #422
        end        
    end    

    def edit
        
    end
    
    def update
        if @article.update(article_params)
            flash[:notice] = "Article was successfully updated."
            redirect_to article_path(@article)
        else
            render 'edit', status: :unprocessable_entity
        end       
    end  
    
    def destroy
        @article.destroy
        redirect_to articles_path
    end
    
    private

    def set_article
        @article = Article.find(params[:id])
    end

    # def article_params
    #     params.require(:article).permit(:title, :description)
    # end    

end    