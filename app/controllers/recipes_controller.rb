class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]#Before filters use the before_action command to arrange for a particular method to be called before the given actions,
                                                                    #This before action will restrict the filter to act only :show, :edit, :update, :destroy

  # GET /recipes
  # GET /recipes.json
  def index
    @recipes = Recipe.paginate(page: params[:page], per_page: 2)#Source: https://www.railstutorial.org/book/updating_and_deleting_users
  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
  end

  # GET /recipes/1/edit
  def edit
  end

  # POST /recipes
  # POST /recipes.json
  def create
    
    @recipe = Recipe.new(recipe_params)
    @recipe.user = User.first #this will ensure that recipe has a user source: video
    respond_to do |format|
      if @recipe.save
        format.html { redirect_to @recipe, notice: 'Recipe was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /recipes/1
  # PATCH/PUT /recipes/1.json
  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to @recipe, notice: 'Recipe was successfully updated.' }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.json
  def destroy
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to recipes_url, notice: 'Recipe was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_params
      params.require(:recipe).permit(:title, :description)
    end
end

#Source:https://www.railstutorial.org/book/updating_and_deleting_users