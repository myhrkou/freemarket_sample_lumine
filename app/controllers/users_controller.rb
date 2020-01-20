class UsersController < ApplicationController
  def index
    require 'aws-sdk'

    s3=Aws::Resource.new(region:'ap-northeast-1')

    obj=s3.bucket('freemarket2020').object('fmarket_logo_red.svg')

    obj.get(response_target:'./uploads/images/fmarket_logo_red.svg')
  end
end