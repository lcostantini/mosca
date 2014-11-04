class ClientDouble
  attr_accessor :connected
  def connect *args
    self.connected = true
    self
  end

  def connected?
    !! connected
  end

  def last_ping_response
    Time.now
  end

  def method_missing *args

  end

  def get topic, *args
    if topic == "json_in_topic"
      response = '{"a":123}'
    elsif topic == "json_array_in_topic"
      response = '["a",1,2]'
    else
      response = "response"
    end

    yield topic, response
  end

end
