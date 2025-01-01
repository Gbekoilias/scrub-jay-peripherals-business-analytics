# Import necessary modules
require "http/server"
require "json"

# Define a route for the home page
class MyApp
  # Store user input and simulation output
  @userInput : String | Nil
  @simulationOutput : String | Nil

  # Method to render the home page
  def self.home_page(response : HTTP::Server::Response)
    response.print <<-HTML
      <!DOCTYPE html>
      <html>
      <head>
        <meta charset="UTF-8">
        <title>Simulation Interface</title>
        <style>
          body { font-family: Arial, sans-serif; }
          h1 { color: #333; }
          form { margin-bottom: 20px; }
          input[type="text"] { width: 300px; padding: 10px; }
          input[type="submit"] { padding: 10px 20px; }
          .output { margin-top: 20px; }
        </style>
      </head>
      <body>
        <h1>Welcome to the Simulation App</h1>
        <form action="/simulate" method="post">
          <label for="userInput">Enter your input:</label><br>
          <input type="text" id="userInput" name="userInput" required><br><br>
          <input type="submit" value="Run Simulation">
        </form>
    HTML

    # Display previous simulation output if available
    if @simulationOutput
      response.print "<div class='output'><strong>Simulation Output:</strong> #{@simulationOutput}</div>"
    end

    response.print <<-HTML
      </body>
      </html>
    HTML
  end

  # Method to run the simulation based on user input
  def self.run_simulation(user_input : String) : String
    # Simulate some processing (replace with actual simulation logic)
    sleep(1) # Simulate a delay for processing
    "Simulation result for input '#{user_input}': Success! Random value: #{rand(1..100)}"
  end

  # Method to handle simulation requests
  def self.simulate(response : HTTP::Server::Response, request : HTTP::Server::Request)
    if request.method == "POST"
      @userInput = request.params["userInput"]
      @simulationOutput = run_simulation(@userInput)

      # Redirect back to the home page to display results
      response.redirect("/")
    else
      response.status = HTTP::Status::MethodNotAllowed
      response.print "Method not allowed"
    end
  end

  # Start the server and define routes
  def self.start_server
    server = HTTP::Server.new do |context|
      case context.request.path
      when "/"
        home_page(context.response)
      when "/simulate"
        simulate(context.response, context.request)
      else
        context.response.status = HTTP::Status::NotFound
        context.response.print "404 Not Found"
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
MyApp.start_server
