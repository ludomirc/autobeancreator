package net.xandalabs.model;

import org.w3c.dom.Document;
import org.w3c.dom.Element;


public abstract class AbstractItem {
    private String message = "";

    public static AbstractItem[] combineItems(AbstractItem[][] inItems) {
        int collectionCount = inItems.length;
        int[] count = new int[collectionCount];
        int totalCount = 0;
        for (int i = 0; i < collectionCount; i++) {
            count[i] = inItems[i].length;
            System.err.println("Found " + count[i] + " Items within array number " + i);
            totalCount = totalCount + count[i];
        }
        AbstractItem[] outItems = new AbstractItem[totalCount];
        int runningPosition = 0;
        for (int i = 0; i < collectionCount; i++) {
            for (int j = 0; j < count[i]; j++) {
                outItems[runningPosition] = inItems[i][j];
                runningPosition++;
            }
        }
        return outItems;
    }

    public boolean ok(Validatable[] values) {
        int errors = 0;
        for (int i = 0; i < values.length; i++) {
            if (!values[i].ok()) {
                errors++;
            }
        }
        if (errors == 0) {
            message = "";
        } else {
            if (errors == 1) {
                message = "An incorrect entry is marked in red";
            } else {
                message = errors + " incorrect entries are marked in red";
            }
        }
        return errors == 0;
    }

    public abstract boolean ok();

    public String getMessage() {
        return message;
    }

    public abstract Element getElement(Document doc);

}