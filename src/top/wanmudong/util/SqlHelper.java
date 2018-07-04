package top.wanmudong.util;

/**
 * Created by chenjiehao on 2018/6/26
 */


import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

public class SqlHelper {
    private static Connection ct = null;
    private static PreparedStatement ps = null;
    private static ResultSet rs = null;
    private static String driver = "";
    private static String url = "";
    private static String username = "";
    private static String password = "";
    private static Properties pp = null;
    private static InputStream fis = null;

    static {
        try {
            pp = new Properties();
            fis = SqlHelper.class.getClassLoader().getResourceAsStream("dbinfo.properties");
            pp.load(fis);
            driver = pp.getProperty("driver");
            url = pp.getProperty("url");
            username = pp.getProperty("username");
            password = pp.getProperty("password");
            Class.forName(driver);
        } catch (Exception var9) {
            var9.printStackTrace();
        } finally {
            if (fis != null) {
                try {
                    fis.close();
                } catch (IOException var8) {
                    var8.printStackTrace();
                }
            }

            fis = null;
        }

    }

    public SqlHelper() {
    }

    public static Connection getCt() {
        return ct;
    }

    public static PreparedStatement getPs() {
        return ps;
    }

    public static ResultSet getRs() {
        return rs;
    }

    public static Connection getConnection() {
        try {
            ct = DriverManager.getConnection(url, username, password);
        } catch (SQLException var1) {
            var1.printStackTrace();
        }

        return ct;
    }

    public static void close(Connection ct, PreparedStatement ps, ResultSet rs) {
        try {
            if (rs != null) {
                rs.close();
            }

            rs = null;
            if (ps != null) {
                ps.close();
            }

            ps = null;
            if (ct != null) {
                ct.close();
            }

            ct = null;
        } catch (SQLException var4) {
            var4.printStackTrace();
        }

    }

    public static void executeUpdate(String sql, Object[] parameters) {
        try {
            ct = getConnection();
            ps = ct.prepareStatement(sql);
            if (parameters != null) {
                for(int i = 0; i < parameters.length; ++i) {
                    ps.setObject(i + 1, parameters[i]);
                }
            }

            ps.executeUpdate();
        } catch (Exception var6) {
            var6.printStackTrace();
            throw new RuntimeException(var6.getMessage());
        } finally {
            close(ct, ps, rs);
        }

    }

    public static void executeUpdate2(String[] sql, String[][] parameters) {
        try {
            ct = getConnection();
            ct.setAutoCommit(false);
            if (sql != null) {
                for(int i = 0; i < sql.length; ++i) {
                    ps = ct.prepareStatement(sql[i]);
                    if (parameters[i] != null) {
                        for(int j = 0; j < parameters[i].length; ++j) {
                            ps.setObject(j + 1, parameters[i][j]);
                        }

                        ps.executeUpdate();
                    }
                }
            }

            ct.commit();
        } catch (Exception var9) {
            var9.printStackTrace();

            try {
                ct.rollback();
            } catch (SQLException var8) {
                var8.printStackTrace();
            }

            throw new RuntimeException(var9.getMessage());
        } finally {
            close(ct, ps, rs);
        }

    }

    public static ResultSet executeQuery(String sql, String[] parameters) {
        try {
            ct = getConnection();
            ps = ct.prepareStatement(sql);
            if (parameters != null && !parameters.equals("")) {
                for(int i = 0; i < parameters.length; ++i) {
                    ps.setObject(i + 1, parameters[i]);
                }
            }

            rs = ps.executeQuery();
            return rs;
        } catch (Exception var3) {
            var3.printStackTrace();
            throw new RuntimeException(var3.getMessage());
        }
    }
}
