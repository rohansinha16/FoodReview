class Item < ActiveRecord::Base
  attr_accessible :name, :restaurant

  validates :name, :restaurant, :uniqueness => true
  validates :name, :restaurant, :presence => true
  validate :no_repeating_food

  def no_repeating_food
    foods = Item.where(:name => self.name, :restaurant_id => self.restaurant_id)
    if foods.empty? == false
      errors.add(:already_added, ": This item is already in the list.")
    end
  end
end
