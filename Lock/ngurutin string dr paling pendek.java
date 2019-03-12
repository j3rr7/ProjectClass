import java.util.Comparator;
import java.util.PriorityQueue;
public class Nyoba {
    public static void main(String[] args) 
    {
        Comparator<String> stc = new Comparator<String>()
        {
            @Override
            public int compare(String s1, String s2)
            {
                return s1.length() - s2.length();
            }
        };
        
        PriorityQueue<String> que = new PriorityQueue<>(stc);
        
        que.add("aaaaaa");
        que.add("aaaaaaaaaaaaa");
        que.add("aaa");
        que.add("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
        que.add("aa");
        que.add("a");
        
        while (!que.isEmpty()) {
            System.out.println(que.remove());
        }
    }
}