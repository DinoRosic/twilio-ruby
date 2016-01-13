##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /       

module Twilio
  module REST
    class Api < Domain
      class V2010 < Version
        class AccountContext < InstanceContext
          class CallList < ListResource
            ##
            # Initialize the CallList
            # @param Version version: Version that contains the resource
            # @param account_sid: The unique id of the Account responsible for creating this Call
            
            # @return CallList CallList
            def initialize(version, account_sid: nil)
              super(version)
              
              # Path Solution
              @solution = {
                  account_sid: account_sid
              }
              @uri = "/Accounts/#{@solution[:account_sid]}/Calls.json"
              
              # Components
              @feedback_summaries = nil
            end
            
            ##
            # Retrieve a single page of CallInstance records from the API.
            # Request is executed immediately.
            # @param String to: Phone number, SIP address or client identifier to call
            # @param String from: Twilio number from which to originate the call
            # @param String method: HTTP method to use to fetch TwiML
            # @param String fallback_url: Fallback URL in case of error
            # @param String fallback_method: HTTP Method to use with FallbackUrl
            # @param String status_callback: Status Callback URL
            # @param String status_callback_method: HTTP Method to use with StatusCallback
            # @param String send_digits: Digits to send
            # @param String if_machine: Action to take if a machine has answered the call
            # @param String timeout: Number of seconds to wait for an answer
            # @param Boolean record: Whether or not to record the Call
            # @param String url: Url from which to fetch TwiML
            # @param String application_sid: ApplicationSid that configures from where to fetch TwiML
            
            # @return CallInstance Newly created CallInstance
            def create(to: nil, from: nil, method: nil, fallback_url: nil, fallback_method: nil, status_callback: nil, status_callback_method: nil, send_digits: nil, if_machine: nil, timeout: nil, record: nil, url: nil, application_sid: nil)
              data = {
                  'To' => to,
                  'From' => from,
                  'Url' => url,
                  'ApplicationSid' => application_sid,
                  'Method' => method,
                  'FallbackUrl' => fallback_url,
                  'FallbackMethod' => fallback_method,
                  'StatusCallback' => status_callback,
                  'StatusCallbackMethod' => status_callback_method,
                  'SendDigits' => send_digits,
                  'IfMachine' => if_machine,
                  'Timeout' => timeout,
                  'Record' => record,
              }
              
              payload = @version.create(
                  'POST',
                  @uri,
                  data: data
              )
              
              return CallInstance.new(
                  @version,
                  payload,
                  account_sid: @solution['account_sid'],
              )
            end
            
            ##
            # Lists CallInstance records from the API as a list.
            # Unlike stream(), this operation is eager and will load `limit` records into
            # memory before returning.
            # @param String to: Phone number or Client identifier to filter `to` on
            # @param String from: Phone number or Client identifier to filter `from` on
            # @param String parent_call_sid: Parent Call Sid to filter on
            # @param feedback_summary.Status status: Status to filter on
            # @param Time start_time_before: StartTime to filter on
            # @param Time start_time: StartTime to filter on
            # @param Time start_time_after: StartTime to filter on
            # @param Time end_time_before: EndTime to filter on
            # @param Time end_time: EndTime to filter on
            # @param Time end_time_after: EndTime to filter on
            # @param Integer limit: Upper limit for the number of records to return. stream()
            #                   guarantees to never return more than limit.  Default is no limit
            # @param Integer page_size: Number of records to fetch per request, when not set will                      use
            #  the default value of 50 records.  If no page_size is                      defined
            #  but a limit is defined, stream() will attempt to read                      the
            #  limit with the most efficient page size,                      i.e. min(limit, 1000)
            
            # @return Array Array of up to limit results
            def list(to: nil, from: nil, parent_call_sid: nil, status: nil, start_time_before: nil, start_time: nil, start_time_after: nil, end_time_before: nil, end_time: nil, end_time_after: nil, limit: nil, page_size: nil)
              self.stream(
                  to: to,
                  from: from,
                  parent_call_sid: parent_call_sid,
                  status: status,
                  start_time_before: start_time_before,
                  start_time: start_time,
                  start_time_after: start_time_after,
                  end_time_before: end_time_before,
                  end_time: end_time,
                  end_time_after: end_time_after,
                  limit: limit,
                  page_size: page_size
              ).entries
            end
            
            ##
            # Streams CallInstance records from the API as an Enumerable.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            # @param String to: Phone number or Client identifier to filter `to` on
            # @param String from: Phone number or Client identifier to filter `from` on
            # @param String parent_call_sid: Parent Call Sid to filter on
            # @param feedback_summary.Status status: Status to filter on
            # @param Time start_time_before: StartTime to filter on
            # @param Time start_time: StartTime to filter on
            # @param Time start_time_after: StartTime to filter on
            # @param Time end_time_before: EndTime to filter on
            # @param Time end_time: EndTime to filter on
            # @param Time end_time_after: EndTime to filter on
            # @param Integer limit: Upper limit for the number of records to return.                  stream()
            #  guarantees to never return more than limit.                  Default is no limit
            # @param Integer page_size: Number of records to fetch per request, when                      not set will use
            #  the default value of 50 records.                      If no page_size is defined
            #                       but a limit is defined, stream() will attempt to                      read the
            #  limit with the most efficient page size,                       i.e. min(limit, 1000)
            
            # @return Enumerable Enumerable that will yield up to limit results
            def stream(to: nil, from: nil, parent_call_sid: nil, status: nil, start_time_before: nil, start_time: nil, start_time_after: nil, end_time_before: nil, end_time: nil, end_time_after: nil, limit: nil, page_size: nil)
              limits = @version.read_limits(limit, page_size)
              
              page = self.page(
                  to: to,
                  from: from,
                  parent_call_sid: parent_call_sid,
                  status: status,
                  start_time_before: start_time_before,
                  start_time: start_time,
                  start_time_after: start_time_after,
                  end_time_before: end_time_before,
                  end_time: end_time,
                  end_time_after: end_time_after,
                  page_size: limits['page_size'],
              )
              
              @version.stream(page, limit: limits['limit'], page_limit: limits['page_limit'])
            end
            
            ##
            # When passed a block, yields CallInstance records from the API.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            # @param String to: Phone number or Client identifier to filter `to` on
            # @param String from: Phone number or Client identifier to filter `from` on
            # @param String parent_call_sid: Parent Call Sid to filter on
            # @param feedback_summary.Status status: Status to filter on
            # @param Time start_time_before: StartTime to filter on
            # @param Time start_time: StartTime to filter on
            # @param Time start_time_after: StartTime to filter on
            # @param Time end_time_before: EndTime to filter on
            # @param Time end_time: EndTime to filter on
            # @param Time end_time_after: EndTime to filter on
            # @param Integer limit: Upper limit for the number of records to return.                  stream()
            #  guarantees to never return more than limit.                  Default is no limit
            # @param Integer page_size: Number of records to fetch per request, when                       not set will use
            #  the default value of 50 records.                      If no page_size is defined
            #                       but a limit is defined, stream() will attempt to read the
            #                       limit with the most efficient page size, i.e. min(limit, 1000)
            def each
              limits = @version.read_limits
              
              page = self.page(
                  page_size: limits['page_size'],
              )
              
              @version.stream(page,
                              limit: limits['limit'],
                              page_limit: limits['page_limit']).each {|x| yield x}
            end
            
            ##
            # Retrieve a single page of CallInstance records from the API.
            # Request is executed immediately.
            # @param String to: Phone number or Client identifier to filter `to` on
            # @param String from: Phone number or Client identifier to filter `from` on
            # @param String parent_call_sid: Parent Call Sid to filter on
            # @param feedback_summary.Status status: Status to filter on
            # @param Time start_time_before: StartTime to filter on
            # @param Time start_time: StartTime to filter on
            # @param Time start_time_after: StartTime to filter on
            # @param Time end_time_before: EndTime to filter on
            # @param Time end_time: EndTime to filter on
            # @param Time end_time_after: EndTime to filter on
            # @param String page_token: PageToken provided by the API
            # @param Integer page_number: Page Number, this value is simply for client state
            # @param Integer page_size: Number of records to return, defaults to 50
            
            # @return Page Page of CallInstance
            def page(to: nil, from: nil, parent_call_sid: nil, status: nil, start_time_before: nil, start_time: nil, start_time_after: nil, end_time_before: nil, end_time: nil, end_time_after: nil, page_token: nil, page_number: nil, page_size: nil)
              params = {
                  'To' => to,
                  'From' => from,
                  'ParentCallSid' => parent_call_sid,
                  'Status' => status,
                  'StartTime<' => Twilio.serialize_iso8601(start_time_before),
                  'StartTime' => Twilio.serialize_iso8601(start_time),
                  'StartTime>' => Twilio.serialize_iso8601(start_time_after),
                  'EndTime<' => Twilio.serialize_iso8601(end_time_before),
                  'EndTime' => Twilio.serialize_iso8601(end_time),
                  'EndTime>' => Twilio.serialize_iso8601(end_time_after),
                  'PageToken' => page_token,
                  'Page' => page_number,
                  'PageSize' => page_size,
              }
              response = @version.page(
                  'GET',
                  @uri,
                  params
              )
              return CallPage.new(
                  @version,
                  response,
                  account_sid: @solution['account_sid'],
              )
            end
            
            ##
            # Access the feedback_summaries
            # @return FeedbackSummaryList FeedbackSummaryList
            def feedback_summaries(sid=:unset)
              if sid != :unset
                return FeedbackSummaryContext.new(
                    @version,
                    @solution[:account_sid],
                    sid,
                )
              end
              
                @feedback_summaries ||= FeedbackSummaryList.new(
                    @version,
                    account_sid: @solution[:account_sid],
                )
            end
            
            ##
            # Constructs a CallContext
            # @param sid: Call Sid that uniquely identifies the Call to fetch
            
            # @return CallContext CallContext
            def get(sid)
              CallContext.new(
                  @version,
                  account_sid: @solution[:account_sid],
                  sid: sid,
              )
            end
            
            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Api.V2010.CallList>'
            end
          end
        
          class CallPage < Page
            ##
            # Initialize the CallPage
            # @param Version version: Version that contains the resource
            # @param Response response: Response from the API
            # @param account_sid: The unique id of the Account responsible for creating this Call
            
            # @return CallPage CallPage
            def initialize(version, response, account_sid: nil)
              super(version, response)
              
              # Path Solution
              @solution = {
                  'account_sid' => account_sid,
              }
            end
            
            ##
            # Build an instance of CallInstance
            # @param Hash payload: Payload response from the API
            
            # @return CallInstance CallInstance
            def get_instance(payload)
              return CallInstance.new(
                  @version,
                  payload,
                  account_sid: @solution['account_sid'],
              )
            end
            
            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Api.V2010.CallPage>'
            end
          end
        
          class CallContext < InstanceContext
            ##
            # Initialize the CallContext
            # @param Version version: Version that contains the resource
            # @param account_sid: The account_sid
            # @param sid: Call Sid that uniquely identifies the Call to fetch
            
            # @return CallContext CallContext
            def initialize(version, account_sid, sid)
              super(version)
              
              # Path Solution
              @solution = {
                  account_sid: account_sid,
                  sid: sid,
              }
              @uri = "/Accounts/#{@solution[:account_sid]}/Calls/#{@solution[:sid]}.json"
              
              # Dependents
              @recordings = nil
              @notifications = nil
              @feedback = nil
            end
            
            ##
            # Deletes the CallInstance
            # @return Boolean true if delete succeeds, true otherwise
            def delete
              return @version.delete('delete', @uri)
            end
            
            ##
            # Fetch a CallInstance
            # @return CallInstance Fetched CallInstance
            def fetch
              params = {}
              
              payload = @version.fetch(
                  'GET',
                  @uri,
                  params,
              )
              
              return CallInstance.new(
                  @version,
                  payload,
                  account_sid: @solution['account_sid'],
                  sid: @solution['sid'],
              )
            end
            
            ##
            # Update the CallInstance
            # @param String url: URL that returns TwiML
            # @param String method: HTTP method to use to fetch TwiML
            # @param feedback_summary.Status status: Status to update the Call with
            # @param String fallback_url: Fallback URL in case of error
            # @param String fallback_method: HTTP Method to use with FallbackUrl
            # @param String status_callback: Status Callback URL
            # @param String status_callback_method: HTTP Method to use with StatusCallback
            
            # @return CallInstance Updated CallInstance
            def update(url: nil, method: nil, status: nil, fallback_url: nil, fallback_method: nil, status_callback: nil, status_callback_method: nil)
              data = {
                  'Url' => url,
                  'Method' => method,
                  'Status' => status,
                  'FallbackUrl' => fallback_url,
                  'FallbackMethod' => fallback_method,
                  'StatusCallback' => status_callback,
                  'StatusCallbackMethod' => status_callback_method,
              }
              
              payload = @version.update(
                  'POST',
                  @uri,
                  data: data,
              )
              
              return CallInstance.new(
                  @version,
                  payload,
                  account_sid: @solution['account_sid'],
                  sid: @solution['sid'],
              )
            end
            
            ##
            # Access the recordings
            # @return RecordingList RecordingList
            def recordings(sid=:unset)
              if sid != :unset
                return RecordingContext.new(
                    @version,
                    @solution[:account_sid],
                    @solution[:sid],
                    sid,
                )
              end
              
              unless @recordings
                @recordings = RecordingList.new(
                    @version,
                    account_sid: @solution[:account_sid],
                    call_sid: @solution[:sid],
                )
              end
              
              @recordings
            end
            
            ##
            # Access the notifications
            # @return NotificationList NotificationList
            def notifications(sid=:unset)
              if sid != :unset
                return NotificationContext.new(
                    @version,
                    @solution[:account_sid],
                    @solution[:sid],
                    sid,
                )
              end
              
              unless @notifications
                @notifications = NotificationList.new(
                    @version,
                    account_sid: @solution[:account_sid],
                    call_sid: @solution[:sid],
                )
              end
              
              @notifications
            end
            
            ##
            # Access the feedback
            # @return FeedbackList FeedbackList
            def feedback
              return FeedbackContext.new(
                  @version,
                  @solution[:account_sid],
                  @solution[:sid],
              )
            end
            
            ##
            # Provide a user friendly representation
            def to_s
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Api.V2010.CallContext #{context}>"
            end
          end
        
          class CallInstance < InstanceResource
            ##
            # Initialize the CallInstance
            # @return CallInstance CallInstance
            def initialize(version, payload, account_sid: nil, sid: nil)
              super(version)
              
              # Marshaled Properties
              @properties = {
                  'account_sid' => payload['account_sid'],
                  'annotation' => payload['annotation'],
                  'answered_by' => payload['answered_by'],
                  'api_version' => payload['api_version'],
                  'caller_name' => payload['caller_name'],
                  'date_created' => Twilio.deserialize_rfc2822(payload['date_created']),
                  'date_updated' => Twilio.deserialize_rfc2822(payload['date_updated']),
                  'direction' => payload['direction'],
                  'duration' => payload['duration'],
                  'end_time' => Twilio.deserialize_rfc2822(payload['end_time']),
                  'forwarded_from' => payload['forwarded_from'],
                  'from' => payload['from'],
                  'from_formatted' => payload['from_formatted'],
                  'group_sid' => payload['group_sid'],
                  'parent_call_sid' => payload['parent_call_sid'],
                  'phone_number_sid' => payload['phone_number_sid'],
                  'price' => payload['price'].to_f,
                  'price_unit' => payload['price_unit'],
                  'sid' => payload['sid'],
                  'start_time' => Twilio.deserialize_rfc2822(payload['start_time']),
                  'status' => payload['status'],
                  'subresource_uris' => payload['subresource_uris'],
                  'to' => payload['to'],
                  'to_formatted' => payload['to_formatted'],
                  'uri' => payload['uri'],
              }
              
              # Context
              @instance_context = nil
              @params = {
                  'account_sid' => account_sid,
                  'sid' => sid || @properties['sid'],
              }
            end
            
            ##
            # Generate an instance context for the instance, the context is capable of
            # performing various actions.  All instance actions are proxied to the context
            # @return CallContext CallContext for this CallInstance
            def context
              unless @instance_context
                @instance_context = CallContext.new(
                    @version,
                    @params['account_sid'],
                    @params['sid'],
                )
              end
              @instance_context
            end
            
            def account_sid
              @properties['account_sid']
            end
            
            def annotation
              @properties['annotation']
            end
            
            def answered_by
              @properties['answered_by']
            end
            
            def api_version
              @properties['api_version']
            end
            
            def caller_name
              @properties['caller_name']
            end
            
            def date_created
              @properties['date_created']
            end
            
            def date_updated
              @properties['date_updated']
            end
            
            def direction
              @properties['direction']
            end
            
            def duration
              @properties['duration']
            end
            
            def end_time
              @properties['end_time']
            end
            
            def forwarded_from
              @properties['forwarded_from']
            end
            
            def from
              @properties['from']
            end
            
            def from_formatted
              @properties['from_formatted']
            end
            
            def group_sid
              @properties['group_sid']
            end
            
            def parent_call_sid
              @properties['parent_call_sid']
            end
            
            def phone_number_sid
              @properties['phone_number_sid']
            end
            
            def price
              @properties['price']
            end
            
            def price_unit
              @properties['price_unit']
            end
            
            def sid
              @properties['sid']
            end
            
            def start_time
              @properties['start_time']
            end
            
            def status
              @properties['status']
            end
            
            def subresource_uris
              @properties['subresource_uris']
            end
            
            def to
              @properties['to']
            end
            
            def to_formatted
              @properties['to_formatted']
            end
            
            def uri
              @properties['uri']
            end
            
            ##
            # Deletes the CallInstance
            # @return Boolean true if delete succeeds, true otherwise
            def delete
              @context.delete()
            end
            
            ##
            # Fetch a CallInstance
            # @return CallInstance Fetched CallInstance
            def fetch
              @context.fetch()
            end
            
            ##
            # Update the CallInstance
            # @param String url: URL that returns TwiML
            # @param String method: HTTP method to use to fetch TwiML
            # @param feedback_summary.Status status: Status to update the Call with
            # @param String fallback_url: Fallback URL in case of error
            # @param String fallback_method: HTTP Method to use with FallbackUrl
            # @param String status_callback: Status Callback URL
            # @param String status_callback_method: HTTP Method to use with StatusCallback
            
            # @return CallInstance Updated CallInstance
            def update(url: nil, method: nil, status: nil, fallback_url: nil, fallback_method: nil, status_callback: nil, status_callback_method: nil)
              @context.update(
                  method: nil,
                  status: nil,
                  fallback_url: nil,
                  fallback_method: nil,
                  status_callback: nil,
                  status_callback_method: nil,
              )
            end
            
            ##
            # Access the recordings
            # @return recordings recordings
            def recordings
              @context.recordings
            end
            
            ##
            # Access the notifications
            # @return notifications notifications
            def notifications
              @context.notifications
            end
            
            ##
            # Access the feedback
            # @return feedback feedback
            def feedback
              @context.feedback
            end
            
            ##
            # Provide a user friendly representation
            def to_s
              context = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Api.V2010.CallInstance #{context}>"
            end
          end
        end
      end
    end
  end
end