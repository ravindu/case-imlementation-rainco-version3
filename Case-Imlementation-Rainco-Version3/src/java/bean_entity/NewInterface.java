/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package bean_entity;

import com.mysql.jdbc.ResultSet;
import java.util.List;

/**
 *
 * @author Rajitha
 */
public interface NewInterface {
    public List<raw_m_final> rm_cal(ResultSet rs);
}
