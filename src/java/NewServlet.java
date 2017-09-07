/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.PageContext;

/**
 *
 * @author Vlad
 */
public class NewServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    
    private static final String USERNAME = "root";
    private static final String PASSWORD = "root";
    private static final String CONN_STRING = "jdbc:mysql://localhost:3306/millionaire?zeroDateTimeBehavior=convertToNull";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException {
        response.setContentType("text/html;charset=UTF-8");

        Connection conn = null;
        Statement st = null;
        ResultSet rs = null;
        int questionId = Integer.parseInt(request.getParameter("qId"));
        HttpSession session = request.getSession();
        List<Question> ql;
        if(questionId<=10){
            try{
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection(CONN_STRING, USERNAME, PASSWORD);
                System.out.println("Connected to MySQL!");
                if(questionId==1 && request.getParameter("id")==null && request.getParameter("correct")==null){
                    ql = new ArrayList<>();
                    st= conn.createStatement();
                    String sql = "SELECT * FROM questions";
                    rs = st.executeQuery(sql);
                    while(rs.next()){
                        ql.add(new Question(rs.getInt("id"), rs.getString("text"), rs.getInt("answer_id")));
                    }
                    Collections.shuffle(ql);
                    session.setAttribute("ql", ql);
                }
                else {
                    ql=(List<Question>)session.getAttribute("ql");
                }
                String sql;
    //            st= conn.createStatement();
    //            
    //            sql = "SELECT * FROM questions WHERE id = "+questionId;
    //            
    //            rs = st.executeQuery(sql);
    //          
                Question q = null;
    //            if(rs.next()){
    //                q = new Question(rs.getInt("id"), rs.getString("text"), rs.getInt("answer_id"));
    //            }
                if(request.getParameter("id")!=null && request.getParameter("correct")!=null){
                    q=ql.get(questionId-1);
                }
                else {
                    q=ql.get(questionId-1);
                }
                request.setAttribute("q", q);

                st= conn.createStatement();
                sql = "SELECT * FROM answers WHERE question_id = "+q.getId();
                rs = st.executeQuery(sql);
                List<Answer> al = new ArrayList();
                while(rs.next()){
                    al.add(new Answer(rs.getInt("id"), rs.getString("text"), rs.getInt("is_right"), rs.getInt("question_id")));
                }
                request.setAttribute("al", al);
                conn.close();
            }
            catch (SQLException e) {
                System.err.println(e);
            }

            if(request.getParameter("id")!=null && request.getParameter("correct")!=null){
                int a = Integer.parseInt(request.getParameter("id"));
                int b = Integer.parseInt(request.getParameter("correct"));
                request.setAttribute("answered", true);
                if(a == b) {
                    request.setAttribute("correct", b);
                }
                else {
                    request.setAttribute("correct", b);
                    request.setAttribute("incorrect", a);
                }

            }
        }
        request.setAttribute("qId", questionId);
        request.setAttribute("gameStarted", true);
        request.getRequestDispatcher("page.jsp").forward(request, response);

        
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(NewServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(NewServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
    public class Question {
        int id;
        String text;
        int answerId;
        public Question(int id, String text, int answerId) {
            this.id=id;
            this.text=text;
            this.answerId=answerId;
        }
        public int getAnswerId() {
            return this.answerId;
        }
        public String getText() {
            return this.text;
        }
        public int getId() {
            return this.id;
        }
        @Override
        public String toString(){
            return "q"+this.id;
        }
    } 
    public class Answer {
        int id;
        String text;
        boolean right;
        int questionId;
        public String getText() {
            return this.text;
        }
        public int getId() {
            return this.id;
        }
        public Answer(int id, String text, int right, int questionId) {
            this.id=id;
            this.text=text;
            if(right==0){
                this.right=false;
            }
            else{
                this.right=true;
            }
            this.questionId=questionId;
        }
    } 
}
