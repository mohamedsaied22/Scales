package elements;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "user")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private long id;
    @Column(name = "username", unique = true)
    private String userName;
    @Column(name = "name")
    private String name;
    @Column(name = "password")
    private String password;
    @ManyToOne
    private Role role;
    @OneToMany(mappedBy = "user1")
    private List<Operation> operations1 = new ArrayList<>();
    @OneToMany(mappedBy = "user2")
    private List<Operation> operations2 = new ArrayList<>();

    public User() {
    }

    public User(String userName, String name, String password, Role role) {
        this.userName = userName;
        this.name = name;
        this.password = password;
        this.role = role;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }
}
