package review;

public class HallReview extends Review{
    private int id;

    private int hallId;
    private int userId;

    public HallReview() {
    }

    public HallReview(String subject, String contents, int starts) {
        super(subject, contents, starts);
    }
}
