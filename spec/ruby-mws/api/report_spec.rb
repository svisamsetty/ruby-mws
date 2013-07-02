require 'spec_helper'

describe MWS::API::Report do

  before :all do
    EphemeralResponse.activate
    @mws = MWS.new(auth_params)
    @timestamp = "2013-07-01T21:16:51-07:00"
  end

  context "requests" do

    describe "request_report" do
      it "should request report for merchant listings" do
        response = @mws.reports.request_report :report_type => '_GET_MERCHANT_LISTINGS_DATA_', :timestamp => @timestamp
        response.report_request_info.should have_key :report_request_id
      end
    end

    describe "poll to see if report is ready" do
      it "should GetReportRequestList by passing a list of report_request_ids" do
        response = @mws.reports.get_report_request_list :report_request_id_list => ['7454795654','7454842892'], :timestamp => '2013-07-02T00:04:03-07:00'
        response.report_requests.count.should == 2
      end

    end




  end

end