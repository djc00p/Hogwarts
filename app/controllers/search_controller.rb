class SearchController < ApplicationController
  def index
    render locals: { facade: HouseFacade.new(params[:house]) }
  end

  private

  def house_params
    params.require(:facade).permit(:house)
  end
end
