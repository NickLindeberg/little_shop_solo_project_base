require 'rails_helper'

describe 'merchant can discount bulk items' do
  it 'discounts items in cart' do
    merchant = create(:merchant, role: 1)
    item = create(:item, user: merchant, inventory: 10, price: 3.0)

    visit items_path

    visit item_path(item)
    click_button("Add to Cart")
    click_button("Add to Cart")
    click_button("Add to Cart")
    click_button("Add to Cart")
    click_button("Add to Cart")
    click_button("Add to Cart")
    click_button("Add to Cart")
    click_button("Add to Cart")
    click_button("Add to Cart")
    visit carts_path
    expect(page).to have_content("Price: 3.0")

    click_button("Add 1")
    expect(page).to have_content("Price: 2.7")


  end
end
