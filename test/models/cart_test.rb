# frozen_string_literal: true

require 'test_helper'

class CartTest < ActiveSupport::TestCase
  test '#purchase_cart decreases the inventory of every product if it succeedes' do
    cart = create(:cart)
    product_inventory1 = 10
    product1, _cart_product1 = create_cart_product(cart, product_inventory1)
    product_inventory2 = 1
    product2, _cart_product2 = create_cart_product(cart, product_inventory2)

    assert cart.purchase_cart

    product1.reload
    product2.reload

    assert_equal product_inventory1 - 1, product1.inventory_count
    assert_equal product_inventory2 - 1, product2.inventory_count
  end

  test '#purchase_cart does not decrease the inventory of products if an item is out of stock' do
    cart = create(:cart)
    product_inventory1 = 10
    product1, _cart_product1 = create_cart_product(cart, product_inventory1)
    product_inventory2 = 0
    product2, _cart_product2 = create_cart_product(cart, product_inventory2)

    refute cart.purchase_cart

    product1.reload
    product2.reload

    assert_equal product_inventory1, product1.inventory_count
    assert_equal product_inventory2, product2.inventory_count
  end

  private

  def create_cart_product(cart, inventory_count)
    product = create(:product, inventory_count: inventory_count)
    cart_product = create(:cart_product, cart: cart, product: product)

    [product, cart_product]
  end
end
