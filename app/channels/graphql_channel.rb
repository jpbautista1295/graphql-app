class GraphqlChannel < ApplicationCable::Channel
  def subscribed
    @subscription_ids = []
  end

  def unsubscribed
    @subscription_ids.each do |sid|
      GraphqlAppSchema.subscriptions.delete_subscription(sid)
    end
  end

  def execute(data)
    query_data = if data.is_a?(Hash)
      # Remove the 'action' key if it exists (Action Cable artifact)
      data.except('action')
    else
      # If it's a string, parse it as JSON
      JSON.parse(data.to_s)
    end

    query_string = query_data["query"] || query_data[:query]
    variables = query_data["variables"] || query_data[:variables] || {}

    result = GraphqlAppSchema.execute(
      query_string,
      variables: variables,
      context: {
        channel: self
      }
    )

    if result.subscription?
      @subscription_ids << result.context[:subscription_id]
    end

    transmit(result.to_h)
  end

  private

  def ensure_hash(ambiguous_param)
    case ambiguous_param
    when String
      if ambiguous_param.present?
        JSON.parse(ambiguous_param)
      else
        {}
      end
    when Hash, ActionController::Parameters
      ambiguous_param
    when nil
      {}
    else
      raise ArgumentError, "Unexpected parameter: #{ambiguous_param}"
    end
  end
end
