class Review < ActiveRecord::Base
  attr_accessible :contents, :item_id, :user_id
  belongs_to :item
  belongs_to :user

  validates :contents, :item_id, :user_id, :presence => true
  validate :no_repeating_review

  def no_repeating_review
    foods = Review.where(:user_id => self.user_id, :item_id => self.item_id)
    if foods.empty? == false
      errors.add(:already_added, ": You have already reviewed this item.")
    end
  end
end
