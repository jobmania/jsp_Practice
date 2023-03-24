package review;

public class Review {

    private int id;

    private int userId;
    private String subject;
    private String contents;
    private int starts;

    private String reg_date;
    private String mod_date;

    public Review(){

    }


    public Review(int id, int userId, String subject, String contents, int starts, String reg_date, String mod_date) {
        this.id = id;
        this.userId = userId;
        this.subject = subject;
        this.contents = contents;
        this.starts = starts;
        this.reg_date = reg_date;
        this.mod_date = mod_date;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getContents() {
        return contents;
    }

    public void setContents(String contents) {
        this.contents = contents;
    }

    public int getStarts() {
        return starts;
    }

    public void setStarts(int starts) {
        this.starts = starts;
    }

    public String getReg_date() {
        return reg_date;
    }

    public void setReg_date(String reg_date) {
        this.reg_date = reg_date;
    }

    public String getMod_date() {
        return mod_date;
    }

    public void setMod_date(String mod_date) {
        this.mod_date = mod_date;
    }
}
