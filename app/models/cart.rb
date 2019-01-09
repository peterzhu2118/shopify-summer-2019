# frozen_string_literal: true

class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_products

  def total_price
    cart_products.inject(0) { |sum, cart_prod| sum + cart_prod.product.price }
  end

  def products
    cart_products.map(&:product)
  end

  def purchase_cart
    if purchased
      errors.add(:cart, 'is already purchased')
      return false
    end

    successful_transaction = true

    ActiveRecord::Base.transaction do
      cart_products.each { |cart_prod| cart_prod.product.lock! }

      cart_products.each do |cart_prod|
        cart_prod.reload

        product = cart_prod.product
        product.inventory_count -= 1

        next if product.save

        successful_transaction = false
        errors.add(:product, "#{cart_prod} is out of stock")
        raise ActiveRecord::Rollback, 'product is out of stock'
      end
    end

    update_attribute(:purchased, true) if successful_transaction

    reload

    successful_transaction
  end
end
