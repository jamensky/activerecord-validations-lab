class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length:{minimum: 250}
    validates :summary, length:{maximum: 250}
    validates :category, inclusion:{in: %w(Fiction Non-Fiction) }

    validate :title_is_not_click_baity

     def title_is_not_click_baity
        if title && !title.match?(/Won't Believe | Secret | Top [number] | Guess/)
            errors.add(:title, "not clickbait enough")
        end
     end 
end
