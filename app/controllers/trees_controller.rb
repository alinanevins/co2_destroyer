class TreesController < ApplicationController
before_action :authenticate_user!

  def index
    @tree = Tree.all
  end

  def create
    tree_hash = params.delete('tree')
    a = Tree.new
    a.name = tree_hash['name']
    a.species = tree_hash['species']
    a.diameter = tree_hash['diameter']

    t = TreeService.new(a.diameter)
    a.mass = t.calculate_mass.round(2)
    a.co2_removed = t.calculate_co2.round(2)
    # a.user_id = tree_hash['user_id']

    if a.save
      redirect_to tree_path(a.id)
    end

  end

  def new
    @tree = Tree.new
  end

  def edit
    id = params[:id]
    @tree = Tree.find(id)
  end

  def show
    id = params[:id]
    @tree = Tree.find(id)
  end

  def update
    id = params['id']
    tree_hash = params.delete('tree')
    @tree = Tree.find(id)
    @tree.name = tree_hash['name']
    @tree.species = tree_hash['species']
    @tree.diameter = tree_hash['diameter']
    @tree.mass = tree_hash['mass']
    @tree.co2_removed = tree_hash['co2_removed']

    if @tree.save
      redirect_to tree_path(@tree.id)
    end
  end

  def destroy
    id = params['id']
    Tree.delete(id)
    flash[:notice] = "You've deleted your tree"
    redirect_to "/trees"
  end
end
