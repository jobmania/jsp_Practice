package review;

public class MachineReview extends Review {

    private int id;

    private int machineId;
    private int userId;

    public MachineReview() {
    }

    public MachineReview(String subject, String contents, int starts) {
        super(subject, contents, starts);
    }
}
