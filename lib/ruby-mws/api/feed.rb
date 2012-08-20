module MWS
  module API

    class Feed < Base
      def_request(:get_feed_submission_list,
                 :verb => :get,
                 :uri => '/',
                 :version => '2009-01-01')

      def get_feed_submission_result(params={})
        raise NotImplementedError
      end

      def submit_feed(params={})
        raise ArgumentError, 'Must supply hash param' unless params.is_a?(Hash)
        content = params.delete(:feed_content) { '' }

        params[:options] = { :body => content,
                             :headers => {
                              'Content-MD5' => Base64.encode64(Digest::MD5.digest(content))
                             }
        }
        send_request(:submit_feed, params, {
          :verb => :post,
          :uri => '/',
          :version => '2009-01-01'
        })
      end
    end

  end
end
