def rolling_buffer1(buffer, max_buffer_size, new_element)
  puts buffer.object_id
  buffer << new_element
  puts buffer.object_id
  buffer.shift if buffer.size >= max_buffer_size
  puts buffer.object_id
  buffer

end

def rolling_buffer2(buffer, max_buffer_size, new_element)
  puts buffer.object_id
  buffer += [new_element]
  puts buffer.object_id
  buffer.shift if buffer.size >= max_buffer_size
  puts buffer.object_id
  buffer
end