<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:bfg="http://www.betfair.com/publicapi/v3/BFGlobalService/">
   <soapenv:Header/>
   <soapenv:Body>
      <bfg:login>
         <bfg:request>
            <ipAddress>0</ipAddress>
            <locationId>0</locationId>
            <password></password>
            <productId>82</productId>
            <username>m_seymi</username>
            <vendorSoftwareId>0</vendorSoftwareId>
         </bfg:request>
      </bfg:login>
   </soapenv:Body>
</soapenv:Envelope>



client = Savon.client("http://service.example.com?wsdl")


require 'Savon'
client = Savon.client("https://api.betfair.com/global/v3/BFGlobalService.wsdl")
HTTPI.log = false
client.http.auth.ssl.verify_mode = :none

//client.http.auth.ssl.cert_key_file = "lib/assets/cacert.pem"
//client.http.auth.ssl.cert_key_file = "cacert.pem"

client.request :web, :LoginReq, body: { "ipAddress" => "0", "locationId" => "0", "username" => "m_seymi", "productId" => "82", "password" => "fl1wsalbf", "vendorSoftwareId" => "0"}
client.request :LoginReq, body: { "ipAddress" => "0", "locationId" => "0", "username" => "m_seymi", "productId" => "82", "password" => "fl1wsalbf", "vendorSoftwareId" => "0"}

client.request :bfg, :LoginReq, body: { "ipAddress" => "0", "locationId" => "0", "username" => "foo", "productId" => "82", "password" => "bar", "vendorSoftwareId" => "0"}
client.request :bf, :login, body: { "ipAddress" => "0", "locationId" => "0", "username" => "foo", "productId" => "82", "password" => "bar", "vendorSoftwareId" => "0"}





Savon.client do |w, h|
  puts w.document
  puts h.proxy
end


client.wsse.credentials "m_seymi", "fl1wsalbf"
  
response = client.request :login


client = Savon::Client.new("http://www.webservicex.net/uszip.asmx?WSDL")
client.wsdl.soap_actions
client.request :web, :get_info_by_zip, body: { "USZip" => "90210" }


client.request :web, :get_info_by_zip, body: { "USZip" => "90210" }





https.ca_file = 'lib/assets/cacert.pem'



client = Savon::Client.new do |wsdl, http| 
  http.auth.ssl.verify_mode = :none 
  wsdl.document = "https://api.betfair.com/global/v3/BFGlobalService.wsdl"
end 





username            = 'm_seymi'
password            = 'fl1wsalbf'
product_id          = 82
vendor_software_id  = 0
location_id         = 0
ip_address          = nil

session_token = bf.login(username, password, product_id, vendor_software_id, location_id, ip_address)




OpenSSL::SSL::SSLError: SSL_connect returned=1 errno=0 state=SSLv3 read server certificate B: certificate verify failed






D, [2012-08-27T03:33:43.101137 #1392] DEBUG -- : SOAP request: https://api.betfair.com/global/v3/BFGlobalService
D, [2012-08-27T03:33:43.101137 #1392] DEBUG -- : SOAPAction: "loginReq", Content-Type: text/xml;charset=UTF-8, Content-Length: 683
D, [2012-08-27T03:33:43.101137 #1392] DEBUG -- : <?xml version="1.0" encoding="UTF-8"?>
      <env:Envelope xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:web="http://www.betfair.com/publicapi/v3/BFGlobalService/" xmlns:env="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ins0="http://www.betfair.com/publicapi/v3/BFGlobalService/" xmlns:ins1="http://www.betfair.com/publicapi/types/global/v3/">
         <env:Body><web:loginReq><web:ipAddress>0</web:ipAddress><web:locationId>0</web:locationId><web:username>m_seymi</web:username><web:productId>82</web:productId><web:password>fl1wsalbf</web:password><web:vendorSoftwareId>0</web:vendorSoftwareId></web:loginReq></env:Body></env:Envelope>
         D, [2012-08-27T03:33:43.491138 #1392] DEBUG -- : SOAP response (status 500):
         D, [2012-08-27T03:33:43.491138 #1392] DEBUG -- : <?xml version="1.0" encoding="UTF-8"?>
         <soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
         <soap:Body soap:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/">
         <soap:Fault><faultcode>soap:Server</faultcode><faultstring>INTERNAL_ERROR</faultstring></soap:Fault></soap:Body>
         </soap:Envelope>
         
         Savon::SOAP::Fault: (soap:Server) INTERNAL_ERROR
         from C:/RailsInstaller/Ruby1.9.3/lib/ruby/gems/1.9.1/gems/savon-1.1.0/lib/savon/soap/response.rb:107:in `raise_errors'
         from C:/RailsInstaller/Ruby1.9.3/lib/ruby/gems/1.9.1/gems/savon-1.1.0/lib/savon/soap/response.rb:18:in `initialize'
        from C:/RailsInstaller/Ruby1.9.3/lib/ruby/gems/1.9.1/gems/savon-1.1.0/lib/savon/soap/request.rb:35:in `new'
        from C:/RailsInstaller/Ruby1.9.3/lib/ruby/gems/1.9.1/gems/savon-1.1.0/lib/savon/soap/request.rb:35:in `response'
        from C:/RailsInstaller/Ruby1.9.3/lib/ruby/gems/1.9.1/gems/savon-1.1.0/lib/savon/client.rb:84:in `request'
        from (irb):30
        from C:/RailsInstaller/Ruby1.9.3/bin/irb:12:in `<main>'
irb(main):031:0>



-----------------------


require 'betfair'

@bf = Betfair::API.new #(proxy, logging)       # Initialize BF API methods

bf.http.auth.ssl.verify_mode = :none


def login(args)
  @bf.login(args[:username], args[:password], args[:product_id], args[:vendor_software_id], args[:location_id], args[:ip_address])  
end


