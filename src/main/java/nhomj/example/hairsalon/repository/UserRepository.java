package nhomj.example.hairsalon.repository;

import  nhomj.example.hairsalon.model.User;
import org.springframework.stereotype.Repository;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.TypedQuery;
import java.util.List;
@Repository
public class UserRepository {
    @PersistenceContext
    private EntityManager entityManager;

    public User findByUsernameAndPassword(String username, String password) {
        TypedQuery<User> query = entityManager.createQuery("SELECT u FROM User u WHERE u.username = :username AND u.password = :password", User.class);
        query.setParameter("username", username);
        query.setParameter("password", password);

        List<User> users = query.getResultList();
        return users.isEmpty() ? null : users.get(0);
    }
}
