import sys
sys.setrecursionlimit(1500)
class Node:
    def __init__(self, data):
        self.left = None
        self.right = None
        self.data = data
   
    def addNode(self, value):
        if self.data: 
            if value < self.data:
                if self.left == None:
                    self.left = Node(value)
                else:
                    self.left.addNode(value)
            elif value > self.data:
                if self.right == None:
                    self.right = Node(value)
                else:
                    self.right.addNode(value)
            

    def details(self):
        print("Node data: ", self.data, "\n Node Left: ", self.left, "\n Node Right: ", self.right)

    def searchTree(self, value):
        if value == self.data:
            print("Node Found: ", self.data)
        elif value < self.data:
            self.searchTree(self.left.data)
        elif value > self.data:
            self.searchTree(self.right.data)
        else:
            print("Value Doesn't Exist in tree!")


if __name__ == "__main__":
    root = Node(2)
    root.addNode(34)
    root.addNode(1)
    # root.addNode(40)
    # root.addNode(29)
    # root.details()
    root.searchTree(34)
