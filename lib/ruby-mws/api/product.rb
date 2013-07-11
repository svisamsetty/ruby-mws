module MWS
  module API

    class Product < Base

      def_request [:get_lowest_offer_listings_for_ASIN],
        :verb => :get,
        :uri => '/Products/2011-10-01',
        :version => '2011-10-01',
        :lists => {
          :asin_list => "ASINList.ASIN"
        },
        :mods => [
          lambda {|r| r.collect!{ |p| p.product }}
        ]

    end

  end
end