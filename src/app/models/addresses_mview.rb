class AddressesMview < ApplicationRecord
  # belongs_to :addresses_mviews, polymorphic: true

  # # this isn't strictly necessary, but it will prevent
  # # rails from calling save, which would fail anyway.
  # def readonly?
  #   true
  # end
end