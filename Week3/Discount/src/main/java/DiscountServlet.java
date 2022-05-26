import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.DataOutput;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "DiscountServlet", value = "/discount-amount")
public class DiscountServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        double listPrice = Double.parseDouble(request.getParameter("price"));
        double discountPercent = Double.parseDouble(request.getParameter("discount"));
        double discountAmount = listPrice * discountPercent * 0.01;

        PrintWriter writer = response.getWriter();
        writer.println("<html>");
        writer.println("Discount Amount: " + discountAmount);
        writer.println("Discount Price: " + (listPrice-discountAmount));
        writer.println("</html>");
    }
}
