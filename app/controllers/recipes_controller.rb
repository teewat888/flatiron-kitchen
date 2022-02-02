class RecipesController < ApplicationController
    before_action :set_recipe, only: [:show, :edit, :update]
    before_action :get_ingredients, only: [:new, :edit]

    def index
        @recipes = Recipe.all
    end

    def new
        @recipe = Recipe.new
    end
    def create
        @recipe = Recipe.new(recipe_params)
        if @recipe.save
          flash[:success] = "Recipe successfully created"
          redirect_to @recipe
        else
          flash[:error] = "Something went wrong"
          render 'new'
        end
    end
    
    def show

    end

    def edit

    end

    def update
        if @recipe.update(recipe_params)
            redirect_to @recipe
        else
            render :edit
        end      
    end
    
    private

    def get_ingredients 
        @ingredients = Ingredient.all
    end

    def set_recipe
        @recipe = Recipe.find(params[:id])
    end

    def recipe_params
        params.require(:recipe).permit(:name, ingredient_ids: [])
    end
    
end