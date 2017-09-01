##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

require 'spec_helper.rb'

describe 'UsageRecord' do
  it "can read" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.wireless.v1.sims("DEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                         .usage_records.list()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://wireless.twilio.com/v1/Sims/DEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/UsageRecords',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "usage_records": [
              {
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "commands": {},
                  "data": {},
                  "sim_sid": "DEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "period": {}
              },
              {
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "commands": {},
                  "data": {},
                  "sim_sid": "DEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "period": {}
              }
          ],
          "meta": {
              "first_page_url": "https://wireless.twilio.com/v1/Sims/DEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/UsageRecords?PageSize=50&Page=0",
              "key": "usage_records",
              "next_page_url": null,
              "page": 0,
              "page_size": 50,
              "previous_page_url": null,
              "url": "https://wireless.twilio.com/v1/Sims/DEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/UsageRecords?PageSize=50&Page=0"
          }
      }
      ]
    ))

    actual = @client.wireless.v1.sims("DEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                                .usage_records.list()

    expect(actual).to_not eq(nil)
  end
end