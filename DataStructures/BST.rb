#BST
require_relative 'QueueArray'
class BST

    def initialize ()
        @root = nil
    end

    class Node
        attr_accessor :key, :value, :left, :right, :count

        def initialize (key, value)
            @key = key
            @value = value
            @count = 1
        end
    end 

    def put (key, value)
        @root = putN(@root, key, value) 
    end

    def size ()
        return sizeN(@root)
    end

    def get (key)
        node = @root
        while !node.nil?
            if node.key > key then
                node = node.left
            elsif node.key < key then
                node = node.right
            else 
                return node.value
            end
        end
        return nil
    end

    def delete (key)
        @root = deleteN(@root, key)
    end

    def deleteMin ()
        @root = deleteMinN(@root)
    end

    def keys ()
        q = Queue.new()
        inOrder(@root, q)
        return q
    end

    def min ()
        min = minN(@root)
        if min.nil? then return nil end
        return min.value
    end

    def max ()
        node = @root
        if node.nil? then return nil end
        while !node.right.nil?
            node = node.right
        end
        return node.value
    end

#private methods
    def putN (node, key, value)
        if node.nil? then 
            return Node.new(key, value)
        end
        if node.key > key then
            node.left = putN(node.left, key, value)
        elsif node.key < key then
            node.right = putN(node.right, key, value)
        else 
            node.value = value
        end   
        node.count = 1 + sizeN(node.left) + sizeN(node.right)
        return node           
    end

    def sizeN (node)
        if node.nil? then return 0 end
        return node.count
    end

    def deleteN (node, key)
        if node.nil? then return nil end
        if node.key > key then
            node.left = deleteN(node.left, key)
        elsif node.key < key then
            node.right = deleteN(node.right, key)
        else
            if node.right.nil? then return node.left end
            if node.left.nil? then return node.right end

            t = node
            node = minN(t.right)
            node.right = deleteMinN(t.right)
            node.left = t.left
        end
        node.count = 1 + sizeN(node.left) + sizeN(node.right)
        return node
    end

    def deleteMinN (node)
        if node.left.nil? then return node.right end
        node.left = deleteMinN(node.left)
        node.count = 1 + sizeN(node.left) + sizeN(node.right)
        return node
    end

    def minN (node)
        if node.nil? then return nil end
        while !node.left.nil?
            node = node.left
        end
        return node
    end

    def inOrder (node, q)
        if node.nil? then return nil end
        inOrder(node.left, q)
        q.enqueue(node)
        inOrder(node.right, q)
    end

    private :putN, :sizeN, :deleteN, :deleteMinN, :minN, :inOrder
end