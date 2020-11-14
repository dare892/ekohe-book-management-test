class JsonWebToken
 class << self
   def encode(payload, exp = 24.hours.from_now)
     payload[:exp] = exp.to_i
     # normally this would be done via a secrets file but didn't want to bother having to pass over the master.key, etc
     JWT.encode(payload, '97126cf45389928d4a0159c39fd15a0312f9ee7199994dc20b66f129d334a3ec')
   end

   def decode(token)
     # normally this would be done via a secrets file but didn't want to bother having to pass over the master.key, etc
     body = JWT.decode(token, '97126cf45389928d4a0159c39fd15a0312f9ee7199994dc20b66f129d334a3ec')[0]
     HashWithIndifferentAccess.new body
   rescue
     nil
   end
 end
end
