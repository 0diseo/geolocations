# frozen_string_literal: true

class PersonController < ApplicationController
  before_action :authenticate_user!, only: [ :self_user ]
  def self_user
    puts "entro"
    puts current_user
    render json: { dat: UserSerializer.new(current_user).serializable_hash[:data][:attributes] }
  end
end
