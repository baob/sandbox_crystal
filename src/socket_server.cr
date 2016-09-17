# vi: set ft=ruby :

require "socket"

ch = Channel(TCPSocket).new

10.times do
  spawn do
    puts "spawning ..."
    $stdout.flush
    loop do
      socket = ch.receive
      socket.puts "Hi!"
      socket.close
    end
  end
end

server = TCPServer.new(1234)
loop do
  socket = server.accept
  puts "accepted: #{socket.inspect}"
  $stdout.flush
  ch.send socket
end
