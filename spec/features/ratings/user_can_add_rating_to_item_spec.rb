require 'rails_helper'

describe 'user can add rating to item' do
  it 'saves rating to item' do
    merchant = create(:merchant)
    user = create(:user)
    item_1 = create(:item, user: merchant)
    order_1 = create(:order, user: user)
    oi_1 = create(:order_item, order: order_1, item: item_1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(merchant)

    visit order_path(order_1)

    within "#orderitem-details-#{oi_1.id}" do
      expect(page).to have_content(item_1.name)
      click_button "fulfill item"
    end

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit order_path(order_1)

    expect(page).to have_content("Status: completed")
    expect(page).to have_link("Rate Item")

    click_link "Rate Item"

    expect(current_path).to eq(new_order_item_rating_path(oi_1))
  end

end
