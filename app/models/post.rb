class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length:{minimum: 250}
    validates :summary, length:{maximum: 250}
    validates :category, inclusion:{in: %w(Fiction Non-fiction), in: [true, false] }

    validate :title_does_not_contain

     def title_does_not_contain
        if !title.include?("Won't Believe" || "Secret" || "Top [number]" || "Guess")
            errors.add(:title, "not clickbait enough")
        end
     end 
end
