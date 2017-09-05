import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.io.FileWriter;
import java.io.IOException;

class webScraper {

    static void scrapData(String url) throws IOException {

        String dept = "", code, descp, rate;
        int fspace = 0, lspace = 0;
        FileWriter out = new FileWriter("NIMS.csv");

        //Header
        out.append("Department");
        out.append(",");
        out.append("Code");
        out.append(",");
        out.append("Description");
        out.append(",");
        out.append("Rate");
        out.append("\n");


        try {
            Document document = Jsoup.connect(url).get();
            //all the elements have className: MsoPlainText.
            Elements ele = document.getElementsByClass("MsoPlainText");
            for (Element csv : ele) {
                String obs = csv.text();
                obs = obs.replace("\u00A0", "");
                obs = obs.trim();


                //remove headings, separations
                if (obs.matches("NIMS.*") || obs.matches("==.*") ||
                        obs.matches("--.*") || obs.matches("CODE.*")) {
                    continue;
                }

                //Collect department Name
                if (obs.matches("DEPARTMENT.*")) {
                    dept = obs.substring(14);
                    continue;
                }

                //find the separator space index.
                if (obs.length() > 0) {
                    fspace = obs.indexOf(" ");
                    lspace = obs.lastIndexOf(" ");
                }

                //Break when accommodation line starts
                if (obs.matches("ACCOMMODATION.*")) {
                    break;
                }

                //Separate the lines with comma
                if (obs.length() > 0 && fspace > 0 && lspace > 0) {
                    code = obs.substring(0, fspace);
                    descp = "'" + obs.substring(fspace+1, lspace) + "'";
                    rate = obs.substring(lspace);
                    out.append(dept);
                    out.append(", ");
                    out.append(code);
                    out.append(", ");
                    out.append(descp);
                    out.append(", ");
                    out.append(rate);
                    out.append("\n");
                }
            }
        } catch (IOException | IndexOutOfBoundsException e) {
            e.printStackTrace();
        } finally {
            out.close();
        }
    }
}


