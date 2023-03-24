package review;

import diner.Diner;

import java.nio.file.Paths;

public class DinerReview extends Review{

    private int id;

    private int dinerId;
    private int userId;



    public DinerReview(){
    }

    public DinerReview(String subject, String contents, int starts) {
        super(subject, contents, starts);
    }

}
