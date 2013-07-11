require 'spec_helper'

describe MWS::API::Product do

  before :all do
    EphemeralResponse.activate
    @mws = MWS.new(auth_params)
    @timestamp = nil #"2013-04-25T21:42:11-04:00"
  end

  context "requests" do

    describe "list_products" do
      it "should return items based on seller SKUs" do
        products = @mws.products.get_lowest_offer_listings_for_ASIN :timestamp => @timestamp,
          :asin_list => %w[B007NLO6CW B007NLO6JA], :marketplace_id => 'ATVPDKIKX0DER'
          products.should be_an_instance_of Array
          products.size.should eq(2)
          
          #products.each do |product|
          #  listings = product.lowest_offer_listings.lowest_offer_listing.flatten
          #  listings.each do |listing|
          #    puts "#{listing.qualifiers.fulfillment_channel}::#{listing.price.landed_price.amount}::#{listing.qualifiers.item_condition}"
          #  end
          #end
      end

      it "should return information about skus", :focus => true do
        products = @mws.products.get_matching_product :timestamp => "2013-07-11T13:14:15-07:00",
           :asin_list => ['B003V0G5F0', 'B007NLO6CW', 'B007NLO6JA'], :marketplace_id => 'ATVPDKIKX0DER'

        products.count.should == 3
        products.first.asin.should == 'B003V0G5F0'
        products.last.asin.should == 'B007NLO6JA'

        #drill into product attributes like this:
        #products.last.product.attribute_sets.item_attributes.brand

      end




    end





  end

end