class Article < ApplicationRecord
    validates :title, presence: true, length: {minimum:6, maximum:100}
    validates :description, presence: true, length: {minimum:10, maximum:400}
    has_many :comments
    has_many :taggings, dependent: :destroy
    has_many :tags, through: :taggings

    def tag_list
        self.tags.collect do |tag|
            tag.name
        end.join(", ")    
        # tags.join(", ")
    end 

    def tag_list=(tags_string)
        tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq
        new_or_found_tags = tag_names.collect { |name| Tag.find_or_create_by(name: name) }
        self.tags = new_or_found_tags
    end    

    def self.search(id)
        # display_tag = Tag.find(id)
        if id.nil?
            Article.all    
        else
            display_tag = Tag.find(id)
            display_tag.articles
        end    
    end

end    