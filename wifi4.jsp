<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="java.io.*"%>

<html>
   <head>
      <meta charset="UTF-8">
      <title>전국와이파이데이터</title>
   </head>
   <body>
      <%
         BufferedReader br = null;
         try {
            String readtxt;
            String filePath = application.getRealPath("/123wifi.txt");
            br = new BufferedReader(new FileReader(filePath));
            if ((readtxt = br.readLine()) == null) {
               out.println("빈 파일입니다");
               return;
            }
            String[] field_name = readtxt.split("\t");
            out.println("<table border = 1>");
            out.println("<tr align=center>");
            out.println("<td>번호</td><td>" + field_name[10] + "</td><td>" + field_name[13] + "</td><td>" + field_name[14] + "</td><td>거리</td>");
            out.println("</tr>");
            
            double lat = 37.3860521;
            double lng = 127.1214038;
            Integer lineCnt = 0;
            Integer fromPT = Integer.parseInt(request.getParameter("fromPT"));
            Integer cntPT = Integer.parseInt(request.getParameter("cntPT"));
            while((readtxt = br.readLine())!= null) {
               
               if(lineCnt >= fromPT) {
                              
                  String[] field = readtxt.split("\t");
                  out.println("<tr align = center><td>" + lineCnt + "</td>");
                  out.println("<td>" + field[9] + "</td>");
                  out.println("<td>" + field[13] + "</td>");
                  out.println("<td>" + field[14] + "</td>");
                  double dist = Math.sqrt(Math.pow(Double.parseDouble(field[13])-lat,2) + Math.pow(Double.parseDouble(field[14])-lng,2));
                  out.println("<td>" + dist + "</td></tr>");
                  if (lineCnt > fromPT + cntPT - 2) break;
               } 
               
               
               lineCnt ++;   
               
               }
            out.println("</table>");   
            br.close();      
            
         } catch(Exception e) {
               out.println("error");
          } finally {
               if(br != null) try{br.close(); } catch (IOException e){}
         }
      %>
   </body>
</html>   