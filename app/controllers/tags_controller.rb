class TagsController < ApplicationController
  def show
    @tag = Tag.find_by(name: params[:name])
  end

  def index
    @tags = Tag.alpha
  end
end
