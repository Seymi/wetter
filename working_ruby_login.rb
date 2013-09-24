

require 'savon'
client = Savon.client("https://api.betfair.com/global/v3/BFGlobalService.wsdl")
client.http.auth.ssl.verify_mode = :none
HTTPI.log = false
client.wsdl.soap_actions

@user = 'm_seymi'
@pw   = 'fl1wsalbf'

body = { :ipAddress        => "0", 
         :locationId       => "0",
         :password         => @pw, 
         :productId        => "82",
         :username         => @user,
         :vendorSoftwareId => "0" 
       }




response = client.request :bfg, :login do  
  soap.namespaces["xmlns:bfg"] = "http://www.betfair.com/publicapi/types/exchange/v5/"  
  soap.body = { "bfg:request" => body } 
end

request_ok    = response[:login_response][:result][:header][:error_code]
error_code    = response[:login_response][:result][:error_code]
session_token = response[:login_response][:result][:header][:session_token]

request_ok
error_code
session_token


-----------------------------------------------


require 'savon'
client = Savon::Client.new("http://www.webservicex.net/uszip.asmx?WSDL")
client.wsdl.soap_actions


client.request :web, :get_info_by_zip, body: { "USZip" => "90210" }


response.to_hash [:login_response] [:session_token] [:timestamp] 

response.to_array(:login_response, :session_token, :timestamp)



 ["@xsi:type"] [:currency] [:error_code] [:minor_error_code] [:valid_until] [:"@xsi:type"] [:"@xmlns:n"] 



=>

 {:login_response=>{
   :result=>{
     :header=>{
       :error_code=>"OK",
   :minor_error_code=>nil,

 :session_token=>"B7AtisSVmrXwow+Pt+2mrfOBV4y3a3eJVFCCmixvyPE=", 
 :timestamp=>"2012-08-29T01:14:18.024Z",
 :"@xsi:type"=>"n2:APIResponseHeader"},
 :currency=>"EUR",
 :error_code=>"OK",
 :minor_error_code=>nil,
 :valid_until=>"0001-01-01T00:00:00.000Z", 
 :"@xsi:type"=>"n2:LoginResp"}, 
 :"@xmlns:n"=>"http://www.betfair.com/publicapi/v3/BFGlobalService/"}}


