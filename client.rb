require "httparty"

module Names
  class Client
    Name = Struct.new(:id, :name, :births)
    BASE_URL = "http://localhost:9292".freeze

    def all_names
      fetch_paginated_data("/users")
      .map { |data| wrap_with_domain_user(data) }
    end

    def find_name(name)
      all_names.detect { |n| n.name == name }
    end

    private

    def wrap_with_domain_user(data)
      Name.new(data["id"], data["name"], data["births"]) 
    end

    def fetch_paginated_data(path)
      Enumerator.new do |yielder|
        page = 1

        loop do
          results = fetch_data("#{path}?page=#{page}")

          if results.success?
            results.map { |item| yielder << item }
            page += 1
          else
            raise StopIteration
          end
        end
      end.lazy
    end

    def fetch_data(path)
      HTTParty.get(BASE_URL + path)
    end
  end
end

client = Names::Client.new
require "pry"; binding.pry
puts "done"
