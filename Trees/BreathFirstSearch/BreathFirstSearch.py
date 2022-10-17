import json
class Node:
    value = None
    def __init__(self, data):
        self.value = data
        self.edges = []
        self.searched = False
        self.parent = None
    def addEdge(self, node):
        self.edges.append(node)
        node.edges.append(self)
class Graph:
    node = []
    graph = {}
    def addNode(self, node):
        self.node.append(node)
        title = node.value
        self.graph[title] = node
    def getNode(self, actor):
        try:
            n = self.graph[actor]
            return n
        except:
            return None
    
if __name__ == "__main__":
    f = open("E:\Work\Programming\Learning New Things\Sorting-Algorithms\Trees\BreathFirstSearch\data.json", 'r')
    data = json.load(f)
    movies = data['movies']
    graph = Graph()
    for i in range(len(movies)):
        movie = movies[i]['title']
        cast = movies[i]['cast']
        movieNode = Node(movie)
        graph.addNode(movieNode)
        for j in range(len(cast)):
            actor = cast[j]
            actorNode = graph.getNode(actor)
            if actorNode==None:
                actorNode = Node(actor) 
            graph.addNode(actorNode)
            movieNode.addEdge(actorNode)