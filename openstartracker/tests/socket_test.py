# Imports
import socket                
  
# Create a socket object 
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)      
print "Socket created"
  
# Select port and set buffer size, initialize data
PORT = 5555       
BUFFER_SIZE = 1024
data = ""
  
# Bind to the port 
s.bind(('', PORT))         
print "Socket bound to %s" %(PORT) 
  
# Put socket in istening mode 
s.listen(5)      
print "Socket is listening"            

# Loop until broken
while True: 
	
	# Establish connection with client. 
	c, addr = s.accept()      
	print "Got connection from", addr 

	# Receive data w/ CYA policy
	try:
		data = c.recv(BUFFER_SIZE)
	except:
		print "An error occurred"

	# Remove stray whitespace
	data = data.strip()

	# Execute appropriate action
	if data == "quit":
		c.send("Quitting...")
		c.close()
		break
	
	c.send("Coordinates: blah blah blah")
	c.close()