package review;

import diner.Diner;

import java.nio.file.Paths;

public class DinerReview extends Review{
    private Diner diner;

    public DinerReview(){
    }

    public DinerReview(Diner diner) {
        this.diner = diner;
    }

    public Diner getDiner() {
        return diner;
    }

    public void setDiner(Diner diner) {
        this.diner = diner;
    }
}
