errors = @exception.messages.map do |key, messages|
  [
    key.to_s.gsub(/\[/, '.').gsub(/\]\./, '.'),
    messages.map do |message|
      @exception.full_message(key, message)
    end
  ]
end.to_h
json.errors errors