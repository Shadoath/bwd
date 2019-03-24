class Admin::FoodsAjaxController < Admin::FoodsController

  before_action :set_food, only: [
    :add_new_tag, :add_tag, :remove_tag,
    :add_new_food, :add_food, :remove_food
  ]
  def add_new_tag
    tag = Tag.find_or_initialize_by(name: params[:tag][:name].downcase)
    tag.update(description: params[:tag][:description])
    @food.tags << tag unless @food.tags.include? tag
    render partial: "admin/foods/tags/list", locals: {food: @food }
  end

  def add_tag
    unless (params[:tag_id].empty?)
      tag = Tag.find(params[:tag_id])
      @food.tags << tag unless @food.tags.include? tag
    end
    render partial: "admin/foods/tags/list", locals: {food: @food }
  end

  def remove_tag
    tag = Tag.find(params[:tag_id])
    @food.tags.delete(tag)
    render partial: "admin/foods/tags/list", locals: {food: @food }
  end

  def add_new_food
    food = Food.find_or_initialize_by(name: food_params[:name], restaurant: @food.restaurant)
    food.update(food_params)
    @food.foods << food unless @food.foods.include? food
    render partial: "admin/foods/foods/list", locals: {food: @food }
  end

  def add_food
    unless (params[:food_id].empty?)
      food = Food.find(params[:food_id])
      @food.foods << food unless @food.foods.include? food
    end
    render partial: "admin/foods/foods/list", locals: {food: @food }
  end

  def remove_food
    food = Food.find(params[:food_id])
    @food.foods.delete(food)
    render partial: "admin/foods/foods/list", locals: {food: @food }
  end
end
