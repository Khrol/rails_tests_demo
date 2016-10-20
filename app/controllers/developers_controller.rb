class DevelopersController < ApplicationController
  def new
  end

  def create
    @developer = Developer.new(developer_params)

    @developer.save
    redirect_to @developer
  end

  def show
    @developer = Developer.find(params[:id])
  end

  private

  def developer_params
    params.require(:developer).permit(:name, :rate, :country)
  end
end
