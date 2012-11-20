require "fdb"

class LearningSwitch < Controller

  def start
    @fdb = FDB.new
  end

  def packet_in dpid, message

 	info "received a packet_in dpid: #{ dpid.to_hex }, in_port: #{ message.in_port } for mac: #{message.macsa}"

	# When a packet comes in as a packet-in message, make FDB learn its macsa and the in_port
    @fdb.learn message.macsa, message.in_port
	# Look up the destination's port number from packet's macda
    port_no = @fdb.lookup( message.macda )
    if port_no
		# If found: update switch's flow-table and 
    	info "found a port for mac: #{message.macda} from port:#{ message.in_port }, adding to flow and forward to port #{port_no}"
      	flow_mod dpid, message, port_no
    	# do packet-out the packet
      	packet_out dpid, message, port_no
    else
	# If not-found: flood the packet
	  info "did not find a destination, flooding packet from port: #{port_no} with mac:#{message.macda}"
      flood dpid, message
    end
  end


  ##############################################################################
  private
  ##############################################################################


  def flow_mod dpid, message, port_no
    send_flow_mod_add(
      dpid,
      :match => ExactMatch.from( message ),
      :actions => ActionOutput.new( port_no )
    )
  end


  def packet_out dpid, message, port_no
    send_packet_out(
      dpid,
      :packet_in => message,
      :actions => ActionOutput.new( port_no )
    )
  end


  def flood dpid, message
    packet_out dpid, message, OFPP_FLOOD
  end
end
