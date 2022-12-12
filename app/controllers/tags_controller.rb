class TagsController < ApplicationController

    def show
        @tag = Tag.find(params[:id])
        @required_hash = Hash.new
        @tag.articles.collect do |article|
            if article.comments.empty?
                @required_hash[article] = "No Comment"
            else
                @required_hash[article] = article.comments
            end    
        end    
    end

end    