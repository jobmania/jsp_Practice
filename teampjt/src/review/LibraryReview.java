package review;

public class LibraryReview extends Review {
    private int id;

    private int libraryId;
    private int userId;

    public LibraryReview() {
    }

    public LibraryReview(String subject, String contents, int starts) {
        super(subject, contents, starts);
    }
}
