class AddressController < ApplicationController
  def show
    raise ActionController::BadRequest.new('Invalid params.') if params[:q].blank?

    query = params[:q].upcase

    addresses = AddressesMview
    addresses = addresses.where('address ilike ?', "%#{query}%")
    # addresses = addresses.order(Arel.sql("address <--> '#{query}'"))

    # puts addresses.to_sql

    render json: addresses.limit(10).all
  end
end
