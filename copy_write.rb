
class Copy
  def initialize(reader, writer)
    @reader = reader
    @writer = writer
  end

  def copy
    writer.write(reader.read)
  end
end

class ReadKeyboard
  def read
  end
end

class WritePrinter
  def write
  end
end
