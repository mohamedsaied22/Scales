package elements;

import javax.persistence.*;

@Entity
@Table(name = "client_goods", uniqueConstraints = @UniqueConstraint(columnNames = {"client_id", "goods_id"}))
public class ClientGoods {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private long id;
    @Column(name = "in_balance")
    private int inBalance = 0;
    @Column(name = "out_balance")
    private int outBalance = 0;
    @Column(name = "opening_balance")
    private int openingBalance = 0;
    @ManyToOne
    private Client client;
    @ManyToOne
    private Goods goods;

    public ClientGoods() {
    }

    public ClientGoods(Client client, Goods goods) {
        this.client = client;
        this.goods = goods;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public int getInBalance() {
        return inBalance;
    }

    public void setInBalance(int inBalance) {
        this.inBalance = inBalance;
    }

    public int getOutBalance() {
        return outBalance;
    }

    public void setOutBalance(int outBalance) {
        this.outBalance = outBalance;
    }


    public Client getClient() {
        return client;
    }

    public void setClient(Client client) {
        this.client = client;
    }

    public Goods getGoods() {
        return goods;
    }

    public void setGoods(Goods goods) {
        this.goods = goods;
    }

    public int getOpeningBalance() {
        return openingBalance;
    }

    public void setOpeningBalance(int openingBalance) {
        this.openingBalance = openingBalance;
    }
}
