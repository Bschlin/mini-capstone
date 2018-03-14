class Product < ApplicationRecord

  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: {greater_than: 0}
  validates :description, presence: true, length: {in: 10..500}

  def is_discounted
    price <= 2
  end 

  def tax
    price * 0.09
  end 

  def total
    # price * 0.09 + price
    price + tax
  end 

  def as_json
    { 
      id: id,
      name: name,
      price: price,
      image_url: image_url,
      description: description,
      tax: tax,
      total: total,
      discounted: is_discounted,
    }
  end

end
