
class Trie{

    private TrieNode root;

       /* Constructor */
      public Trie(){
          root = new TrieNode(' '); 
      }

       /* Function to insert word */
  
      public void insert(String word){
          if (search(word) == true) 
              return;        
          TrieNode current = root; 
          for (char ch : word.toCharArray()){
              TrieNode child = current.subNode(ch);
              if (child != null)
                  current = child;
              else {
                   current.childList.add(new TrieNode(ch));
                   current = current.subNode(ch);
              }
              current.count++;
          }
          current.isEnd = true;
      }

      /* Function to search for word */
      public boolean search(String word){
          TrieNode current = root;  
          for (char ch : word.toCharArray()){
              if (current.subNode(ch) == null)
                  return false;
              else
                  current = current.subNode(ch);
          }      
          if (current.isEnd == true) 
              return true;
          return false;
      }

      /* Function to remove a word */
  
      public void remove(String word){
          if (search(word) == false) {
              System.out.println(word +" does not exist in trie\n");
              return;
          }             
  
          TrieNode current = root;
          for (char ch : word.toCharArray()){ 
              TrieNode child = current.subNode(ch);
              if (child.count == 1){
                  current.childList.remove(child);
                  return;
              } 
              else{
                  child.count--;
                  current = child;
              }
          }
          current.isEnd = false;
     }
     
     public void print(){
       printTrie(root, 0);
     }
      
     public void displayTrie(){
       display(root, 0, 0, 0);
     }
      
     private void printTrie(TrieNode node, int offset) {
       for (int i = 0 ; i < offset; i++){
         System.out.print(" ");
       }
       System.out.print(node.content + "\n");
       for(TrieNode child : node.childList) {
               printTrie(child, offset + 2);
          } 
     }
    
     private void display(TrieNode node, int offsety, int offsetx, int level){
         text(node.content, width/2 + offsetx, offsety);
         for(TrieNode child : node.childList) {
               display(child, offsety +10, offsetx + 10, level+1);
               offsety += (level+1)* 30;
         }
     }
}    