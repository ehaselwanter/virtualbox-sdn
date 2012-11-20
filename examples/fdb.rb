# fdb.rb

class FDB
  def initialize
    @db = {}
  end


  def lookup mac
    @db[ mac ]
  end


  def learn mac, port_no
    @db[ mac ] = port_no
  end
end