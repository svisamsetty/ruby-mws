require 'spec_helper'

describe MWS::API::Report do

  before :all do
    EphemeralResponse.activate
    @mws = MWS.new(auth_params)
    @timestamp = "2013-07-02T21:22:25-07:00"
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
        response = @mws.reports.get_report_request_list :report_request_id_list => ['7454795654','7454842892'], :timestamp => @timestamp
        response.report_requests.count.should == 2
      end

      it "should be able to fetch report status" do
        response = @mws.reports.get_report_request_list :report_request_id_list => ['7461818012'], :timestamp => @timestamp
        response.report_requests.first.report_processing_status.should == "_DONE_"
        response.report_requests.first.generated_report_id.should == "11467220403"
      end

    end

    describe "download report" do
      it "should be able to download the report" do
        response = @mws.reports.get_report :report_id => '11467220403', :timestamp => @timestamp
        puts response.inspect
      end

    end








  end

end