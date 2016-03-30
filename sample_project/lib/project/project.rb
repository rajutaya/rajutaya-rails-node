module SampleProject
  require 'httpclient'
  class Project
    def self.get_search_keywords(keywords)
     p keywords
      # Use Cases:
      # Keywords with filter options
      begin
        if keywords
          k = "keywords=#{keywords}"
          uri = "get_node_search"
          response = Project.send_get_request(uri,k)
        else
          return []
        end
      rescue => e
        []
      end
    end

    def self.process_get_response(resp)
      begin
        return nil unless resp.is_a?(HTTP::Message)
        return nil unless resp.status == 200
        return nil if resp.body.empty?
        return JSON.parse(resp.body)
      rescue => e
        return nil
      end
    end


    def self.send_get_request(uri, params = nil)
      # client = HTTPClient.new
      # client.default_header["accept"]="application/json"
      if params
        # res = client.get("http://#{Rails.configuration.sample_project_uri}/#{uri}?#{params}")
        # res = client.get("http://#{Rails.configuration.sample_project_uri}/#{uri}", :query => params)
        url=URI.parse("http://#{Rails.configuration.sample_project_uri}/#{uri}?#{params}")
        req = Net::HTTP.new(url.host, url.port)
        # begin
          # res = req.request_head(url.path)      
          # if res.code != "404"
            request = Net::HTTP::Get.new(url.request_uri) 
            response = req.request(request)
          # end
        # rescue Exception => e
        #     response = "#{e.message}"
        # end
      else
        # res = client.get(uri)
        response = "#{e.message}"
      end
      # return process_get_response(response)
      return JSON.parse(response.body)
    end
    
  end
end
