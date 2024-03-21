package elements;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "client")
public class Client {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private long id;
    @Column(name = "client")
    private String client;
    @OneToMany(mappedBy = "client")
    private List<Operation> operationList = new ArrayList<>();
    @OneToMany(mappedBy = "client")
    private List<ClientGoods> clientGoodsList = new ArrayList<>();

    public Client() {
    }

    public Client(String client) {
        this.client = client;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getClient() {
        return client;
    }


    public void setClient(String client) {
        this.client = client;
    }
}
