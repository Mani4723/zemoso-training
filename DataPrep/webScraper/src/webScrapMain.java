import java.io.IOException;

public class webScrapMain {
    public static void main(String[] args) {

        System.out.print("Enter the url:");
        try {
            String url = String.valueOf(args[0]);

            if (!url.isEmpty()) {
                webScraper.scrapData(url);
            }

        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
