class CritiquesController < ApplicationController
  def index
    @critiques = Critique.all
  end

  def show
    @critique = Critique.find(params[:id])
  end

  def new
    @critique = Critique.new
  end

  def create
    @critique = Critique.new(critique_params)
    @post = Post.find(@critique.post_id)
    if @critique.valid?
      @critique.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def edit
    @critique = Critique.find(params[:id])
  end

  def update
    @critique = Critique.find(params[:id])
    @critique.update(critique_params)
    if @critique.valid?
      @critique.save
      redirect_to critique_path(@critique)
    else
      render :edit
    end
  end

  def destroy
    @critique = Critique.find(params[:id]).destroy
  end

  private

  def critique_params
    params.require(:critique).permit(:content, :post_id)
  end
end
