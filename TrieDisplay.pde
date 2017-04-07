
void setup(){
  
size(500,500);
        /* Creating object of AATree */
        Trie t = new Trie(); 
        String[] list={"school", "scholarly", "hello", "whole", "world", "apple"};
        //String[] list = {"home","house", "homework", "worker", "mountain"};
        list = sort(list);
        for(String word: list){
          t.insert(word);
        }
        //t.print();
        t.displayTrie();

}

void draw(){
}