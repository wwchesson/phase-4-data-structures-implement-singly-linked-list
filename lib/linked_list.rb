require_relative './node'

class LinkedList
    attr_accessor :head

    def initialize
      @head = nil
    end
  
    def append(node)
      # Add element to the beginning of the list if the list is empty
      if head.nil?
        self.head = node
        return
      end
  
      # Otherwise, traverse the list to find the last node
      last_node = head
      while last_node.next_node
        last_node = last_node.next_node
      end
  
      # and add the node to the end
      last_node.next_node = node
    end

    def prepend(node)
        node.next_node = head
        self.head = node
        #can't just write self.head = node b/c then don't shift all the rest of the elements; would just replace the head element
    end

    def delete_head
        if head.nil? 
            self
        else
            self.head = self.head.next_node
        end
    end

    def delete_tail
        return unless head
        return delete_head if head.next_node.nil?

        curr = head
        prev = nil
        while curr.next_node
            prev = curr
            curr = curr.next_node
        end
        #eventually "prev" becomes the next to last node and the "curr" the last node. The next line deletes the tail. 
        prev.next_node = nil
    end

    def add_after(index, node)
        return append(node) if index == 0

        curr_index = 0
        curr = head

        while curr_index < index
            curr_index += 1
            curr = curr.next_node
        end

        if curr
            node.next_node = curr.next_node
            curr.next_node = node
        else
            append(node)
        end

    end


end
