class IngredientsTag < ActiveRecord::Base

  belongs_to :ingredient
  belongs_to :tag

  validates_uniqueness_of :tag_id, scope: :ingredient_id
end