# Import necessary modules
require "http/server"
require "json"
require "http/client"

# Define a class for the API application
class ApiApp
  # Store simulation results and other data
  @simulation_results : Array(String) = [] of String

  # Method to handle the root endpoint
  def self.root(response : HTTP::Server::Response)
    response.content_type = "application/json"
    response.print({ message: "Welcome to the Simulation API" }.to_json)
  end

  # Method to run a simulation based on user input
  def self.run_simulation(user_input : String) : String
    # Simulate some processing (replace with actual simulation logic)
    sleep(1) # Simulate a delay for processing
    result = "Simulation result for input '#{user_input}': Success! Random value: #{rand(1..100)}"
    
    # Store the result in the array
    @simulation_results << result
    
    return result
  end

  # Method to handle simulation requests
  def self.simulate(response : HTTP::Server::Response, request : HTTP::Server::Request)
    if request.method == "POST"
      user_input = request.body.to_s.strip

      if user_input.empty?
        response.status = HTTP::Status::BadRequest
        response.content_type = "application/json"
        response.print({ error: "User input cannot be empty" }.to_json)
        return
      end

      result = run_simulation(user_input)

      response.content_type = "application/json"
      response.print({ result: result }.to_json)
    else
      response.status = HTTP::Status::MethodNotAllowed
      response.content_type = "application/json"
      response.print({ error: "Method not allowed. Use POST." }.to_json)
    end
  end

  # Method to retrieve all simulation results
  def self.get_results(response : HTTP::Server::Response)
    response.content_type = "application/json"
    
    if @simulation_results.empty?
      response.print({ message: "No simulation results available." }.to_json)
    else
      response.print({ results: @simulation_results }.to_json)
    end
  end

  # Method to clear all simulation results
  def self.clear_results(response : HTTP::Server::Response)
    @simulation_results.clear
    
    response.content_type = "application/json"
    response.print({ message: "All simulation results cleared." }.to_json)
  end

  # Method to handle unknown routes
  def self.not_found(response : HTTP::Server::Response)
    response.status = HTTP::Status::NotFound
    response.content_type = "application/json"
    response.print({ error: "404 Not Found" }.to_json)
  end

  # Start the server and define routes
  def self.start_server
    server = HTTP::Server.new do |context|
      case context.request.path
      when "/"
        root(context.response)
      when "/simulate"
        simulate(context.response, context.request)
      when "/results"
        get_results(context.response)
      when "/clear_results"
        clear_results(context.response)
      else
        not_found(context.response)
      end
    end

    address = "127.0.0.1"
    port = 8080

    puts "Listening on http://#{address}:#{port}"
    server.bind_tcp(address, port)
    server.listen
  end
end

# Start the application server when the script is executed
ApiApp.start_server
