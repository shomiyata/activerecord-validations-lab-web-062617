class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {in:0..250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :clickbait

  def clickbait
    phrases = /(Won't Believe|Secret|Top|Guess)/
    if !phrases.match(title)
      errors.add(:title, "!")
    end
  end
end
