require 'spec_helper'

describe MWS::API::Product do

  before :all do
    EphemeralResponse.activate
    @mws = MWS.new(auth_params)
    @timestamp = "2013-04-25T21:42:11-04:00"
  end

  context "requests" do

    describe "list_products" do
      it "should return items based on seller SKUs" do
        products = @mws.products.get_lowest_offer_listings_for_ASIN :timestamp => @timestamp,
          :asin_list => %w[B007NLO6CW B007NLO6JA], "MarketplaceId" => 'ATVPDKIKX0DER'
          products.should be_an_instance_of Array
          products.size.should eq(2)
          
          #products.each do |product|
          #  listings = product.lowest_offer_listings.lowest_offer_listing.flatten
          #  listings.each do |listing|
          #    puts "#{listing.qualifiers.fulfillment_channel}::#{listing.price.landed_price.amount}::#{listing.qualifiers.item_condition}"
          #  end
          #end
      end
    end
  end

end