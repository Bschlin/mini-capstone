class Product < ApplicationRecord
  has_many :orders
  belongs_to :supplier
  has_many :images
  has_many :category_products
  has_many :categories, through: :category_products

  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: {greater_than: 0}
  validates :description, presence: true, length: {in: 10..500}

  def supplier
    Supplier.find_by(id: supplier_id)
  end 

# has_many :images
  def images
    Image.where(product_id: id)
  end

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
      description: description,
      tax: tax,
      total: total,
      discounted: is_discounted,
      supplier: supplier.as_json,
      images: images.map { |image| image.url },
      categories: categories.map { |category| category.name }
    }
  end

end
