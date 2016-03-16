require 'socket'               # Get sockets from stdlib

module EmailApp

  class EmailApp::ListeningSocket
    server = TCPServer.open(587)  # Socket to listen on port 2000
    loop {                         # Servers run forever
      client = server.accept       # Wait for a client to connect
      client.puts(Time.now.ctime)  # Send the time to the client
      client.puts "Closing the connection. Bye!"
      client.close                 # Disconnect from the client
    }
  end
end