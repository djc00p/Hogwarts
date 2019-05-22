class Api::V1::HouseController < ApplicationController
  def index
    render locals: { service: HogwartServices.new()}
  end
  def show

  end
end
