# hello-switch.rb

class HelloSwitch < Controller
  def switch_ready dpid
    info "Hello #{ dpid.to_hex }!"
  end
end