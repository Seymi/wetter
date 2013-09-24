class BetfairAPI  
  require 'savon'  
  ##################################  
  ## General API Services Reference  
  ##################################  
  # In a IRB console  
  # require 'rubygems'  
  # require 'betfairapi-savon'	  
  # api = BetfairAPI.new        
  # login = api.login('username', 'password', 82, 0, 0, nil)  
  # login = login.to_hash[:login_response]  
  # session_token = login[:result][:header][:session_token]    

  def login(username, password, product_id, vendor_software_id, location_id, ip_address)    
    global.request :bf, :login do       
      soap.body = { 'bf:request' => { :username => username, :password => password, :productId => product_id, :vendorSoftwareId => vendor_software_id, :locationId => location_id, :ipAddress => ip_address } }    
    end  
  end

  def global	    
    global = Savon::Client.new do      
      wsdl.endpoint = 'https://api.betfair.com/global/v3/BFGlobalService'      
      wsdl.namespace = 'https://www.betfair.com/global/v3/BFGlobalService'    
    end
    global.http.auth.ssl.verify_mode = :none  
  end
  
  def api_request_header(session_token)    
    { :client_stamp => 0, :session_token => session_token }  
  end  
  
end

api = BetfairAPI.new

l = api.login('m_seymi', 'fl1wsalbf', 82, 0, 0, nil)
