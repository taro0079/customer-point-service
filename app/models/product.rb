class Product < ApplicationRecord
  def get_point
    self.price / 100
  end
end
