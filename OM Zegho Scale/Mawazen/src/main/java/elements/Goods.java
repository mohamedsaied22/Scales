package elements;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "goods")
public class Goods {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private long id;
    @Column(name = "goods")
    private String goods;
    @OneToMany(mappedBy = "goods")
    private List<Operation> operationList = new ArrayList<>();
    @OneToMany(mappedBy = "goods")
    private List<ClientGoods> clientGoods = new ArrayList<>();

    public Goods() {
    }

    public Goods(String goods) {
        this.goods = goods;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getGoods() {
        return goods;
    }

    public void setGoods(String goods) {
        this.goods = goods;
    }
}