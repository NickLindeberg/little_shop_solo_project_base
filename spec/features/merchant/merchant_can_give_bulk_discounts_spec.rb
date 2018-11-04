require 'rails_helper'

describe 'merchant can discount bulk items' do
  it 'discounts items in cart' do
    merchant = create(:merchant, role: 1)
    item = create(:item, user: merchant, inventory: 21, price: 3.0)

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
    expect(page).to have_content("Subtotal: $27.00")

    click_button("Add 1")
    expect(page).to have_content("Price: 2.7")
    expect(page).to have_content("Subtotal: $27.00")
    click_button("Add 1")
    click_button("Add 1")
    click_button("Add 1")
    click_button("Add 1")
    click_button("Add 1")
    click_button("Add 1")
    click_button("Add 1")
    click_button("Add 1")
    click_button("Add 1")
    click_button("Add 1")

    expect(page).to have_content("Price: 2.4")
  end
end
