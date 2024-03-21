package elements;

import org.hibernate.annotations.Type;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "operation")
public class Operation {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private long id;

    @Column(name = "safety_tax")
    private int safetyTax = 0;
    @Column(name = "vehicle_num")
    private String vehicleNum;
    @Type(type = "true_false")
    @Column(name = "first_weight_automatic")
    private boolean firstWeightAutomatic;
    @Type(type = "true_false")
    @Column(name = "second_weight_automatic")
    private boolean secondWeightAutomatic;
    @Column(name = "maqtura_num")
    private String maqturaNum;
    @Column(name = "first_weight")
    private int firstWeight;
    @Column(name = "second_weight")
    private int secondWeight = 0;
    @Column(name = "net_weight")
    private int netWeight = 0;
    @Temporal(TemporalType.TIME)
    @Column(name = "start_time")
    private Date startTime = new Date();
    @Temporal(TemporalType.TIME)
    @Column(name = "end_time")
    private Date endTime;
    @Temporal(TemporalType.DATE)
    @Column(name = "start_date")
    private Date startDate = new Date();
    @Temporal(TemporalType.DATE)
    @Column(name = "end_date")
    private Date endDate;
    @Type(type = "true_false")
    @Column(name = "done")
    private boolean done = false;
    @ManyToOne
    private Client client;
    @ManyToOne
    private OperationType operationType;
    @ManyToOne
    private Goods goods;
    @ManyToOne
    private Ship ship;
    @ManyToOne
    private User user1;
    @ManyToOne
    private User user2;

    public Operation() {
    }

    public Operation(String vehicleNum, String maqturaNum, int firstWeight, boolean firstWeightAutomatic, Client client, Goods goods, Ship ship, User user) {
        this.vehicleNum = vehicleNum;
        this.firstWeight = firstWeight;
        this.maqturaNum = maqturaNum;
        this.client = client;
        this.goods = goods;
        this.firstWeightAutomatic = firstWeightAutomatic;
        this.ship = ship;
        this.user1 = user;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getVehicleNum() {
        return vehicleNum;
    }

    public void setVehicleNum(String vehicleNum) {
        this.vehicleNum = vehicleNum;
    }

    public int getFirstWeight() {
        return firstWeight;
    }

    public void setFirstWeight(int firstWeight) {
        this.firstWeight = firstWeight;
    }

    public int getSecondWeight() {
        return secondWeight;
    }

    public void setSecondWeight(int secondWeight) {
        this.secondWeight = secondWeight;
    }

    public int getNetWeight() {
        return netWeight;
    }

    public void setNetWeight(int netWeight) {
        this.netWeight = netWeight;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public String getMaqturaNum() {
        return maqturaNum;
    }

    public void setMaqturaNum(String maqturaNum) {
        this.maqturaNum = maqturaNum;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public boolean isDone() {
        return done;
    }

    public void setDone(boolean done) {
        this.done = done;
    }

    public Client getClient() {
        return client;
    }

    public void setClient(Client client) {
        this.client = client;
    }

    public OperationType getOperationType() {
        return operationType;
    }

    public void setOperationType(OperationType operationType) {
        this.operationType = operationType;
    }

    public Goods getGoods() {
        return goods;
    }

    public void setGoods(Goods goods) {
        this.goods = goods;
    }

    public boolean isFirstWeightAutomatic() {
        return firstWeightAutomatic;
    }

    public void setFirstWeightAutomatic(boolean firstWeightAutomatic) {
        this.firstWeightAutomatic = firstWeightAutomatic;
    }

    public boolean isSecondWeightAutomatic() {
        return secondWeightAutomatic;
    }

    public void setSecondWeightAutomatic(boolean secondWeightAutomatic) {
        this.secondWeightAutomatic = secondWeightAutomatic;
    }

    public User getUser1() {
        return user1;
    }

    public void setUser1(User user1) {
        this.user1 = user1;
    }

    public User getUser2() {
        return user2;
    }

    public void setUser2(User user2) {
        this.user2 = user2;
    }


    public Ship getShip() {
        return ship;
    }

    public void setShip(Ship ship) {
        this.ship = ship;
    }

    public String getWeightIcon(boolean isAutomatic) {
        if (isAutomatic) {
            return "<i class=\"fas fa-weight\"></i>";
        } else {
            return "<i class=\"fas fa-pencil-alt\"></i>";
        }
    }

    public int getEmptyWeight() {
        if (getFirstWeight() > getSecondWeight()) {
            return getSecondWeight();
        } else {
            return getFirstWeight();
        }
    }

    public int getNotEmptyWeight() {
        if (getFirstWeight() < getSecondWeight()) {
            return getSecondWeight();
        } else {
            return getFirstWeight();
        }
    }

    public int getSafetyTax() {
        return safetyTax;
    }

    public void setSafetyTax(int safetyTax) {
        this.safetyTax = safetyTax;
    }
}
