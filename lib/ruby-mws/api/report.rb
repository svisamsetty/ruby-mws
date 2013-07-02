module MWS
  module API

    class Report < Base
      def_request [:request_report],
        :verb => :get,
        :uri => '/',
        :version => '2009-01-01'

      def_request [:get_report_request_list],
        :verb => :get,
        :uri => '/',
        :version => '2009-01-01',
        :lists => {
          :report_request_id_list => "ReportRequestIdList.Id"
        },
        :mods => [
          lambda {|r| r.report_requests = [r.report_request_info].flatten}
        ]

      def_request [:get_report],
        :verb => :get,
        :uri => '/',
        :version => '2009-01-01'


      
    end

     

  end
end