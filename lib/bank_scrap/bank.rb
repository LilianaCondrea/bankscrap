require 'curb'

module BankScrap
  class Bank

    WEB_USER_AGENT = 'Mozilla/5.0 (Linux; Android 4.2.1; en-us; Nexus 4 Build/JOP40D) AppleWebKit/535.19 (KHTML, like Gecko) Chrome/18.0.1025.166 Mobile Safari/535.19'

    private

    def post(url, fields)
    	@curl.url = url
    	@curl.post(fields)

    	@curl.body_str

    end

    def initialize_cookie(url)
    	log 'Initialize cookie'

    	@curl.url = url
    	@curl.get

    	@curl.body_str

    end 

    def initialize_connection
			@curl = Curl::Easy.new
			@curl.follow_location = true
			@curl.ssl_verify_peer = false
			@curl.verbose = true if @debug
			@curl.enable_cookies = true
			@curl.headers["User-Agent"] = WEB_USER_AGENT
		end

    def log(msg)
      puts msg if @log
    end
  end
end