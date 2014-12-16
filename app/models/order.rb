class Order < ActiveRecord::Base
  default_scope {order 'created_at DESC' }

  belongs_to :user
  belongs_to :company
  has_many :shopping_cart_items

  def total_quantity
    shopping_cart_items.sum(:quantity)
  end

  # def total_unique_items
  #   shopping_cart_items.count
  # end
  #
  #
  def display_status
    if status == "New" && created_at < 5.day.ago
      return "Old"
    end
    status
  end

  def subtotal
    subtotal = 0
    shopping_cart_items.each do |item|
      subtotal += item.quantity * item.price
    end
    subtotal
  end
end
