#BST
#To DO
#get floor, ceiling
#get range

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

    def keys (order_type = 2)
        q = Queue.new()
        case order_type
        when 1
            preOrderN(@root, q)  
        when 2
            inOrderN(@root, q)
        when 3
            postOrderN(@root, q)  
        when 4
            levelOrderN(@root, q)
        end
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

    def floor (key)
        node = floorN(@root, key)
        if node.nil? then return nil end
        return node.key
    end

    def keysC ()
        q = Queue.new()
        tmp = Array.new()
        node = @root
        while !tmp.empty? or !node.nil?
            if !node.nil? then
                tmp.push(node)
                node = node.left
            else
                node = tmp.pop()
                q.enqueue(node)
                node = node.right
            end
        end
        return q
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

    def inOrderN (node, q)
        if node.nil? then return nil end
        inOrderN(node.left, q)
        q.enqueue(node)
        inOrderN(node.right, q)
    end

    def preOrderN (node, q)
        if node.nil? then return nil end
        q.enqueue(node)
        preOrderN(node.left, q)
        preOrderN(node.right, q)
    end

    def postOrderN (node, q)
        if node.nil? then return nil end
        postOrderN(node.left, q)
        postOrderN(node.right, q)
        q.enqueue(node)
    end

    def levelOrderN (node, q)
        if node.nil? then return nil end

        tmp = Array.new()
        tmp << node

        while !tmp.empty?
            x = tmp.delete_at(0)

            q.enqueue(x)

            if !x.left.nil? then tmp << x.left end
            if !x.right.nil? then tmp << x.right end
        end
    end

    def floorN (node, key)
        if node.nil? then return nil end

        if key == node.key then return node end
        if key < node.key then return floorN(node.left, key) end 
        x = floorN(node.right, key)
        if x.nil? then return node 
        else 
            return x
        end
    end

    private :putN, :sizeN, :deleteN, :deleteMinN, :minN, :preOrderN, :inOrderN, :postOrderN, :levelOrderN
end

module OrderType
  PRE = 1
  IN = 2
  POST = 3
  LEVEL = 4
end

