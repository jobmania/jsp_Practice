package review;

import java.sql.Date;

public class Review {

    private int id;

    private int userId;
    private String email;
    private int tableId; // item id
    private String tableName; // 테이블 명
    private String targetName; // item 이름
    private String subject;
    private String contents;
    private int stars;

    private Date reg_date;
    private Date mod_date;

    public Review(){
    }


    public Review(int id, int userId, String email, int tableId, String tableName,
                  String targetName, String subject, String contents, int stars,
                  Date reg_date, Date mod_date) {
        this.id = id;
        this.userId = userId;
        this.email = email;
        this.tableId = tableId;
        this.tableName = tableName;
        this.targetName = targetName;
        this.subject = subject;
        this.contents = contents;
        this.stars = stars;
        this.reg_date = reg_date;
        this.mod_date = mod_date;
    }

    public void update(int id, int userId, String email, int tableId, String tableName,
                       String targetName, String subject, String contents, int stars,
                       Date reg_date, Date mod_date){
        this.id = id;
        this.userId = userId;
        this.email = email;
        this.tableId = tableId;
        this.tableName = tableName;
        this.targetName = targetName;
        this.subject = subject;
        this.contents = contents;
        this.stars = stars;
        this.reg_date = reg_date;
        this.mod_date = mod_date;
    }


    public String getTargetName() {
        return targetName;
    }

    public void setTargetName(String targetName) {
        this.targetName = targetName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
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

    public int getTableId() {
        return tableId;
    }

    public void setTableId(int tableId) {
        this.tableId = tableId;
    }

    public String getTableName() {
        return tableName;
    }

    public void setTableName(String tableName) {
        this.tableName = tableName;
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

    public int getStars() {
        return stars;
    }

    public void setStars(int stars) {
        this.stars = stars;
    }

    public Date getReg_date() {
        return reg_date;
    }

    public void setReg_date(Date reg_date) {
        this.reg_date = reg_date;
    }

    public Date getMod_date() {
        return mod_date;
    }

    public void setMod_date(Date mod_date) {
        this.mod_date = mod_date;
    }
}
