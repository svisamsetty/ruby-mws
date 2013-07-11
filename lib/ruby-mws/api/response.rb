module MWS
  module API

    class Response < Hashie::Rash
      
      def self.parse(hash, name, params)
        rash = self.new(hash)
        handle_error_response(rash["error_response"]["error"]) unless rash["error_response"].nil?

        if rash["#{name}_response"]
          rash = rash["#{name}_response"]
        elsif rash["amazon_envelope"]
          rash = rash["amazon_envelope"]
        else
          raise BadResponseError, "received non-matching response type #{rash.keys}"
        end

        if rash = rash["#{name}_result"]
          # only runs mods if correct result is present
          params[:mods].each {|mod| mod.call(rash) } if params[:mods]
        end
        rash
        # rash = rash["#{name}_result"]
        # puts rash.class
        # puts rash.first.asin
        # puts rash.first.product.attribute_sets.item_attributes.audience_rating
        # rash
      end

      def self.handle_error_response(error)
        msg = "#{error.code}: #{error.message}"
        msg << " -- #{error.detail}" unless error.detail.nil?
        raise ErrorResponse, msg
      end

    end

  end
end
