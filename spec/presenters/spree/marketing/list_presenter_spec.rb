require 'spec_helper'

describe Spree::Marketing::ListPresenter do

  let(:list) { create(:abandoned_cart_list, name: 'abandoned_cart_list') }
  let(:product_name) { 'Sample Product' }
  let(:product) { create(:product, name: product_name) }
  let(:multilist) { create(:favourable_products_list, entity: product, name: "favourable_products_list_#{ product_name }") }
  let(:list_presenter) { Spree::Marketing::ListPresenter.new list }
  let(:multilist_presenter) { Spree::Marketing::ListPresenter.new multilist }
  let(:view_names_hash) {
    {
      'AbandonedCartList' => {
        tooltip_content: 'View the contact list of users who have abandoned the cart'
      },
      'FavourableProductsList' => {
        tooltip_content: 'View the contact list of users who are part of the purchase family for top 10 most selling products'
      },
      'LeastActiveUsersList' => {
        tooltip_content: 'View the contact list of users corresponding to least activities'
      },
      'LeastZoneWiseOrdersList' => {
        tooltip_content: 'View the contact list of users in 5 lowest ordering Zone'
      },
      'MostActiveUsersList' => {
        tooltip_content: 'View the contact list of users corresponding to most activities'
      },
      'MostDiscountedOrdersList' => {
        tooltip_content: 'View the contact list of users who are part of the purchase family mostly for discounted orders'
      },
      'MostSearchedKeywordsList' => {
        tooltip_content: 'View the contact list of users corresponding to top 10 keywords'
      },
      'MostUsedPaymentMethodsList' => {
        tooltip_content: 'View the contact list of users corresponding to most used payment methods'
      },
      'MostZoneWiseOrdersList' => {
        tooltip_content: 'View the contact list of users in 5 most ordering Zone'
      },
      'NewUsersList' => {
        tooltip_content: 'View the contact list of users who have signed up in last week'
      }
    }
  }

  describe "Constant" do
    it "VIEW_NAMES_HASH stores view names of lists" do
      expect(Spree::Marketing::ListPresenter::VIEW_NAMES_HASH).to eq view_names_hash
    end
  end

  describe 'methods' do
    describe '#initialize' do
      it 'sets list as an instance variable' do
        expect((Spree::Marketing::ListPresenter.new list).instance_variable_get(:@list)).to eq list
      end
    end

    describe '#name' do
      context 'when list is of multilist type' do
        it 'returns product name' do
          expect(multilist_presenter.sub_list_name).to eq product_name
        end
      end

      context 'when list is of single list type' do
        it 'returns Contacts string' do
          expect(list_presenter.sub_list_name).to eq 'Contacts'
        end
      end
    end
  end

end
