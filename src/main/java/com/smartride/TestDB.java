package com.smartride;

import com.smartride.dao.MotorcycleDAO;
import java.util.List;

public class TestDB {
    public static void main(String[] args) {
        MotorcycleDAO md = MotorcycleDAO.getInstance();
        List<String> disp = md.getListDisplacements();
        for (String d : disp) {
            System.out.println("Displacement: " + d);
        }
    }
}
