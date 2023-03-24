package review;

public class CafeReview extends Review{

    private int id;

    private int cafeId;
    private int userId;

    public CafeReview() {
    }

    public CafeReview(String subject, String contents, int starts) {
        super(subject, contents, starts);
    }
}
