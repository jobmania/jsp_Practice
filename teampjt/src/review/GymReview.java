package review;

public class GymReview extends Review{
    private int id;

    private int gymId;
    private int userId;

    public GymReview() {
    }

    public GymReview(String subject, String contents, int starts) {
        super(subject, contents, starts);
    }
}
