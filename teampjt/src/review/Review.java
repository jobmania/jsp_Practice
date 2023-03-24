package review;

public class Review {
    private String subject;
    private String contents;
    private int starts;

    public Review() {

    }

    public Review(String subject, String contents, int starts) {
        this.subject = subject;
        this.contents = contents;
        this.starts = starts;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public int getStarts() {
        return starts;
    }

    public void setStarts(int starts) {
        this.starts = starts;
    }

    public String getContents() {
        return contents;
    }

    public void setContents(String contents) {
        this.contents = contents;
    }
}
