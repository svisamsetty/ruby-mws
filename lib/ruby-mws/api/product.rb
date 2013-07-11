module MWS
  module API

    class Product < Base

      def_request [:get_lowest_offer_listings_for_ASIN, :get_matching_product],
        :verb => :get,
        :uri => '/Products/2011-10-01',
        :version => '2011-10-01',
        :lists => {
          :asin_list => "ASINList.ASIN"
        }#, -- not sure we want to mod this, we'll lose the ASIN in the wrapper
        # :mods => [
        #   #lambda {|r| r.collect!{ |p| p.product }}
        # ]




    end

  end
end